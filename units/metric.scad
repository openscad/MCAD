include <MCAD/units/default.scad>
//       1         2         3         4         5         6         7
// 3456789012345678901234567890123456789012345678901234567890123456789012
/*
 * Metric units.
 *
 * Originally by Hans Häggström, 2010. With contributions from:
 * elmom (Elmo Mantynen <elmo.mantynen@iki.fi>)
 * kr2 (Krallinger Sebastian <s.krallinger+git@gmail.com>)
 * McNeight (Neil McNeight <mcneight+github@gmail.com>)
 *
 * Dual licenced under Creative Commons Attribution-Share Alike 3.0 and
 * LGPL2 or later
 */

// Default unit of measurement for length is the millimetre
length_mm = 1.0; // millimetre
function length_mm(quantity) = quantity * length_mm;

length_nm = 0.000001 * length_mm; // nanometre
function length_nm(quantity) = quantity * length_nm;

//! Commented out until https://github.com/openscad/openscad/issues/737
//! is resolved.
// length_µm = 0.001 * length_mm; // micrometre
// function length_µm(quantity) = quantity * length_µm;

length_um = 0.001 * length_mm; // micrometre (alternate)
function length_um(quantity) = quantity * length_um;

length_cm = 10.0 * length_mm; // centimetre
function length_cm(quantity) = quantity * length_cm;

length_dm = 100.0 * length_mm; // decimetre
function length_dm(quantity) = quantity * length_dm;

length_m = 1000.0 * length_mm; // metre
function m(quantity) = quantity * length_m;

length_dam = 10000.0 * length_mm; // decametre
function dam(quantity) = quantity * length_dam;

length_hm = 100000.0 * length_mm; // hectometre
function length_hm(quantity) = quantity * length_hm;

length_km = 1000000.0 * length_mm; // kilometre
function length_km(quantity) = quantity * length_km;

// For the purposes of compatibility with Chinese, Japanese and Korean
// (CJK) characters, Unicode has symbols for:
//    nanometre (㎚) - code U+339A
//    micrometre (㎛) - code U+339B
//    millimetre (㎜) - code U+339C
//    centimetre (㎝) - code U+339D
//    kilometre (㎞) - code U+339E
//! Commented out until https://github.com/openscad/openscad/issues/737
//! is resolved.
//㎚ = length_nm;
//㎛ = length_µm;
//㎜ = length_mm;
//㎝ = length_cm;
//㎞ = length_km;

X = [ 1, 0, 0 ];
Y = [ 0, 1, 0 ];
Z = [ 0, 0, 1 ];

M3 = 3 * length_mm;
M4 = 4 * length_mm;
M5 = 5 * length_mm;
M6 = 6 * length_mm;
M8 = 8 * length_mm;

// When a small distance is needed to overlap shapes for boolean
// cutting, etc.
//! Commented out until https://github.com/openscad/openscad/issues/737
//! is resolved.
// epsilon = 10.0 * length_µm;
epsilon = 10.0 * length_um;
OS = epsilon; // Over size
