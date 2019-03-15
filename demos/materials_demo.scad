include <MCAD/materials/materials.scad>

// Example, uncomment to view
color_demo();

module
color_demo()
{
  // Wood
  colorTest(Oak, 0, 0);
  colorTest(Pine, 1, 0);
  colorTest(Birch, 2, 0);

  // Metals
  colorTest(Iron, 0, 1);
  colorTest(Steel, 1, 1);
  colorTest(Stainless, 2, 1);
  colorTest(Aluminum, 3, 1);

  // Mixboards
  colorTest(FiberBoard, 0, 2);

  // Paints
  colorTest(BlackPaint, 0, 3);
}

module colorTest(col, row = 0, c = 0)
{
  color(col) translate([ row * 30, c * 30, 0 ]) sphere(r = 10);
}
