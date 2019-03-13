use <MCAD/shapes/polyhole.scad>
// @deprecated
module polyhole(h, d) mcad_polyhole(d, (h < 0) ? undef : h);
