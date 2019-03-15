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

/**
 * Duplicate children and apply transformations. There will be one copy of
 * children() per transformation matrix provided.
 *
 * @param transformations List of transformations to apply to children()
 * @Param keep_original Whether or not to show the original child
 */
module mcad_multiply (transformations, keep_original = true)
{
    if (keep_original)
        children ();

    for (t = transformations)
        multmatrix (t)
            children ();
}
