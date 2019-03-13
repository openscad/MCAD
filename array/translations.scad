
/*
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

use<MCAD / array / generic - multiply.scad>
    use<scad - utils / transformations.scad>

        /**
         * Convert vector of points to vector of translation matrices
         *
         * @param points Vector of points
         * @returns Vector of translation matrices
         **/
        function mcad_points2translations(points) = [for (point = points)
                translation(point)];

/**
 * Generate vector of points that represents grid
 *
 * @param grid_size 2- or 3-vector indicating grid size in terms of elements
 * @param separation 2- or 3-vector indicating separation in respective axes
 * @param center Boolean or vector indicating which axes to center
 */
function mcad_generate_grid(grid_size, separation, center = false) =
    (let(sep = len(separation) > 0 ? separation : [ 1, 1, 1 ] * separation,
         g = grid_size,
         center = len(center) > 0 ? center : [ center, center, center ],

         center_offset = [for (i = [0:len(g)])(center[i])
                              ? (g[i] - 1) * sep[i] / 2
                              : 0])

             (len(grid_size) == 2)
         ? [for (x = [0:g[0] - 1]) for (y = [0:g[1] -
                                               1])[x * sep[0], y* sep[1]] -
               center_offset]
         : (len(grid_size) == 3)
               ? [for (x = [0:g[0] - 1]) for (y = [0:g[1] - 1]) for (
                      z = [0:g[2] - 1])[x * sep[0], y* sep[1], z* sep[2]] -
                     center_offset]
               : []);

/**
 * Place children at points
 *
 * @param List of points.
 */
module mcad_place_at(points)
{
    mcad_multiply(mcad_points2translations(points), keep_original = false)
        children();
}

/**
 * Test mcad_place_at module
 */
module
mcad_test_place_at()
{
    mcad_place_at(mcad_generate_grid(
        [ 10, 10, 10 ], separation = $t * 10, center = true));
}
