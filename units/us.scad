include <MCAD/units/metric.scad>
//       1         2         3         4         5         6         7
// 3456789012345678901234567890123456789012345678901234567890123456789012
/*
 * United States customary units.
 *
 * Originally by McNeight (Neil McNeight <mcneight+github@gmail.com>)
 *
 * Dual licenced under Creative Commons Attribution-Share Alike 3.0 and
 * LGPL2 or later
 */

/*
 * From
 * http://en.wikipedia.org/wiki/United_States_customary_units#Other_names_for_U.S._customary_units
 *
 * The United States Code refers to these units as "traditional systems
 * of weights and measures".
 *
 * Other common ways of referring to these systems in the United States
 * are: "Standard", "Customary", or, somewhat erroneously when considering
 * volume/tonnage, "Imperial", or "English", which refers to the pre-1824
 * reform measures used throughout the British Empire. Another term is the
 * "foot-pound-second" (FPS) system (as opposed to centimeter-gram-second
 * (CGS) system).
 *
 * Tools and fasteners with sizes measured in inches are sometimes called
 * "SAE bolts" or "SAE wrenches" to differentiate them from their metric
 * counterparts. The Society of Automotive Engineers originally developed
 * fasteners standards using U.S. units for the US auto industry; the
 * organization now uses metric units.
 */

/*
 * Conversion to metric is defined by Roberts, R.W. (February 3, 1975).
 * Federal Register republished in Barbrow, L.E. and Judson, L. V. (1976)
 * Weights and Measures of the United States. National Bureau of Standards
 * Special Publication 447. p. 36
 * http://physics.nist.gov/Pubs/SP447/app9.pdf
 */
length_inch = 25.4 * length_mm;
function length_inch(quantity) = quantity * length_inch;

length_in = length_inch;
function length_in(quantity) = quantity * length_in;

length_foot = 0.3048 * length_m;
function length_foot(quantity) = quantity * length_foot;

length_ft = length_foot;
function length_ft(quantity) = quantity * length_ft;

length_yard = 0.9144 * length_m;
function length_yard(quantity) = quantity * length_yard;

length_yd = length_yard;
function length_yd(quantity) = quantity * length_yd;

length_mile = 1609.344 * length_m;
function length_mile(quantity) = quantity * length_mile;

length_mi = length_mile;
function length_mi(quantity) = quantity * length_mi;

length_thou = 0.001 * length_inch;
function length_thou(quantity) = quantity * length_thou;

length_mil = 0.001 * length_inch;
function length_mil(quantity) = quantity * length_mil;

module inch_ruler(inches){ difference(){
    // Body of ruler
    color("Beige") cube(
        size = [ length_inch(inches), length_inch(1.125), length_thou(150) ]);
// Inch markings
for (i = [0:length_inch(1):length_inch(inches) + epsilon]) {
    translate([ i, length_inch(0.8875), length_thou(130) ]) color("Red")
        cube(size =
                 [
                     length_thou(20),
                     length_inch(0.475) + epsilon,
                     length_thou(40) +
                     epsilon
                 ],
             center = true);
}
// Half inch markings
for (i = [length_inch(0.5):length_inch(1):length_inch(inches)]) {
    translate([ i, length_inch(0.93125), length_thou(135) ]) color("Red")
        cube(size =
                 [
                     length_thou(20),
                     length_inch(0.3875) + epsilon,
                     length_thou(30) +
                     epsilon
                 ],
             center = true);
}
// Quarter inch markings
for (i = [length_inch(0.25):length_inch(0.5):length_inch(inches)]) {
    translate([ i, length_inch(1.0), length_thou(140) ]) color("Red")
        cube(size =
                 [
                     length_thou(20),
                     length_inch(0.25) + epsilon,
                     length_thou(20) +
                     epsilon
                 ],
             center = true);
}
// Eighth inch markings
for (i = [length_inch(0.125):length_inch(0.25):length_inch(inches)]) {
    translate([ i, length_inch(1.0375), length_thou(145) ]) color("Red")
        cube(size =
                 [
                     length_thou(20),
                     length_inch(0.175) + epsilon,
                     length_thou(10) +
                     epsilon
                 ],
             center = true);
}
}
}

*inch_ruler(4);
