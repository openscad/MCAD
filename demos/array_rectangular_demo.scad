include <MCAD/array/rectangular.scad>;

//center reference point 
translate([0,0,0])
#cube([5,5,5],center=true);

	//cubic array  of  5*5*5 objects spaced 10*10*10 center relative
array_rectangular(10,10,10,5,5,5,center=true)
{
	sphere(2.5,center=true,$fn=60);
	cylinder(h=10,r=.5,center=true);
	rotate([90,0,0])
		cylinder(h=10,r=.5,center=true);
	rotate([0,90,0])
		cylinder(h=10,r=.5,center=true);
}

//a linear array allong x can be derived from the cubic array simply 
	translate([60,0,0])
array_rectangular(10,0,0,5,1,1,center=false)
{
	cube([5,5,5],center=true);
} 
//a linear array allong y can be derived from the cubic array simply 
	translate([0,60,0])
array_rectangular(0,10,0,1,5,1,center=false)
{
	cube([5,5,5],center=true);
} 

//a linear array allong z can be derived from the cubic array simply 
	translate([0,0,60])
array_rectangular(0,0,10,1,1,5,center=false)
{
	cube([5,5,5],center=true);
} 

//a grid  array allong x,y can be derived from the cubic array simply 
	translate([0,0,-60])
array_rectangular(10,10,0,5,5,1,center=true)
{
	cube([5,5,5],center=true);
} 
