// THIS IS A BACKWARD COMPATIBILITY SHIM

include <MCAD/fasteners/nuts_and_bolts.scad>

// @deprecated
module
SKIPtestNutsAndBolts()
{
  mcad_test_nuts_and_bolts_1();
}

// @deprecated
module nutHole(size, units = MM, tolerance = +0.0001, proj = -1)
{
  mcad_nut_hole(size = size, tolerance = tolerance, proj = proj);
}

// @deprecated
module boltHole(size, units = MM, length, tolerance = +0.0001, proj = -1)
{
  mcad_bolt_hole(
    size = size, length = length, tolerance = tolerance, proj = proj);
}
