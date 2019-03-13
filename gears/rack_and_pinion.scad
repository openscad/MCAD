
// Rack and pinion gears GPL (c) SASA October 2013.
//
// Very simple rack and pinion gear based on GPL code.
//
// I've made corrections to both rack and gear code I used (below) and unified
// and simplified both bits of code.  Corrects the use of circular pitch so
// rack and pinion match nicely.  Ammendments to the code and interface to
// simplify use and improve readability. Many bells and whistles dropped in
// favour of being dead simple.  I also opted for hard wiring the pressure
// angle to 20 degrees since this seemed a kind of standard.
//
// Based on the works (thanks!): Parametric Involute Bevel and Spur Gears by
// GregFrost GNU GPL license.  http://www.thingiverse.com/thing:3575 Parametric
// Modular Rack by Mark "Ckaos" Moissette GNU GPL license.  (Rack based on the
// work of MattMoses and Fdavies
// http://forums.reprap.org/read.php?1,51452,52099#msg-52099 and Forrest Higgs:
//
// The originals have many fine additions such as helical gears which I've
// dropped in favour of simplicity (as befits my needs) - it wouldn't be a big
// jobs to nobble my changes backwards or their features forwards.

$fn = 50;

// examples of usage
// include this in your code:
// use <rack_and_pinion.scad>
// then:
// a simple rack
// rack(4,20,10,1);//CP (mm/tooth), width (mm), thickness(of base) (mm), # teeth
// a simple pinion and translation / rotation to make it mesh the rack
// translate([0,-8.5,0])rotate([0,0,360/10/2]) pinion(4,10,10,5);

include<MCAD / general / constants.scad>;

module rack(cp, N, width, thickness)
{
    // cp = circular pitch - for rack = pitch in mm/per tooth
    // N = number of teeth
    // width = width of rack
    // thickness = thickness of support under teeth (0 for no support)

    a = 1.0 * cp / const_pi; // addendum (also known as "module")
    d = 1.1 * cp / const_pi; // dedendum (this is set by a standard)
    height = (d + a);

    // find the tangent of pressure angle once
    tanPA = tan(20);
    // length of bottom and top horizontal segments of tooth profile
    botL = (cp / 2 - 2 * d * tanPA);
    topL = (cp / 2 - 2 * a * tanPA);

    slantLng = tanPA * height;
    realBase = 2 * slantLng + topL;

    offset = topL + botL + 2 * slantLng;
    length = (realBase + botL) * N;

    supportSize = width;
    translate([ botL / 2, 0, 0 ]) rotate([ 90, 0, 0 ])
    {
        translate([ 0, supportSize / 2, 0 ])
        {
            union()
            {
                cube(size = [ length, width, thickness ], center = true);
                for (i = [0:N - 1]) {
                    translate([
                        i * offset - length / 2 + realBase / 2,
                        0,
                        thickness / 2
                    ])
                    {
                        trapezoid([ topL, supportSize ],
                                  [ realBase, supportSize ],
                                  height);
                    }
                }
            }
        }
    }
}

module pinion(cp, N, width, shaft_diameter, backlash = 0)
{
    // cp= circular pitch - for pinion pitch in mm/per as measured along the
    // ptich radius (~1/2 way up tooth) N= number of teeth width= width of the
    // gear shaft_diameter= diameter of hole for shaft backlash - I think this
    // is just a bodge for making things fit when printed but I never tested it

    if (cp == false && diametral_pitch == false)
        echo("MCAD ERROR: pinion module needs either a diametral_pitch or cp");

    // Convert diametrial pitch to our native circular pitch
    cp = (cp != false ? cp : 180 / diametral_pitch);

    // Pitch diameter: Diameter of pitch circle.
    pitch_diameter = N * cp / const_pi;
    pitch_radius = pitch_diameter / 2;
    echo("Teeth:", N, " Pitch radius:", pitch_radius);
    // Base Circle
    base_radius = pitch_radius * cos(20);

    // Addendum: Radial distance from pitch circle to outside circle.
    addendum = cp / const_pi;

    // Outer Circle
    outer_radius = pitch_radius + addendum;

    // Dedendum: Radial distance from pitch circle to root diameter
    dedendum = addendum * 1.1;

    // Root diameter: Diameter of bottom of tooth spaces.
    root_radius = pitch_radius - dedendum;

    backlash_angle = backlash / pitch_radius * 180 / const_pi;
    half_thick_angle = (360 / N - backlash_angle) / 4;

    difference()
    {
        linear_extrude(height = width, convexity = 10, twist = 0)
            pinion_shape(N,
                         pitch_radius = pitch_radius,
                         root_radius = root_radius,
                         base_radius = base_radius,
                         outer_radius = outer_radius,
                         half_thick_angle = half_thick_angle,
                         involute_facets = 0);

        translate([ 0, 0, -1 ]) cylinder(r = shaft_diameter / 2, h = 2 + width);
    }

    echo("Root radius =",
         root_radius,
         "\nPitch radius=",
         pitch_radius,
         "\n Tip radius=",
         outer_radius,
         "\n");
}

module pinion_shape(N,
                    pitch_radius,
                    root_radius,
                    base_radius,
                    outer_radius,
                    half_thick_angle,
                    involute_facets)
{
    union()
    {
        rotate(half_thick_angle) circle($fn = N * 2, r = root_radius);
        for (i = [1:N]) {
            rotate([ 0, 0, i * 360 / N ])
            {
                involute_pinion_tooth(pitch_radius = pitch_radius,
                                      root_radius = root_radius,
                                      base_radius = base_radius,
                                      outer_radius = outer_radius,
                                      half_thick_angle = half_thick_angle,
                                      involute_facets = involute_facets);
            }
        }
    }
}

module involute_pinion_tooth(pitch_radius,
                             root_radius,
                             base_radius,
                             outer_radius,
                             half_thick_angle,
                             involute_facets)
{
    min_radius = max(base_radius, root_radius);

    pitch_point = involute(base_radius,
                           involute_intersect_angle(base_radius, pitch_radius));
    pitch_angle = atan2(pitch_point[1], pitch_point[0]);
    centre_angle = pitch_angle + half_thick_angle;

    start_angle = involute_intersect_angle(base_radius, min_radius);
    stop_angle = involute_intersect_angle(base_radius, outer_radius);

    res = (involute_facets != 0) ? involute_facets : ($fn == 0) ? 5 : $fn / 4;

    union()
    {
        for (i = [1:res])
            assign(point1 = involute(base_radius,
                                     start_angle + (stop_angle - start_angle) *
                                                       (i - 1) / res),
                   point2 = involute(base_radius,
                                     start_angle +
                                         (stop_angle - start_angle) * i / res))
            {
                assign(side1_point1 = rotate_point(centre_angle, point1),
                       side1_point2 = rotate_point(centre_angle, point2),
                       side2_point1 =
                           mirror_point(rotate_point(centre_angle, point1)),
                       side2_point2 =
                           mirror_point(rotate_point(centre_angle, point2)))
                {
                    polygon(points =
                                [
                                    [ 0, 0 ],
                                    side1_point1,
                                    side1_point2,
                                    side2_point2,
                                    side2_point1
                                ],
                            paths = [[ 0, 1, 2, 3, 4, 0 ]]);
                }
            }
    }
}

// Mathematical Functions
//===============

// Finds the angle of the involute about the base radius at the given distance
// (radius) from it's center.
// source:
// http://www.mathhelpforum.com/math-help/geometry/136011-circle-involute-solving-y-any-given-x.html

function involute_intersect_angle(base_radius, radius) =
    sqrt(pow(radius / base_radius, 2) - 1) * 180 / const_pi;

// Calculate the involute position for a given base radius and involute angle.

function rotated_involute(rotate, base_radius, involute_angle) = [
    cos(rotate) * involute(base_radius, involute_angle)[0] +
        sin(rotate) * involute(base_radius, involute_angle)[1],
    cos(rotate) * involute(base_radius, involute_angle)[1] -
        sin(rotate) * involute(base_radius, involute_angle)[0]
];

function mirror_point(coord) = [ coord[0], -coord[1] ];

function rotate_point(rotate, coord) = [
    cos(rotate) * coord[0] + sin(rotate) * coord[1],
    cos(rotate) * coord[1] - sin(rotate) * coord[0]
];

function involute(base_radius, involute_angle) = [
    base_radius * (cos(involute_angle) +
                   involute_angle * const_pi / 180 * sin(involute_angle)),
    base_radius*(sin(involute_angle) -
                 involute_angle * const_pi / 180 * cos(involute_angle))
];

module trapezoid(top, base, height)
{
    // echo ("test",base[0]);
    basePT1 = [ -base[0] / 2, base[1] / 2, 0 ];
    basePT2 = [ base[0] / 2, base[1] / 2, 0 ];
    basePT3 = [ base[0] / 2, -base[1] / 2, 0 ];
    basePT4 = [ -base[0] / 2, -base[1] / 2, 0 ];
    topPT1 = [ -top[0] / 2, top[1] / 2, height ];
    topPT2 = [ top[0] / 2, top[1] / 2, height ];
    topPT3 = [ top[0] / 2, -top[1] / 2, height ];
    topPT4 = [ -top[0] / 2, -top[1] / 2, height ];
    polyhedron(points =
                   [
                       basePT1,
                       basePT2,
                       basePT3,
                       basePT4,
                       topPT1,
                       topPT2,
                       topPT3,
                       topPT4
                   ],
               faces = [
                   [ 0, 1, 2 ],
                   [ 0, 2, 3 ],
                   [ 3, 7, 0 ],
                   [ 7, 4, 0 ],
                   [ 1, 6, 2 ],
                   [ 1, 5, 6 ],
                   [ 2, 6, 3 ],
                   [ 3, 6, 7 ],
                   [ 5, 1, 0 ],
                   [ 4, 5, 0 ],
                   [ 7, 5, 4 ],
                   [ 5, 7, 6 ]
               ]);
}
