use <MCAD/array/along_curve.scad>
include <MCAD/units/metric.scad>
// Copyright 2010 D1plo1d
// Copyright 2017 Chow Loong Jin <hyperair@debian.org>

// This library is dual licensed under the GPL 3.0 and the GNU Lesser General
// Public License as per http://creativecommons.org/licenses/LGPL/2.1/ .

module mcad_test_nuts_and_bolts_1 ()
{
	$fn = 360;

	translate ([0, 15])
		mcad_nut_hole (3, proj = -1);

	mcad_bolt_hole (3, length = 30,tolerance =10, proj = -1);

}
//mcad_test_nuts_and_bolts_1 ();

module mcad_test_nuts_and_bolts_2 ()
{
	$fn = 360;

	difference(){
		cube(size = [10, 20, 10], center = true);
		union(){
			translate ([0, 15])
				mcad_nut_hole (3, proj = 2);

			linear_extrude (height = 20, center = true, convexity = 10,
			                twist = 0)
			mcad_bolt_hole (3, length = 30, proj = 2);
		}
	}
}
//mcad_test_nuts_and_bolts_2 ();

module mcad_test_nuts_and_bolts_3 ()
{
	$fn = 360;

	mcad_bolt_hole_with_nut (
		size = 3,
		length = 10
	);
}

//mcad_test_nuts_and_bolts_3 ();

//Based on: http://www.roymech.co.uk/Useful_Tables/Screws/Hex_Screws.htm
METRIC_NUT_AC_WIDTHS =
[
	-1, //0 index is not used but reduces computation
	-1,
	4.32, //m2
	6.40,//m3
	8.10,//m4
	9.20,//m5
	11.50,//m6
	-1,
	15.00,//m8
	-1,
	19.60,//m10
	-1,
	22.10,//m12
	-1,
	-1,
	-1,
	27.70,//m16
	-1,
	-1,
	-1,
	34.60,//m20
	-1,
	-1,
	-1,
	41.60,//m24
	-1,
	-1,
	-1,
	-1,
	-1,
	53.1,//m30
	-1,
	-1,
	-1,
	-1,
	-1,
	63.5//m36
];

METRIC_NUT_THICKNESS =
[
	-1, //0 index is not used but reduces computation
	-1,
	1.6,//m2
	2.40,//m3
	3.20,//m4
	4.00,//m5
	5.00,//m6
	-1,
	6.50,//m8
	-1,
	8.00,//m10
	-1,
	10.00,//m12
	-1,
	-1,
	-1,
	13.00,//m16
	-1,
	-1,
	-1,
	16.00//m20
	-1,
	-1,
	-1,
	19.00,//m24
	-1,
	-1,
	-1,
	-1,
	-1,
	24.00,//m30
	-1,
	-1,
	-1,
	-1,
	-1,
	29.00//m36
];

METRIC_BOLT_CAP_DIAMETERS = [
	-1,
	-1,
	-1,
	5.5, // m3
	7, // m4
	8.5, // m5
	10, // m6
	-1,
	13, // m8
	-1,
	16, // m10
	-1,
	18, // m12
	-1,
	-1,
	-1,
	24, // m16
	-1,
	-1,
	-1,
	30, // m20
	-1,
	-1,
	-1,
	36 // m24
];

function mcad_metric_nut_ac_width (size) = METRIC_NUT_AC_WIDTHS[size];
function mcad_metric_nut_thickness (size) = METRIC_NUT_THICKNESS[size];
function mcad_metric_bolt_major_diameter (size) = size;
function mcad_metric_bolt_cap_height (size) = size;
function mcad_metric_bolt_cap_diameter (size) = (
	METRIC_BOLT_CAP_DIAMETERS[size]
);

module mcad_nut_hole (size, tolerance = +0.0001, proj = -1)
{
	//takes a metric screw/nut size and looksup nut dimensions
	radius = mcad_metric_nut_ac_width (size) / 2 + tolerance;
	height = mcad_metric_nut_thickness (size) + tolerance;

	if (proj == -1) {
		cylinder (r = radius, h = height, $fn = 6, center = [0, 0]);
	}

	else if (proj == 1) {
		circle(r = radius, $fn = 6);
	}

	else if (proj == 2)
	{
		translate ([-radius/2, 0])
			square ([radius*2, height]);
	}
}

module mcad_bolt_hole (size, length, cap_extra_length, tolerance = +0.0001,
                       proj = -1)
{
	radius = mcad_metric_bolt_major_diameter (size) / 2 + tolerance;

	cap_height = mcad_metric_bolt_cap_height (size) + tolerance;
	cap_radius = mcad_metric_bolt_cap_diameter (size) / 2 + tolerance;

	if (proj == -1)
	{
		translate([0, 0, -cap_height - cap_extra_length])
			cylinder(r = cap_radius, h = cap_height + cap_extra_length);
		cylinder(r = radius, h = length);
	}
	if (proj == 1)
	{
		circle(r = radius);
	}
	if (proj == 2)
	{
		translate([-cap_radius, - cap_height])
			square([cap_radius * 2, cap_height]);
		translate([-radius, 0])
			square([radius * 2, length]);
	}
}

/**
 * mcad_bolt_hole_with_nut - renders a cap screw hole with corresponding nut
 *
 * @param size Diameter of screw
 * @param length Fastened length (distance between screw and nut)
 * @param nut_projection Direction to project nut in (axial, radial)
 * @param align_with Alignment of whole set (above_head, below_head, center,
 *                                           below_nut, above_nut)
 */
module mcad_bolt_hole_with_nut (size, length, nut_projection = "axial",
                                align_with = "above_head",
                                screw_extra_length = 9999,
                                head_extra_length = 9999,
                                nut_projection_length = 100,
                                bolt_tolerance = 0.15,
                                nut_tolerance = 0.001)
{
	cap_head_d = mcad_metric_bolt_cap_diameter (size);
	cap_head_h = size;

	nut_thickness = mcad_metric_nut_thickness (size);

	elevation = (
		(align_with == "above_head") ? 0 :
		(align_with == "below_head") ? cap_head_h :
		(align_with == "center") ? cap_head_h + length / 2 :
		(align_with == "below_nut") ? cap_head_h + length :
		(align_with == "above_nut") ? cap_head_h + length + nut_thickness : 0
	);

	translate ([0, 0, -elevation]) {
		/* screw head */
		translate ([0, 0, cap_head_h])
		mcad_bolt_hole (size = size, length = length + screw_extra_length,
		                cap_extra_length = head_extra_length,
		                tolerance = bolt_tolerance);

		/* nut */
		translate ([0, 0, cap_head_h + length - epsilon])
		hull () {
			axis = (nut_projection == "axial") ? +Z : +X;

			mcad_linear_multiply (no = 2, separation = nut_projection_length,
			                      axis = axis)
			mcad_nut_hole (size = size, tolerance = nut_tolerance);
		}
	}
}
