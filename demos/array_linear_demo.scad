include <MCAD/array/linear.scad>;

//center reference point 
translate([0,0,0])
#cube([5,5,5],center=true);

array_linear(25)
{
	square([25,10]);
	square([25,10]);
	square([25,10]);
	square([25,10]);
	square([25,10]);
}

//cubic array  of  5*5*5 objects spaced 10*10*10 center relative
array_linear(20)
{
	sphere(2.5,center=true,$fn=60);
	cylinder(h=10,r=.5,center=true);
	rotate([90,0,0])
		cylinder(h=10,r=.5,center=true);
	rotate([0,90,0])
		cylinder(h=10,r=.5,center=true);
}

	translate([0,0,10])
array_linear_grid(30,15,false,3)
{
	square([25,10]);
	square([25,10]);
	square([25,10]);
	square([25,10]);
	square([25,10]);
	square([25,10]);
	square([25,10]);
	square([25,10]);
}
