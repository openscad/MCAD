include <MCAD/shapes/polyhole.scad>

module polyhole_demo(){
difference() {
	cube(size = [100,27,3]);
    union() {
    	for(i = [1:10]) {
            translate([(i * i + i)/2 + 3 * i , 8,-1])
                mcad_polyhole(h = 5, d = i);
                
            assign(d = i + 0.5)
                translate([(d * d + d)/2 + 3 * d, 19,-1])
                    mcad_polyhole(h = 5, d = d);
    	}
    }
}
}

polyhole_demo();
