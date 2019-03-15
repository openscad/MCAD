// module extrusion_openbeam_v1_generate_dxf()
//{
//	// Original STL has origin in lower left
//	translate([-7.5, -7.5, 0])
//	projection(cut = true)
// import("TL-400-0101-001CLR_-_OpenBeam_1515_Extrusion_Clear_Anodized.STL");
//	export("TL-400-0101-001.DXF");
//}

module extrusion_openbeam_v1(h)
{
  linear_extrude(height = h,
                 center = false,
                 convexity = 1,
                 twist = 0,
                 slices = 1,
                 scale = 1.0)
  {
    import("TL-400-0101-001.DXF");
  }
}

module extrusion_openbeam_v2(h){
  linear_extrude(height = h,
                 center = false,
                 convexity = 1,
                 twist = 0,
                 slices = 1,
                 scale = 1.0){ import("TL-400-0101-002.DXF");
}
}

// extrusion_openbeam_v1_generate_dxf();
*extrusion_openbeam_v1(30);
*translate([ 20, 0, 0 ]) extrusion_openbeam_v2(30, $fn = 36);
