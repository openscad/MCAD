include <MCAD/units/metric.scad>;

module metric_ruler(millimeters)
{
	difference()
	{
		// Body of ruler
		color("Beige")
		cube(size = [length_mm(millimeters), length_cm(3), length_mm(1)]);
		// Centimeter markings
		for (i = [0:length_cm(1):length_mm(millimeters) + epsilon])
		{
			translate([i,length_cm(2.5),length_mm(0.75)])
			color("Red")
			cube(size = [length_mm(0.5), length_cm(1) + epsilon, length_mm(0.5) + epsilon], center = true);
		}
		// Half centimeter markings
		for (i = [length_cm(0.5):length_cm(1):length_mm(millimeters) + epsilon])
		{
			translate([i,length_cm(2.7),length_mm(0.875)])
			color("Red")
			cube(size = [length_mm(0.5), length_cm(0.6) + epsilon, length_mm(0.25) + epsilon], center = true);
		}
		// Millimeter markings
		for (i = [length_mm(1):length_mm(1):length_mm(millimeters) + epsilon])
		{
			translate([i,length_cm(2.85),length_mm(0.9375)])
			color("Red")
			cube(size = [length_mm(0.5), length_cm(0.3) + epsilon, length_mm(0.125) + epsilon], center = true);
		}
	}
}

metric_ruler(100);
