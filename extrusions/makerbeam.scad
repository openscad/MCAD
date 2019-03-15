module extrusion_makerbeam(h)
{
	linear_extrude(height = h, center = false, convexity = 1, twist = 0, slices = 1, scale = 1.0)
	{
		import("MakerBeam_Cross_Section_Metric.DXF");
	}
}

*extrusion_makerbeam(30);
