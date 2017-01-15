/*
 * Basic units.
 * 
 * Originally by Hans Häggström, 2010.
 * Dual licenced under Creative Commons Attribution-Share Alike 3.0 and LGPL2 or later
 */

//
// Internally, OpenSCAD uses arbitrary units, and the mapping from OpenSCAD
// units to real units is determined by the output pipeline.  No amount of code
// we write is going to change that.
//
// However, when building a design against external objects, it is useful to
// ensure that relative sizing is correct.  units.scad contains functions and
// constants for interoperation between measurement systems.
//

//
// Different choices for MCAD_BASE_UNIT.
//
MCAD_BASE_UNIT_MM = 1;
MCAD_BASE_UNIT_CM = 1 / 10;
MCAD_BASE_UNIT_DM = 1 / 100;
MCAD_BASE_UNIT_M  = 1 / 1000;
MCAD_BASE_UNIT_INCH = 1 / 25.4;
MCAD_BASE_UNIT_MIL  = 1000 * MCAD_BASE_UNIT_INCH;

//
// By default, we assume that we are working in millimeters.  However, users may
// override this choice by assigning MCAD_BASE_UNIT to the appropriate
// scaling factor
//
MCAD_BASE_UNIT = MCAD_BASE_UNIT_MM;

//
// Scale functions.
//
// Functions that map from a given scale to OpenSCAD's internal scale.  These
// should be the main means of expression units on quantities.
//
// Internally, they boil the given quantity down to its equivalent in
// millimeters, then use MCAD_BASE_UNIT to convert to OpenSCAD internal units.
//
// Parameters:
//
//  q: The quantity to associate with the named unit.
//
// Examples:
//
//   mm(12) + mil(100)  // 12 millimeters and 100 mils.
//

function mm(q) = MCAD_BASE_UNIT * q;

function cm(q) = mm(10 * q);
function dm(q) = mm(100 * q);
function  m(q) = mm(1000 * q);

function inch(q) =   mm(25.4 * q);
function  mil(q) = inch(q / 1000);
function foot(q) = inch(12 * q);
function yard(q) = inch(36 * q);

//
// Unit constants (deprecated).
//
// Multiplicative constants used to scale between the given units and OpenSCAD
// internal units.  Consider using the equivalent scale functions.
//

mm = mm(1);
cm = mm(10);
dm = mm(100);
 m = mm(1000);

inch = inch(1);

M3 = mm(3);
M4 = mm(4);
M5 = mm(5);
M6 = mm(6);
M8 = mm(8);

//
// MCAD's internal epsilon setting.
//
// Used by the MCAD library whenever a small distance is needed to overlap
// shapes for boolean cutting, etc.  The user may override it.
//
MCAD_EPSILON = mm(0.01);

//
// Unit vectors.
//
X = [1, 0, 0];
Y = [0, 1, 0];
Z = [0, 0, 1];
