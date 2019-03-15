include <MCAD/array/polar.scad>;
include <MCAD/array/rectangular.scad>;

//center reference point 
translate([0,0,0])
#cube([5,5,5],center=true);

	//radial array of 32 objects rotated though 10 degrees 
	translate([0,0,0])
array_polar(10,32,40)
{
	cube([2,4,6],center=true);
}

// a radial array of linear arrays 

	rotate([45,45,45])
array_polar(10,36,40)
{
	translate([0,10,0])
		array_rectangular(0,10,0,1,5,1,center=false)
		{
			cube([2,3,4],center=true);
			cylinder(h=10,r=.5,center=true);
			rotate([90,0,0])
				cylinder(h=10,r=.5,center=true);
		}
}

