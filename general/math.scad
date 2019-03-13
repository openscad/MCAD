include <MCAD/general/constants.scad>
// MIT license

function deg(angle) = 360 * angle / const_tau;

// transformations.scad
// License: GNU LGPL 2.1 or later.
// © 2010 by Elmo Mäntynen

module local_scale(v, reference = [ 0, 0, 0 ])
{
    translate(-reference) scale(v) translate(reference) children(0);
}
