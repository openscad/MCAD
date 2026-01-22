/*
 * Dan Kirshner - dan_kirshner@yahoo.com
 * Chow Loong Jin - hyperair@debian.org
 *
 * You are welcome to make free use of this software.  Retention of my
 * authorship credit would be appreciated.
 *
 * Version 1.3.  2013-12-01   Correct loop over turns -- don't have early cut-off
 * Version 1.2.  2012-09-09   Use discrete polyhedra rather than linear_extrude()
 * Version 1.1.  2012-09-07   Corrected to right-hand threads!
 */

include <MCAD/general/constants.scad>

// Examples:

test_threads ();

module test_threads ($fa=5, $fs=0.1)
{
    // M8
    metric_thread(8, 1.5, 10);

    translate ([10, 0, 0])
    square_thread(8, 1.5, 10);

    translate ([20, 0, 0])
    acme_thread(8, 1.5, 10);

    translate ([30, 0, 0])
    buttress_thread(8, 1.5, 10);

    translate ([40, 0, 0])
    english_thread(1/4, 20, 1);

    // Rohloff hub thread:
    translate ([65, 0, 0])
    metric_thread(34, 1, 10, internal=true, n_starts=6);

    // Cylinder with internal M8 thread and chamfers
    translate ([95, 0, 0]) {
        let(OD = 12, T = 8, P = 1.25, L = 10) {
            difference() {
                cylinder(d=OD, h=L);
                chamfered_thread(L, internal = true) {
                    metric_thread(T, P, L);
                    chamfer_cylinder(T-2*P, T+0.5, internal = true);
                    chamfer_cylinder(T-2*P, T+0.5, internal = true);
                }
            }
        }
    }

}

// ----------------------------------------------------------------------------
use <MCAD/general/utilities.scad>
use <MCAD/general/sweep.scad>
use <MCAD/general/facets.scad>
use <scad-utils/transformations.scad>


// ----------------------------------------------------------------------------
// Metric Threads in accordance with ISO 68-1
// ----------------------------------------------------------------------------
// diameter  - nominal diameter of thread in mm. (e.g. 10 for an M10 thread)
// pitch     - distance in mm from the crest of one thread to the next.
// length    - overall axial length of thread in mm.
// internal  - true = clearances for internal thread (e.g., a nut).
//             false = clearances for external thread (e.g., a bolt).
//             (Internal threads should be "cut out" from a solid using
//             difference()).
// clearance - additional clearance to add in mm. Teeth are effectively
//             shifted inwards (outwards) for external (internal) threads by
//             this amount.
// n_starts  - Number of thread starts (e.g., DNA, a "double helix," has
//             n_starts=2).  See Wikipedia Screw_thread.
module metric_thread (
    diameter,
    pitch,
    length,
    internal = false,
    n_starts = 1,
    clearance
)
{
    // Tolerancing as per ISO 286
    // See https://en.wikipedia.org/wiki/IT_Grade
    function IT_grade (diameter, ITG) =
        assert(ITG>=1, "ITG has to be between 1 and 16")
        assert(ITG<=16, "ITG has to be between 1 and 16")
        let (i = 0.45 * pow(diameter, 1/3) + 0.001 * diameter)
            pow(10, 0.2*(ITG-1)) * i / 1000;

    // Fundamental deviations as per ISO 286. Formulas obtained from:
    // https://www.cobanengineering.com/Tolerances/ToleranceBand.asp
    function EI_es_g (diameter) = 2.5 * pow(diameter, 0.34) / 1000;

    theta = 60;                // V-shape angle, 60º for metric threads
    H = pitch/2/tan(theta/2);  // height of the V-shape
    clearance = (clearance != undef)
        ? clearance
        : internal
            ? IT_grade(diameter, 6)/2 + 0                  // H6
            : IT_grade(diameter, 6)/2 + EI_es_g(diameter); // g6
    D_maj = internal
        ? diameter + clearance
        : diameter - clearance;
    D_min = D_maj - 2*5/8*H;

    trapezoidal_thread (
        pitch = pitch,
        length = length,
        upper_angle = 30, lower_angle = 30,
        outer_flat_length = pitch / 8,
        major_radius = D_maj / 2,
        minor_radius = D_min / 2,
        internal = internal,
        n_starts = n_starts
    );
}

module square_thread (
    diameter = 8,
    pitch = 1,
    length = 1,
    internal = false,
    n_starts = 1
)
{
    trapezoidal_thread (
        pitch = pitch,
        length = length,
        upper_angle = 0, lower_angle = 0,
        outer_flat_length = pitch / 2,
        major_radius = diameter / 2,
        minor_radius = diameter / 2 - pitch / 2,
        internal = internal,
        n_starts = n_starts
    );
}

module acme_thread (
    diameter = 8,
    pitch = 1,
    length = 1,
    internal = false,
    n_starts = 1
)
{
    trapezoidal_thread (
        pitch = pitch,
        length = length,
        upper_angle = 29/2, lower_angle = 29/2,
        outer_flat_length = 0.3707 * pitch,
        major_radius = diameter / 2,
        minor_radius = diameter / 2 - pitch / 2,
        internal = internal,
        n_starts = n_starts
    );
}

module buttress_thread (
    diameter = 8,
    pitch = 1,
    length = 1,
    internal = false,
    n_starts = 1,
    buttress_angles = [3, 33],
    pitch_flat_ratio = 6,       // ratio of pitch to flat length
    pitch_depth_ratio = 3/2     // ratio of pitch to thread depth
)
{
    trapezoidal_thread (
        pitch = pitch,
        length = length,
        upper_angle = buttress_angles[0], lower_angle = buttress_angles[1],
        outer_flat_length = pitch / pitch_flat_ratio,
        major_radius = diameter / 2,
        minor_radius = diameter / 2 - pitch / pitch_depth_ratio,
        internal = internal,
        n_starts = n_starts
    );
}

/**
 * trapezoidal_thread():
 * generates a screw with a trapezoidal thread profile
 *
 * pitch = distance between the same part of adjacent teeth
 * length = length of the screw to generate
 * upper_angle = angle between the normal and the upper slant of a tooth
 * lower_angle = ditto, but for the lower slant
 * outer_flat_length = length of the flat part of the tooth along the outside
 * major_radius = radius of the screw until the outer flat
 * minor_radius = radius of the screw until the inner flat
 * internal = if true, generates a thread suitable for difference() to make nuts
 * n_starts = number of threads winding the screw
 */
module trapezoidal_thread (
    pitch,
    length,
    upper_angle,
    lower_angle,
    outer_flat_length,
    major_radius,
    minor_radius,
    internal = false,
    n_starts = 1
)
{
    // trapezoid calculation:
    /*
                upper flat
            ___________________
           /|                 |\
          / |                 | \
    left /__|_________________|__\ right
   angle|   |   lower flat    |   |angle
        |   |                 |   |
        |left                 |right
         flat                 |flat
    */
    // looking at the tooth profile along the upper part of a screw held
    // horizontally, which is a trapezoid longer at the bottom flat
    tooth_height = major_radius - minor_radius;
    left_angle = 90 - upper_angle;
    right_angle = 90 - lower_angle;
    upper_flat = outer_flat_length;
    left_flat = tooth_height / tan (left_angle);
    right_flat = tooth_height / tan (right_angle);
    lower_flat = upper_flat + left_flat + right_flat;
    clearance = 0.3/8 * tooth_height;

    tooth_profile = [
        [0, 0],
        [tooth_height + 0.001, right_flat],
        [tooth_height + 0.001, right_flat + upper_flat],
        [0, lower_flat]
    ];

    // convert length along the tooth profile to angle of twist of the screw
    function length2twist (length) = length / pitch * (360 / n_starts);
    function twist2length (angle) = angle / (360 / n_starts) * pitch;

    // facet calculation
    facets = get_fragments_from_r (minor_radius);
    fa = 360 / facets;

    slices = length2twist (length) / fa;

    path_transforms = [
        for (i=[0:slices + length2twist (pitch) / fa])
        let (a=i * fa)
        (
            rotation (axis=[0, 0, a]) *
            translation ([0, 0, twist2length (a) - pitch]) *
            translation ([minor_radius - 0.001, 0, 0]) *
            rotation (axis=[90, 0, 0])
        )
    ];

    cylinder (r=minor_radius, h=length);

    difference () {
        for (i=[0:n_starts])
        rotate ([0, 0, i / n_starts * 360])
        sweep (tooth_profile, path_transforms);

        translate ([0, 0, length + pitch / 2])
        cube ([major_radius * 2 + .1, major_radius * 2+ .1, pitch],
            center=true);

        translate ([0, 0, -pitch / 2])
        cube ([major_radius * 2 + .1, major_radius * 2+ .1, pitch],
            center=true);
    }
}

// ----------------------------------------------------------------------------
// Input units in inches.
// Note: units of measure in drawing are mm!
module english_thread(diameter=0.25, threads_per_inch=20, length=1,
                      internal=false, n_starts=1)
{
   // Convert to mm.
   mm_diameter = diameter*mcad_const_mm_per_inch; // diameter*25.4
   mm_pitch = (1.0/threads_per_inch)*mcad_const_mm_per_inch;
   mm_length = length*mcad_const_mm_per_inch;

   echo(str("mm_diameter: ", mm_diameter));
   echo(str("mm_pitch: ", mm_pitch));
   echo(str("mm_length: ", mm_length));
   metric_thread(mm_diameter, mm_pitch, mm_length, internal, n_starts);
}
