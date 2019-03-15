/*
MCAD triangles

- Copyright (C) 2013 Alex Davies
License: LGPL 2.1 or later

rightpyramid(rightpyramidx, rightpyramidy, rightpyramidz)
cornerpyramid(cornerpyramidx, cornerpyramidy, cornerpyramidz)
eqlpyramid(eqlpyramidx, eqlpyramidy, eqlpyramidz)
rightprism(rightprismx,rightprismy,rightprismz)
eqlprism(eqlprismx,eqlprismy,eqlprismz)

todo, make library work with negative lengths by adding triangles to the inside
of every surface. basicaly copy and paste the current triangles set and reverse
the first and last digit of every triangle. In 4 character triangles switch the
middle ones around as well. Not sure if that's actually useful though.

- Copyright Eero 'rambo' af Heurlin 2010-
triangle(o_len, a_len, depth)
a_triangle(tan_angle, a_len, depth)
*/

module rightpyramid(rightpyramidx, rightpyramidy, rightpyramidz)
{
  polyhedron(points =
               [
                 [ 0, 0, 0 ],
                 [ rightpyramidx, 0, 0 ],
                 [ 0, rightpyramidy, 0 ],
                 [ rightpyramidx, rightpyramidy, 0 ],
                 [ rightpyramidx / 2, rightpyramidy, rightpyramidz ]
               ],

             faces = [
               [ 0, 1, 2 ],
               [ 2, 1, 3 ],
               [ 4, 1, 0 ],
               [ 3, 1, 4 ],
               [ 2, 3, 4 ],
               [ 0, 2, 4 ]
             ]);
}

module cornerpyramid(cornerpyramidx, cornerpyramidy, cornerpyramidz)
{
  polyhedron(points =
               [
                 [ 0, 0, 0 ],
                 [ cornerpyramidx, 0, 0 ],
                 [ 0, cornerpyramidy, 0 ],
                 [ cornerpyramidx, cornerpyramidy, 0 ],
                 [ 0, cornerpyramidy, cornerpyramidz ]
               ],

             faces = [
               [ 0, 1, 2 ],
               [ 2, 1, 3 ],
               [ 4, 1, 0 ],
               [ 3, 1, 4 ],
               [ 2, 3, 4 ],
               [ 0, 2, 4 ]
             ]);
}

module eqlpyramid(eqlpyramidx, eqlpyramidy, eqlpyramidz)
{
  polyhedron(points =
               [
                 [ 0, 0, 0 ],
                 [ eqlpyramidx, 0, 0 ],
                 [ 0, eqlpyramidy, 0 ],
                 [ eqlpyramidx, eqlpyramidy, 0 ],
                 [ eqlpyramidx / 2, eqlpyramidy / 2, eqlpyramidz ]
               ],

             faces = [
               [ 0, 1, 2 ],
               [ 2, 1, 3 ],
               [ 4, 1, 0 ],
               [ 3, 1, 4 ],
               [ 2, 3, 4 ],
               [ 0, 2, 4 ]
             ]);
}

module rightprism(rightprismx, rightprismy, rightprismz)
{
  polyhedron(points =
               [
                 [ 0, 0, 0 ],
                 [ rightprismx, 0, 0 ],
                 [ rightprismx, rightprismy, 0 ],
                 [ 0, rightprismy, 0 ],
                 [ 0, rightprismy, rightprismz ],
                 [ 0, 0, rightprismz ]
               ],
             faces = [
               [ 0, 1, 2, 3 ],
               [ 5, 1, 0 ],
               [ 5, 4, 2, 1 ],
               [ 4, 3, 2 ],
               [ 0, 3, 4, 5 ]
             ]);
}

module eqlprism(eqlprismx, eqlprismy, eqlprismz)
{
  polyhedron(points =
               [
                 [ 0, 0, 0 ],
                 [ eqlprismx, 0, 0 ],
                 [ eqlprismx, eqlprismy, 0 ],
                 [ 0, eqlprismy, 0 ],
                 [ eqlprismx / 2, eqlprismy, eqlprismz ],
                 [ eqlprismx / 2, 0, eqlprismz ]
               ],
             faces = [
               [ 0, 1, 2, 3 ],
               [ 5, 1, 0 ],
               [ 5, 4, 2, 1 ],
               [ 4, 3, 2 ],
               [ 0, 3, 4, 5 ]
             ]);
}

/**
 * Standard right-angled triangle
 *
 * @param number o_len Lenght of the opposite side
 * @param number a_len Lenght of the adjacent side
 * @param number depth How wide/deep the triangle is in the 3rd dimension
 * @todo a better way ?
 */
module triangle(o_len, a_len, depth)
{
  linear_extrude(height = depth)
  {
    polygon(points = [ [ 0, 0 ], [ a_len, 0 ], [ 0, o_len ] ],
            paths = [[ 0, 1, 2 ]]);
  }
}

/**
 * Standard right-angled triangle (tangent version)
 *
 * @param number angle of adjacent to hypotenuse (ie tangent)
 * @param number a_len Lenght of the adjacent side
 * @param number depth How wide/deep the triangle is in the 3rd dimension
 */
module a_triangle(tan_angle, a_len, depth)
{
  linear_extrude(height = depth)
  {
    polygon(points = [ [ 0, 0 ], [ a_len, 0 ], [ 0, tan(tan_angle) * a_len ] ],
            paths = [[ 0, 1, 2 ]]);
  }
}

// Tests:
module
test_triangle()
{
  triangle(5, 5, 5);
}
module
test_a_triangle()
{
  a_triangle(45, 5, 5);
}
module
test_triangles()
{
  // Generate a bunch of triangles by sizes
  for (i = [1:10]) {
    translate([ i * 7, -30, i * 7 ])
    {
      triangle(i * 5, sqrt(i * 5 + pow(i, 2)), 5);
    }
  }

  // Generate a bunch of triangles by angle
  for (i = [1:85 / 5]) {
    translate([ i * 7, 22, i * 7 ]) { a_triangle(i * 5, 10, 5); }
  }
}
