/**
 * Calculate the number of facets to generate for radius `r`. This is intended
 * to mimic OpenSCAD's internal get_fragments_from_r() function.
 *
 * @param r Radius of circle
 */
function get_fragments_from_r(r) =
  (($fn > 0) ? $fn
             : (r < 0.00000095367431640625)
                 ? 3
                 : ceil(max(min(360 / $fa, r * 2 * PI / $fs), 5)));

/**
 * This is a function that generates a series of values ala $t for use as facet
 * IDs.
 *
 * @param r Radius of circle
 */
function gen_facet_series(r) = [0:1.0 / get_fragments_from_r(r):1.0001];

// example
translate([ 0, 0, 10 ]) linear_extrude(1) circle(10, $fn = 10);

linear_extrude(1) polygon([let(r = 10) for (t = gen_facet_series(r, $fn = 10))
    let(angle = t * 360)[cos(angle) * r, sin(angle) * r]]);
