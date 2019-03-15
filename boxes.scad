use <MCAD/shapes/3Dshapes.scad>

// @deprecated
module roundedBox(size, radius, sidesonly, center = true)
  mcad_rounded_box(size, radius, sidesonly, center);
