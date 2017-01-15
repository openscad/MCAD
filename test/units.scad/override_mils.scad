
// Test user-specified override of MCAD's base unit.
//
// We give mils a special test just to make sure we got the correction factors
// right.

include <../../units.scad>

// Override so that the base unit is mils
MCAD_BASE_UNIT = MCAD_BASE_UNIT_MIL;

if(mil(100) == 100)
{
    sphere(1);
}
else
{
    // Nothing
}
