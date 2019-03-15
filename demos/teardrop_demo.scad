include <MCAD/shapes/teardrop.scad>;

module teardrop_demo(){
    translate([0, -30, 0]) flat_teardrop(5, 20, 90);
    translate([0, -15, 0]) teardrop(5, 20, 90);
    translate([0, 0, 0]) teardrop(5, 20, 60);
    translate([0, 15, 0]) teardrop(5, 20, 45);
}

teardrop_demo();
