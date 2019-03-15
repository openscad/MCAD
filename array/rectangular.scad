/**
 * Copyright (C) 2016 Chow Loong Jin <hyperair@debian.org>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301  USA
 */

use <MCAD/array/translations.scad>
include <MCAD/units/metric.scad>

/**
 * Rectangular array, i.e. place objects on a grid. @see mcad_generate_grid
 *
 * @param grid_size 2- or 3-vector indicating grid size in terms of elements
 * @param separation 2- or 3-vector indicating separation in respective axes
 * @param center Boolean or vector indicating which axes to center
 */
module mcad_array_rectangular(grid_size, separation, center = true)
{
  mcad_place_at(mcad_generate_grid(
    grid_size = grid_size, separation = separation, center = center))
    children();
}

/**
 * Copyright by Elmo Mäntynen, 2012.
 * Make `no` copies of children along axis.
 *
 * @param no Number of copies
 * @param separation Separation between centers of adjacent copies
 * @param axis Direction to project toward
 */
module mcad_linear_multiply(no, separation, axis = Z, center = false)
{
  centering_offset = -1 * axis * (no - 1) * separation / 2;

  translate(center ? centering_offset : [ 0, 0, 0 ]) for (i = [0:no - 1])
    translate(i * separation * axis) children();
}
