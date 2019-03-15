/*
 *  OpenSCAD Layout Library (www.openscad.org)
 *  Copyright (C) 2012 Peter Uithoven
 *
 *  License: LGPL 2.1 or later
 */

module array_linear(iHeight)
{
  for (i = [0:$children - 1])
    translate([ 0, i * iHeight ]) children(i);
}

module array_linear_grid(iWidth, iHeight, inYDir = true, limit = 3)
{
  for (i = [0:$children - 1]) {
    translate([
      (inYDir) ? (iWidth) * (i % limit) : (iWidth)*floor(i / limit),
      (inYDir) ? (iHeight)*floor(i / limit) : (iHeight) * (i % limit)
    ]) children(i);
  }
}
