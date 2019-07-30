/* Kjell Morgenstern, 2019
*
*   This program is free software: you can redistribute it and/or modify
*   it under the terms of the GNU Lesser General Public License as published by
*   the Free Software Foundation, either version 3 of the License, or
*   (at your option) any later version.
*
*  Teardrop modules
*
*
*  With a simple teardrop, the problem occurs that it could weaken the walls at the top,
*  when cutting out a drop from a structure that is not much higher than the desirec cylinders
*  diameter. Using bridges is a good trick to avoid very flat overhangs and stay
*  closer to the cylindrical shape at the same time.
*
*  Parameter are named similar to openscad cylinders, and the default
*  orientation and behavoir should be as similar to cylinders as possible
*  Added bridged version optimized for FDM printers
*  Added cone version, to resemble openscad conical cylinder (r1, r2) feature

* min_a : The minimum slope angle. Most FDM printers/materials can not print overhangs
*         with a slope of less than 35 degree without support
*
* bridge_tolerance : Bridges tend to sink down a little in the center. This depends
*         on the length of the bridge, material, temprature, speed... .
*         By increasing the height of the bridge, this improves in two ways:
*         1. the brige will be shorter
*         2. the additional tolerance (e.g. half a layer hight) might be enough to compensate for
*         the sinking.
*         Don't use negative values.
*/

module teardrop(h, r, min_a=45, center) {
  linear_extrude(h, center=center) {
    hull() {
      circle(r);
      square([r / cos(min_a), 0.001]);
    }
  }
}


module bridged_teardrop(h, r, min_a=45, bridge_tolerance=0, center) {
  linear_extrude(h, center=center) {
    intersection() {
      hull() {
        circle(r);
        square([r / cos(min_a), 0.001]);
      }
      square([2* r + bridge_tolerance, 2* r], center = true);
    }
  }
}

module bridged_cone(h, r1, r2, min_a=45, bridge_tolerance=0, center) {
  linear_extrude(h, center=center, scale=r2/r1) {
    intersection() {
      hull() {
        circle(r1);
        square([r1 / cos(min_a), 0.001]);
      }
      square([2* r1 + bridge_tolerance , 2* r1], center = true);
    }
  }
}

// Just used during tests to generate some blocks which we can cut the teardrops from
module cube_helper(d=15) {

    difference() {
        translate([0,0,0]) cube([d/2,d,d]);
        translate([d/2+0.1,d/2,d/2]) rotate([0,-90,0]) children(0);
    }
}

/*
 * Simple intersection method to implement a flat/truncated teardrop
 */
module flat_teardrop(radius, length, angle) {
	intersection() {
		rotate([0, angle, 0]) {
			cube(size=[radius * 2, radius * 2, length], center=true);
		}
		teardrop(radius, length, angle);
	}
}

module test_teardrop(){
    s = 6;
    xd = s*4;
    translate([0, xd, 0])
    //45 degree drop
    cube_helper((s+2)*2-1) { teardrop(s+2, s, min_a=45); }

    //60 degree drop
    cube_helper((s+2)*2-1) { teardrop(s+2, s, min_a=60); }

    //30 degree drop (might be difficult to FDM print)
    translate([0, -xd, 0])
    cube_helper((s+2)*2-1) { teardrop(s+2, s, min_a=30); }

    translate([0, -xd*2, 0])
    // degenerate case: 90 degree means a normal circle
    cube_helper((s+2)*2-1) { teardrop(s+2, s, min_a=90); }

}

module test_bridged_teardrop(){
    s = 6;
    xd = s * 4;
    translate([xd*2, xd, 0])
    cube_helper((s+2)*2-1) { bridged_teardrop(s+2, s, min_a=45); }

    translate([xd*2, 0, 0])
    cube_helper((s+2)*2-1) { bridged_teardrop(s+2, s, min_a=60); }

}

module test_bridged_cone(){
    s = 6;
    xd = s * 4;
    translate([xd * 4, xd, 0])
    cube_helper((s+2)*2-1) { bridged_cone(s+2, r1=s*0.3, r2=s, min_a =45); }
}


// Example, uncomment to view
//$fn =  19;
//test_teardrop();
//test_bridged_teardrop();
//test_bridged_cone();