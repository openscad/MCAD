use <MCAD/array/translations.scad>
use <MCAD/general/utilities.scad>
include <MCAD/units/metric.scad>
use <scad-utils/transformations.scad>

/**
 * Generate polar coordinates for polar-arrayed objects
 *
 * @param angle Angle increment between each coordinate (negative is clockwise)
 * @param number Number of coordinates
 * @param radius Radius of coordinates
 */
function mcad_generate_polar_coords(angle, number, radius) = (let(
  total = angle * number)[for (i = [0:number - 1])[radius, i* total / number]]);

/**
 * Polar array, i.e. place objects in a circular arc
 *
 * @param angle Angle between each copy (negative is clockwise)
 * @param number Number of copies
 * @param radius Radius of array path
 */
module mcad_array_polar(angle, number, radius, preserve_orientation = false)
{
  polar_coords = mcad_generate_polar_coords(angle, number, radius);

  if (preserve_orientation)
    mcad_place_at([for (coord = polar_coords) conv2D_polar2cartesian(coord)])
      children();

  else
    for (coord = polar_coords)
      rotate(coord[1], Z) translate([ coord[0], 0 ]) children();
}

module
test_mcad_array_polar()
{
  mcad_array_polar(
    angle = 30, number = 3, radius = 10, preserve_orientation = true)
    cube(2, center = true);
}
