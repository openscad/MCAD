// Copyright 2010 D1plo1d

// This library is dual licensed under the GPL 3.0 and the GNU Lesser General Public License as per http://creativecommons.org/licenses/LGPL/2.1/ .

include <units.scad>

//testNutsAndBolts();

module SKIPtestNutsAndBolts()
{
	$fn = 360;
	translate([0,15])nutHole(3, proj=2);
	boltHole(3, length= 30, proj=2);
}

MM = "mm";
INCH = "inch"; //Not yet supported

//Based on: http://www.roymech.co.uk/Useful_Tables/Screws/Hex_Screws.htm
METRIC_NUT_AC_WIDTHS =
[
	-1, //0 index is not used but reduces computation
	-1,
	-1,
	mm(6.40),//m3
	mm(8.10),//m4
	mm(9.20),//m5
	mm(11.50),//m6
	-1,
	mm(15.00),//m8
	-1,
	mm(19.60),//m10
	-1,
	mm(22.10),//m12
	-1,
	-1,
	-1,
	mm(27.70),//m16
	-1,
	-1,
	-1,
	mm(34.60),//m20
	-1,
	-1,
	-1,
	mm(41.60),//m24
	-1,
	-1,
	-1,
	-1,
	-1,
	mm(53.1),//m30
	-1,
	-1,
	-1,
	-1,
	-1,
	mm(63.5)//m36
];
METRIC_NUT_THICKNESS =
[
	-1, //0 index is not used but reduces computation
	-1,
	-1,
	mm(2.40),//m3
	mm(3.20),//m4
	mm(4.00),//m5
	mm(5.00),//m6
	-1,
	mm(6.50),//m8
	-1,
	mm(8.00),//m10
	-1,
	mm(10.00),//m12
	-1,
	-1,
	-1,
	mm(13.00),//m16
	-1,
	-1,
	-1,
	mm(16.00)//m20
	-1,
	-1,
	-1,
	mm(19.00),//m24
	-1,
	-1,
	-1,
	-1,
	-1,
	mm(24.00),//m30
	-1,
	-1,
	-1,
	-1,
	-1,
	mm(29.00)//m36
];

COURSE_METRIC_BOLT_MAJOR_THREAD_DIAMETERS =
[//based on max values
	-1, //0 index is not used but reduces computation
	-1,
	-1,
	mm(2.98),//m3
	mm(3.978),//m4
	mm(4.976),//m5
	mm(5.974),//m6
	-1,
	mm(7.972),//m8
	-1,
	mm(9.968),//m10
	-1,
	mm(11.966),//m12
	-1,
	-1,
	-1,
	mm(15.962),//m16
	-1,
	-1,
	-1,
	mm(19.958),//m20
	-1,
	-1,
	-1,
	mm(23.952),//m24
	-1,
	-1,
	-1,
	-1,
	-1,
	mm(29.947),//m30
	-1,
	-1,
	-1,
	-1,
	-1,
	mm(35.940)//m36
];

module nutHole(size, units=MM, tolerance = +0.0001, proj = -1)
{
	//takes a metric screw/nut size and looksup nut dimensions
	radius = METRIC_NUT_AC_WIDTHS[size]/2+tolerance;
	height = METRIC_NUT_THICKNESS[size]+tolerance;
	if (proj == -1)
	{
		cylinder(r= radius, h=height, $fn = 6, center=[0,0]);
	}
	if (proj == 1)
	{
		circle(r= radius, $fn = 6);
	}
	if (proj == 2)
	{
		translate([-radius/2, 0])
			square([radius*2, height]);
	}
}

module boltHole(size, units=MM, length, tolerance = +0.0001, proj = -1)
{
	radius = COURSE_METRIC_BOLT_MAJOR_THREAD_DIAMETERS[size]/2+tolerance;
//TODO: proper screw cap values
	capHeight = METRIC_NUT_THICKNESS[size]+tolerance; //METRIC_BOLT_CAP_HEIGHTS[size]+tolerance;
	capRadius = METRIC_NUT_AC_WIDTHS[size]/2+tolerance; //METRIC_BOLT_CAP_RADIUS[size]+tolerance;

	if (proj == -1)
	{
	translate([0, 0, -capHeight])
		cylinder(r= capRadius, h=capHeight);
	cylinder(r = radius, h = length);
	}
	if (proj == 1)
	{
		circle(r = radius);
	}
	if (proj == 2)
	{
		translate([-capRadius/2, -capHeight])
			square([capRadius*2, capHeight]);
		square([radius*2, length]);
	}
}
