// Library: boxes.scad
// Version: 1.0
// Author: Marius Kintel, Sebastian Boschert
// Copyright: 2010
// License: 2-clause BSD License (http://opensource.org/licenses/BSD-2-Clause)

// 
// roundedCube([x, y, z], r, sidesonly=true/false, center=true/false);
// roundedCube(x, r, sidesonly=true/false, center=true/false);
// roundedCubeDual([x, y, z], r1, r2, center=true/false);
// roundedCubeDual(x, r1, r2, center=true/false);

// EXAMPLE USAGE:
// roundedCube([20, 30, 40], 5, true, true);
// roundedCubeDual([40, 40, 20], 2, 0.8, true);

// Only for backwards compatibility with existing scripts, (always centered, radius instead of consistent "r" naming.
module roundedBox(size, radius, sidesonly)
{
  echo("WARNING: roundedBox(size, radius, sidesonly) is deprecated, use roundedCube(size, r, sidesonly, center)");
  roundedCube(size, radius, sidesonly, true);
}

// New implementation
module roundedCube(size, r, sidesonly, center) {
  roundedCubeDual(size, r, sidesonly ? 0 : r, center);
}

// Even newer implementation with different horizontal and vertical radii
module roundedCubeDual(size, r1, r2, center) {
  s = is_list(size) ? size : [size,size,size];
  translate(center ? -s/2 : [0,0,0]) {
    if (r2 == 0) {
      hull() {
        translate([     r1,     r1]) cylinder(r=r1, h=s[2]);
        translate([     r1,s[1]-r1]) cylinder(r=r1, h=s[2]);
        translate([s[0]-r1,     r1]) cylinder(r=r1, h=s[2]);
        translate([s[0]-r1,s[1]-r1]) cylinder(r=r1, h=s[2]);
      }
    } else {
      resize_vector = [2*r1, 2*r1, 2*r2];
      hull() {
        translate([     r1,      r1,      r2]) resize(resize_vector) sphere(r=1);
        translate([     r1,      r1, s[2]-r2]) resize(resize_vector) sphere(r=1);
        translate([     r1, s[1]-r1,      r2]) resize(resize_vector) sphere(r=1);
        translate([     r1, s[1]-r1, s[2]-r2]) resize(resize_vector) sphere(r=1);
        translate([s[0]-r1,      r1,      r2]) resize(resize_vector) sphere(r=1);
        translate([s[0]-r1,      r1, s[2]-r2]) resize(resize_vector) sphere(r=1);
        translate([s[0]-r1, s[1]-r1,      r2]) resize(resize_vector) sphere(r=1);
        translate([s[0]-r1, s[1]-r1, s[2]-r2]) resize(resize_vector) sphere(r=1);
      }
    }
  }
}
