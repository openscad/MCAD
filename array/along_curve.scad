/*
 * Multiplication along certain curves
 *
 * Copyright by Elmo Mäntynen, 2012.
 * Licenced under LGPL2 or later
 */

include <MCAD/units/metric.scad>

/**
 * Place children $no times around $axis, with the first duplicate being unmoved
 * from its original spot. $angle is the angle of rotation between children(n)
 * and children(n-1).
 *
 * @param no Number of rotated copies to make
 * @param angle Angle of each rotation. Leave empty to assume 360° total
 *        rotation (default: undef)
 * @param axis Axis to rotate around (default: Z)
 */
module mcad_rotate_multiply (no, angle = undef, axis = Z)
{
    if (no > 0) {
        angle = (angle == undef) ? 360 / no : angle;

        for (i = [0:no - 1]) {
            rotate (angle * i, axis)
            children ();
        }
    }
}

/**
 * Duplicate object by rotating 180° around an axis
 *
 * @param axis Axis of rotation (default: Z)
 */
module mcad_duplicate (axis = Z)
{
    mcad_rotate_multiply (no = 2, axis = axis)
        children ();
}

