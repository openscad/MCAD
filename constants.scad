include <general/constants.scad>;

echo("This file (MCAD/constants.scad) is depreciated and exists only to ensure compatibility with older scripts. Could you please update your script to include MCAD/general/constants.scad? At some point of time, the file MCAD/constants.scad will be deleted. Further more, we have a new naming scheme for MCAD constants. They begin with \"mcad_const_xyzName\".\n Thank you!");

// MIT license
// Author: Elmo Mäntynen

TAU = 6.2831853071; //2*PI, see http://tauday.com/
PI = TAU/2;

// translates a imperial measurement in inches to meters
mm_per_inch = 25.4;

