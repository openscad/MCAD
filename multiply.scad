use <MCAD/array/along_curve.scad>
include <MCAD/units/metric.scad>
/**
 * @deprecated
 * Evenly place children `no` number of times around `axis` for `angle / 360`
 * turns,
 */
module spin(no, angle = 360, axis = Z)
{
    mcad_rotate_multiply(no, angle / no, axis) children();
}

/**
 * @deprecated
 * Duplicate by rotating a copy 180° around `axis`
 */
module duplicate(axis = Z)
{
    mcad_duplicate(axis = axis) children();
}

/**
 * @deprecated
 * Evenly multiply children `no` times by translating by `separation` distance
 * along `axis`.
 */
module linear_multiply(no, separation, axis = Z)
{
    mcad_linear_multiply(no = no, separation = separation, axis = axis)
        children();
}
