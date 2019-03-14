/*********************************
* OpenSCAD GridBeam Library      *
* (c) Timothy Schmidt 2013       *
* http://www.github.com/gridbeam *
* License: LGPL 2.1 or later     *
*********************************/

// To Do:
// integrate option to choose between imperial and metric gridbeam
// integrate option to set beam width (to 1, 1.5, or 2 inch if imperial, or 25, 40 or 50 mm if metric)
// integrate option to set length (in feet or meter, depending on whether imperial or metric gridbeam ); do this
// by having the script calculate out the required segments by this method: entered length / entered beam_width = number_of_segments
// A command to draw a horizontal gridbeam with 1 inch width and 4,5 feet length gridbeam should become: xBeam imperial 1 4,5
// ------

// A segment starts from 'the middle between 2 holes + the whole itself + the next middle between 2 holes' 
// Consequently, a segment equals the width of the beam (so one, one-and-a-half, or two inch with imperial gridbeam, or 25, 40 or 50 mm with metric grdbeam)

// zBeam(segments) - create a vertical gridbeam strut 'segments' long
// xBeam(segments) - create a horizontal gridbeam strut along the X axis
// yBeam(segments) - create a horizontal gridbeam strut along the Y axis

// To draw a bolt in the gridbeam, use the nuts_and_bolts.scad script or metric_fastners.scad script
// Use following sizes for bolts on imperial gridbeams:
// 11/32 inch bolt for 1 inch width gridbeam
// 5/16 inch bolt for 1,5 inch width gridbeam
// 3/8 inch bolt for 2 inch width gridbeam
// Use following sizes for bolts on metric gridbeams:
// 6 mm bolt for 25 mm width gridbeam
// 9 mm bolt for 40 mm width gridbeam
// 12 mm bolt for 50 mm width gridbeam

include <units.scad>

beam_width = inch * 1.5;
beam_hole_diameter = inch * 5/16;
beam_hole_radius = beam_hole_diameter / 2;
beam_is_hollow = 1;
beam_wall_thickness = inch * 1/8;
beam_shelf_thickness = inch * 1/4;

module zBeam(segments) {
	difference() {
		cube([beam_width, beam_width, beam_width * segments]);
		for(i = [0 : segments - 1]) {
			translate([beam_width / 2, beam_width + 1, beam_width * i + beam_width / 2])
			rotate([90,0,0])
			cylinder(r=beam_hole_radius, h=beam_width + 2);

			translate([-1, beam_width / 2, beam_width * i + beam_width / 2])
			rotate([0,90,0])
			cylinder(r=beam_hole_radius, h=beam_width + 2);
		}
	if (beam_is_hollow == 1) {
		translate([beam_wall_thickness, beam_wall_thickness, -1])
		cube([beam_width - beam_wall_thickness * 2, beam_width - beam_wall_thickness * 2, beam_width * segments + 2]);
	}
}

module xBeam(segments) {
	translate([0,0,beam_width])
	rotate([0,90,0])
	zBeam(segments);
}

module yBeam(segments) {
	translate([0,0,beam_width])
	rotate([-90,0,0])
	zBeam(segments);
}
