
include<MCAD / hardware / bearing.scad>;

// Example, uncomment to view
test_bearing();
translate([ 0, 40, 0 ]) test_bearing_hole();

module
test_bearing()
{
    bearing();
    bearing(pos = [ 5 * length_cm, 0, 0 ], angle = [ 90, 0, 0 ]);
    bearing(pos = [ -2.5 * length_cm, 0, 0 ], model = 624);
}

module
test_bearing_hole()
{
    difference()
    {
        translate([ 0, 0, 3.5 ])
            cube(size = [ 30, 30, 7 - 10 * epsilon ], center = true);
        bearing(outline = true);
    }
}