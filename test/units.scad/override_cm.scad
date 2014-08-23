
// Test user-specified override of MCAD's base unit.

include <../../units.scad>

// Override so that the base unit is centimeters.
MCAD_BASE_UNIT = MCAD_BASE_UNIT_CM;

// Hopefully, OpenSCAD will eventually gain an assert statement.
//
// For now, we use a poor man's assert.  If the condition is true, we emit some
// geometry.  If the condition is false, we don't.  If we don't emit geometry,
// OpenSCAD exits with a nonzero return value, which our test recipe counts as a
// failure.
if(mm(10) == 1)
{
    sphere(1);
}
else
{
    // Nothing
}
