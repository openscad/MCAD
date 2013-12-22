/*
 *  OpenSCAD 2D Shapes Library (www.openscad.org)
*/

use <../../layouts.scad>;

ngons();
module ngons() {
  grid(105,105,true,4){
    ngon(3, 50, center=false);
    ngon(4, 50, center=false);
    ngon(5, 50, center=false);
    ngon(6, 50, center=false);
    ngon(7, 50, center=false);
    ngon(8, 50, center=false);
    ngon(9, 50, center=false);
    ngon(10, 50, center=false);
  }
}

module ngon(sides, 
            radius, 
            center=false){
 rotate([0, 0, 180/sides]) 
    circle(r=radius, $fn=sides, center=center);
}