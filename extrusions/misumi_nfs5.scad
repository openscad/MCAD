//
module extrusion_misumi_nfs5_2525(h)
{
	linear_extrude(height = h, center = false, convexity = 1, twist = 0, slices = 1, scale = 1.0)
	{
		import("MISUMI/nfs5-2525.dxf");
	}
}

//
module extrusion_misumi_nfs5_2550(h)
{
	linear_extrude(height = h, center = false, convexity = 1, twist = 0, slices = 1, scale = 1.0)
	{
		import("MISUMI/nfs5-2550.dxf");
	}
}

//
module extrusion_misumi_nfs5_4060(h)
{
	linear_extrude(height = h, center = false, convexity = 1, twist = 0, slices = 1, scale = 1.0)
	{
		import("MISUMI/nfs5-4060.dxf");
	}
}

//
module extrusion_misumi_nfs5_4080(h)
{
	linear_extrude(height = h, center = false, convexity = 1, twist = 0, slices = 1, scale = 1.0)
	{
		import("MISUMI/nfs5-4080.dxf");
	}
}

extrusion_misumi_nfs5_2525(25);
translate([40,0,0]) extrusion_misumi_nfs5_2550(25);
translate([100,0,0]) extrusion_misumi_nfs5_4060(25);
translate([175,0,0]) extrusion_misumi_nfs5_4080(25);