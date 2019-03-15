/**
 * Render an object as well as its mirror.
 *
 * @param axis Vector representing axis to mirror().
 */
module mcad_mirror_duplicate(axis)
{
  children();

  mirror(axis) children();
}
