// Copyright 2011 Nophead (of RepRap fame)
// This file is licensed under the terms of Creative Commons Attribution 3.0
// Unported.

// Using this holes should come out approximately right when printed

module mcad_polyhole(d, h = undef, center = false)
{
  n = max(round(2 * d), 3);
  flat = (h == undef);

  rotate([ 0, 0, 180 ]) if (flat) circle(r = (d / 2) / cos(180 / n), $fn = n);
  else cylinder(h = h, r = (d / 2) / cos(180 / n), center = center, $fn = n);
}
