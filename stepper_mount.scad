// stepper twist mount 
// tigger@interthingy.com
// 201029061241

// twist clip stepper mount

// modes
// 0 -  base only
// 1 - socket only
// 2 - cutaway
// 3 - interference check
// 4 - single stl

mode = 4; 

// variables
nema = 17; 


bolt = 3;
size = 42;
hole_size = 30;
base_thickness = 6;
boss_radius = 15;
inner_hole_radius = 11.5;
mount_height = 20;

clip_depth = 15;
clip_thickness = 4;
slot_height = 15;

clip_count  = 6;

//extras


overlap = 0.1;
clearance = 0.1;
inc = 360/clip_count;
splitter = 150;

module pip()
{
	inc = 360/(2*clip_count);
	clip_rad =  boss_radius+clip_thickness/2-clip_thickness/2;
	difference()
	{
		translate([boss_radius+clip_thickness/2,0,clearance])
		cylinder(h=slot_height-2*clearance,r=clip_thickness/2-clearance/2);
		translate([0,0,-boss_radius-clip_thickness+slot_height-clearance])
		cylinder(h=boss_radius+clip_thickness+overlap,r1=0,r2=boss_radius+clip_thickness);
		translate([0,0,clearance])
		cylinder(h=boss_radius+clip_thickness+overlap*2,r2=0,r1=boss_radius+clip_thickness);
	}
}

module slot()
{
	inc = 360/(2*clip_count);
	clip_rad =  boss_radius+clip_thickness/2-clip_thickness/2;
	difference()
	{
		rotate([0,0,inc])
		translate([boss_radius+clip_thickness/2,0,0])
		cylinder(h=slot_height-overlap,r=clip_thickness/2);
		union()
		{
			translate([0,0,-boss_radius-clip_thickness+slot_height+overlap])
			cylinder(h=boss_radius+clip_thickness,r1=0,r2=boss_radius+clip_thickness);
			translate([0,0,-overlap])
			cylinder(h=boss_radius+clip_thickness+overlap*2,r2=0,r1=boss_radius+clip_thickness);
		}
	}
	difference()
	{
		union()
		{
			translate([boss_radius+clip_thickness/2,0,0])
			cylinder(h=clip_depth+overlap,r=clip_thickness/2);
			intersection()
			{
				intersection()
				{
					rotate(-90,[0,0,1])
					rotate(inc,[0,0,1])
					cube(size=boss_radius*4);
					cube(size=boss_radius*4);

				}
				difference()
				{
					cylinder(h=slot_height,r=boss_radius+clip_thickness+overlap);
					translate([0,0,-overlap])
					cylinder(h=slot_height+overlap*2, r=clip_rad);
					translate([0,0,-boss_radius-clip_thickness+slot_height+overlap])
					cylinder(h=boss_radius+clip_thickness,r1=0,r2=boss_radius+clip_thickness);
				}
			}
		}
		translate([0,0,-overlap])
		cylinder(h=boss_radius+clip_thickness+overlap*2,r2=0,r1=boss_radius+clip_thickness);
	}		
}

module pips()
{
	inc = 360/clip_count;
	for ( z = [1:clip_count])
	{       
		rotate(z*inc,[0,0,1])           
		pip();
	}
}

module slots()
{
	inc = 360/clip_count;
	for ( z = [1:clip_count])
	{       
		rotate(z*inc,[0,0,1])           
		slot();
	}
}

module bolt_hole()
{
	union()
	{
		cylinder(h=base_thickness*10,r=bolt/2,center=true);
//		translate([0,0,base_thickness*2])
//		cylinder(h=base_thickness*10,r=bolt,center=false);
	}	
}

module holes()
{
	union()
	{
		// bolt holes
		translate([hole_size/2,hole_size/2,-2*base_thickness])
		bolt_hole();
		translate([hole_size/2,-hole_size/2,-2*base_thickness])
		bolt_hole();
		translate([-hole_size/2,-hole_size/2,-2*base_thickness])
		bolt_hole();
		translate([-hole_size/2,hole_size/2,-2*base_thickness])
		bolt_hole();
	
		// center hole
		 cylinder(h = base_thickness+3*mount_height , r = inner_hole_radius, center=true);
	}
}

module socket_base()
{
	union()
		{
		difference()
		{
			cylinder(h=mount_height-clearance,r=boss_radius+clip_thickness);
			cylinder(h=mount_height-clearance,r=boss_radius+clip_thickness/2+clearance/2);
		}
		translate([0,0,(clip_depth-slot_height)])
		rotate([0,0,inc/2])
		pips();
	}
}

module twist_base()
{
	union()
	{
		difference()
		{
			translate([0,0,-overlap])
			cylinder(h=mount_height+overlap,r=boss_radius+clip_thickness/2);
			union()
			{
				translate([0,0,mount_height-clip_depth])
				slots();
			}
		}
	}
}

module base()
{
	
	difference()
	{
		union()
		{
			translate([0,0,base_thickness/2])
			cube( size = [size,size,base_thickness] , center = true);
			translate([0,0,base_thickness])
			twist_base();
		}
		holes();
	}
}

module socket()
{

	difference()
	{
		union()
		{
			translate([0,0,base_thickness/2])
			cube( size = [size,size,base_thickness] , center = true);
			translate([0,0,base_thickness])
			socket_base();
		}
		holes();
	}
}

module placed_socket()
{
	translate([0,0,2*base_thickness+mount_height])
	rotate([0,180,0])

	socket();
}

module splitter()
{
	// for checking internal layout
	translate([0,-splitter/2,-splitter/2])
	cube(splitter);
}

// modal display 

if ( mode == 0)
{
	base();
}

if (mode == 1)
{
	socket();
}

if ( mode == 2)
{
	rotate([0,0,inc/2])
	difference()
	{
		placed_socket();
		//socket();
		rotate([0,0,inc/2])
		splitter();
	}
	base();
}

if (mode == 3)
{
	intersection()
	{
		placed_socket();
		base();
	}
}

if( mode == 4)
{
	translate([size/2+5,0,0])
	socket();
	translate([-size/2-5,0,0])
	base();
}