use <MCAD/general/utilities.scad>
use <MCAD/shapes/polyhole.scad>
include <MCAD/units/metric.scad>
module mcad_rounded_cylinder(
    // same options as cylinder()
    r = undef,
    h = undef,
    d = undef,
    r1 = undef,
    r2 = undef,
    d1 = undef,
    d2 = undef,
    center = false,

    // rounding radius
    round_r = 0,
    round_r1 = 0,
    round_r2 = 0,
    slices = 0)
{
    // First resolve all the required values from arguments...
    r = (r == undef && d != undef) ? d / 2 : r;

    function resolve_numbered_radius(rN, dN) =
        ((rN == undef) ? ((dN != undef) ? dN / 2 : r) : rN);

    r1 = resolve_numbered_radius(r1, d1);
    r2 = resolve_numbered_radius(r2, d2);

    round_r1 = (round_r1 == 0) ? round_r : round_r1;
    round_r2 = (round_r2 == 0) ? round_r : round_r2;

    inv_gradient = (r2 - r1) / h;

    module trapezoid(top, bottom, h)
    {
        polygon([ [ 0, 0 ], [ 0, h ], [ top, h ], [ bottom, 0 ] ]);
    }

    module basic_section() { trapezoid(top = r2, bottom = r1, h = h); }

    module scale_at(factor, pos = [ 0, 0, 0 ])
    {
        translate(pos) scale(factor) translate(pos * -1) children();
    }

    module round_corner(r, pos)
    {
        offset(r = r, $fn = slices) offset(r = -r) scale_at(10, pos = pos)
            children();
    }

    translate([ 0, 0, center ? -h / 2 : 0 ]) rotate_extrude() hull()
    {
        intersection()
        {
            union()
            {
                difference()
                {
                    round_corner(round_r2, [ r2, h ]) basic_section();

                    translate([ -epsilon, -epsilon ]) square([
                        max(r1, r2) + epsilon * 2,
                        max(epsilon, round_r1 + epsilon)
                    ]);
                }

                difference()
                {
                    round_corner(round_r1, [ r1, 0 ]) basic_section();

                    translate([ -epsilon, h + epsilon ]) mirror(Y)
                        square([ max(r1, r2) + epsilon * 2, round_r2 ]);
                }
            }

            basic_section();
        }
    }
}

module mcad_tube(od, id, h = undef){ linear_extrude_if(h != undef, height = h)
                                         difference(){ circle(d = od);
mcad_polyhole(d = id);
}
}

*mcad_rounded_cylinder(r1 = 3,
                       r2 = 10,
                       h = 40,
                       round_r1 = 3,
                       round_r2 = 10,
                       slices = 100);
*mcad_rounded_cylinder(r = 3, h = 40, round_r1 = 3, slices = 100);
