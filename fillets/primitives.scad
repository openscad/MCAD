test_fillet_primitives ();

module test_fillet_primitives ($fa=5, $fs=0.1)
{
	 mcad_fillet_primitive(60, 5);
}

/**
 * mcad_fillet_primitive(float angle, float radius)
 *
 * Creates a 2D fillet shape in the +X +Y quadrant with the given joint angle
 * and fillet radius. Can be used as a primitive to make filleted joints.
 *
 * @param angle Joint angle
 * @param radius Fillet radius
 */
module mcad_fillet_primitive (angle, radius)
{
	half_angle = 0.5 * angle;
	chord_corner_dist = radius * cos(half_angle) / tan(half_angle);
	chord_centre_dist = radius * sin(half_angle);

	corner_centre_dist = chord_centre_dist + chord_corner_dist;

	triangle_base = chord_corner_dist / cos(half_angle);

    assert(angle < 180, "fillet_shape() does not support angles above 180°");

	difference () {
		polygon (
            [
                [0, 0],
                [triangle_base, 0],
                [triangle_base * cos(angle), triangle_base * sin(angle)]
            ]
        );

		translate ([corner_centre_dist * cos(half_angle),
		            corner_centre_dist * sin(half_angle)])
            circle (r = radius);
	}
}
