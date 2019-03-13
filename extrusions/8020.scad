

module
profile_8020_fractional_1010()
{
    profile_tslot_generic(pitch = 1,
                          slot = 0.26,
                          lip = 0.1,
                          web = 0.13,
                          core = 0.45,
                          hole = 0.28);
}

//
module extrusion_8020_1001(h)
{
    linear_extrude(height = h,
                   center = false,
                   convexity = 1,
                   twist = 0,
                   slices = 1,
                   scale = 1.0)
    {
        import("8020/8020-1001.dxf");
    }
}

//
module extrusion_8020_1002(h)
{
    linear_extrude(height = h,
                   center = false,
                   convexity = 1,
                   twist = 0,
                   slices = 1,
                   scale = 1.0)
    {
        import("8020/8020-1002.dxf");
    }
}

//
module extrusion_8020_1003(h)
{
    linear_extrude(height = h,
                   center = false,
                   convexity = 1,
                   twist = 0,
                   slices = 1,
                   scale = 1.0)
    {
        import("8020/8020-1003.dxf");
    }
}

//
module extrusion_8020_1004(h)
{
    linear_extrude(height = h,
                   center = false,
                   convexity = 1,
                   twist = 0,
                   slices = 1,
                   scale = 1.0)
    {
        import("8020/8020-1004.dxf");
    }
}

module 8020_line_up_and_wait()
{
    extrusion_8020_1001(20, $fn = 36);
    translate([ 30, 0, 0 ]) extrusion_8020_1002(20, $fn = 36);
    translate([ 60, 0, 0 ]) extrusion_8020_1003(20, $fn = 36);
    translate([ 90, 0, 0 ]) extrusion_8020_1004(20, $fn = 36);
}

8020_line_up_and_wait();