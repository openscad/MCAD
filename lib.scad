<openscad/shapes.scad>
// adapted from shapes.scad
module ovalTube(w,h,d,wall) {
        difference(){
                scale ([w/100, h/100, 1]) cylinder(d, 50, 50);
                translate([0, 0, -0.1])
                    scale([w/100, h/100, 1.1]) cylinder(d, 50-wall, 50-wall);
        }
}

