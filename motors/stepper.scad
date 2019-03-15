/*
 * A nema standard stepper motor module.
 * 
 * Originally by Hans Häggström, 2010.
 * Dual licenced under Creative Commons Attribution-Share Alike 3.0 and LGPL2 or later
 */

include <MCAD/units/metric.scad>
include <MCAD/units/us.scad>
include <MCAD/materials/materials.scad>

// Parameters: 
NemaModel = 0;
NemaLengthShort = 1;
NemaLengthMedium = 2;
NemaLengthLong = 3;
NemaSideSize = 4;
NemaDistanceBetweenMountingHoles = 5;
NemaMountingHoleDiameter = 6;
NemaMountingHoleDepth = 7;
NemaMountingHoleLip = 8;
NemaMountingHoleCutoutRadius = 9;
NemaEdgeRoundingRadius = 10;
NemaRoundExtrusionDiameter = 11;
NemaRoundExtrusionHeight = 12;
NemaAxleDiameter = 13;
NemaFrontAxleLength = 14;
NemaBackAxleLength = 15;
NemaAxleFlatDepth = 16;
NemaAxleFlatLengthFront = 17;
NemaAxleFlatLengthBack = 18;

NemaA = 1;
NemaB = 2;
NemaC = 3;

NemaShort = NemaA;
NemaMedium = NemaB;
NemaLong = NemaC;

// TODO: The small motors seem to be a bit too long, I picked the size specs from all over the place, is there some canonical reference?
Nema08 = [
                [NemaModel, 8],
                [NemaLengthShort, 33*length_mm],
                [NemaLengthMedium, 43*length_mm],
                [NemaLengthLong, 43*length_mm],
                [NemaSideSize, 20*length_mm], 
                [NemaDistanceBetweenMountingHoles, 15.4*length_mm], 
                [NemaMountingHoleDiameter, 2*length_mm], 
                [NemaMountingHoleDepth, 1.75*length_mm], 
                [NemaMountingHoleLip, -1*length_mm], 
                [NemaMountingHoleCutoutRadius, 0*length_mm], 
                [NemaEdgeRoundingRadius, 2*length_mm], 
                [NemaRoundExtrusionDiameter, 16*length_mm], 
                [NemaRoundExtrusionHeight, 1.5*length_mm], 
                [NemaAxleDiameter, 4*length_mm], 
                [NemaFrontAxleLength, 13.5*length_mm], 
                [NemaBackAxleLength, 9.9*length_mm],
                [NemaAxleFlatDepth, -1*length_mm],
                [NemaAxleFlatLengthFront, 0*length_mm],
                [NemaAxleFlatLengthBack, 0*length_mm]
         ];

Nema11 = [
                [NemaModel, 11],
                [NemaLengthShort, 32*length_mm],
                [NemaLengthMedium, 40*length_mm],
                [NemaLengthLong, 52*length_mm],
                [NemaSideSize, 28*length_mm], 
                [NemaDistanceBetweenMountingHoles, 23*length_mm], 
                [NemaMountingHoleDiameter, 2.5*length_mm], 
                [NemaMountingHoleDepth, 2*length_mm], 
                [NemaMountingHoleLip, -1*length_mm], 
                [NemaMountingHoleCutoutRadius, 0*length_mm], 
                [NemaEdgeRoundingRadius, 2.5*length_mm], 
                [NemaRoundExtrusionDiameter, 22*length_mm], 
                [NemaRoundExtrusionHeight, 1.8*length_mm], 
                [NemaAxleDiameter, 5*length_mm], 
                [NemaFrontAxleLength, 13.7*length_mm], 
                [NemaBackAxleLength, 10*length_mm],
                [NemaAxleFlatDepth, 0.5*length_mm],
                [NemaAxleFlatLengthFront, 10*length_mm],
                [NemaAxleFlatLengthBack, 9*length_mm]
         ];

Nema14 = [
                [NemaModel, 14],
                [NemaLengthShort, 26*length_mm], 
                [NemaLengthMedium, 28*length_mm], 
                [NemaLengthLong, 34*length_mm], 
                [NemaSideSize, 35.3*length_mm], 
                [NemaDistanceBetweenMountingHoles, 26*length_mm], 
                [NemaMountingHoleDiameter, 3*length_mm], 
                [NemaMountingHoleDepth, 3.5*length_mm], 
                [NemaMountingHoleLip, -1*length_mm], 
                [NemaMountingHoleCutoutRadius, 0*length_mm], 
                [NemaEdgeRoundingRadius, 5*length_mm], 
                [NemaRoundExtrusionDiameter, 22*length_mm], 
                [NemaRoundExtrusionHeight, 1.9*length_mm], 
                [NemaAxleDiameter, 5*length_mm], 
                [NemaFrontAxleLength, 18*length_mm], 
                [NemaBackAxleLength, 10*length_mm],
                [NemaAxleFlatDepth, 0.5*length_mm],
                [NemaAxleFlatLengthFront, 15*length_mm],
                [NemaAxleFlatLengthBack, 9*length_mm]
         ];

Nema17 = [
                [NemaModel, 17],
                [NemaLengthShort, 33*length_mm],
                [NemaLengthMedium, 39*length_mm],
                [NemaLengthLong, 47*length_mm],
                [NemaSideSize, 42.20*length_mm], 
                [NemaDistanceBetweenMountingHoles, 31.04*length_mm], 
                [NemaMountingHoleDiameter, 4*length_mm], 
                [NemaMountingHoleDepth, 4.5*length_mm], 
                [NemaMountingHoleLip, -1*length_mm], 
                [NemaMountingHoleCutoutRadius, 0*length_mm], 
                [NemaEdgeRoundingRadius, 7*length_mm], 
                [NemaRoundExtrusionDiameter, 22*length_mm], 
                [NemaRoundExtrusionHeight, 1.9*length_mm], 
                [NemaAxleDiameter, 5*length_mm], 
                [NemaFrontAxleLength, 21*length_mm], 
                [NemaBackAxleLength, 15*length_mm],
                [NemaAxleFlatDepth, 0.5*length_mm],
                [NemaAxleFlatLengthFront, 15*length_mm],
                [NemaAxleFlatLengthBack, 14*length_mm]
         ];

Nema23 = [
                [NemaModel, 23],
                [NemaLengthShort, 39*length_mm],
                [NemaLengthMedium, 54*length_mm],
                [NemaLengthLong, 76*length_mm],
                [NemaSideSize, 56.4*length_mm], 
                [NemaDistanceBetweenMountingHoles, 47.14*length_mm], 
                [NemaMountingHoleDiameter, 4.75*length_mm], 
                [NemaMountingHoleDepth, 5*length_mm], 
                [NemaMountingHoleLip, 4.95*length_mm], 
                [NemaMountingHoleCutoutRadius, 9.5*length_mm], 
                [NemaEdgeRoundingRadius, 2.5*length_mm], 
                [NemaRoundExtrusionDiameter, 38.10*length_mm], 
                [NemaRoundExtrusionHeight, 1.52*length_mm], 
                [NemaAxleDiameter, 6.36*length_mm], 
                [NemaFrontAxleLength, 18.80*length_mm], 
                [NemaBackAxleLength, 15.60*length_mm],
                [NemaAxleFlatDepth, 0.5*length_mm],
                [NemaAxleFlatLengthFront, 16*length_mm],
                [NemaAxleFlatLengthBack, 14*length_mm]
         ];

Nema34 = [
                [NemaModel, 34],
                [NemaLengthShort, 66*length_mm],
                [NemaLengthMedium, 96*length_mm],
                [NemaLengthLong, 126*length_mm],
                [NemaSideSize, 85*length_mm], 
                [NemaDistanceBetweenMountingHoles, 69.58*length_mm], 
                [NemaMountingHoleDiameter, 6.5*length_mm], 
                [NemaMountingHoleDepth, 5.5*length_mm], 
                [NemaMountingHoleLip, 5*length_mm], 
                [NemaMountingHoleCutoutRadius, 17*length_mm], 
                [NemaEdgeRoundingRadius, 3*length_mm], 
                [NemaRoundExtrusionDiameter, 73.03*length_mm], 
                [NemaRoundExtrusionHeight, 1.9*length_mm], 
                [NemaAxleDiameter, 0.5*length_inch], 
                [NemaFrontAxleLength, 37*length_mm], 
                [NemaBackAxleLength, 34*length_mm],
                [NemaAxleFlatDepth, 1.20*length_mm],
                [NemaAxleFlatLengthFront, 25*length_mm],
                [NemaAxleFlatLengthBack, 25*length_mm]
         ];

NemaDefinitions = [
  -1,
  -1,
  -1,
  -1,
  -1,
  -1,
  -1,
  -1,
  Nema08,
  -1,
  -1,
  Nema11,
  -1,
  -1,
  Nema14,
  -1,
  -1,
  Nema17,
  -1,
  -1,
  -1,
  -1,
  -1,
  Nema23,
  -1,
  -1,
  -1,
  -1,
  -1,
  -1,
  -1,
  -1,
  -1,
  -1,
  Nema34 
];


function motorWidth(model=Nema23) = lookup(NemaSideSize, model);
function motorLength(model=Nema23, size=NemaMedium) = lookup(size, model);
function motorScrewSpacing(model=Nema23) = lookup(NemaDistanceBetweenMountingHoles, model);

function Nema(number) = NemaDefinitions[number];

module motor(model=Nema23, size=NemaMedium, dualAxis=false, pos=[0,0,0], orientation = [0,0,0]) {

  //motorDef = NemaDefinitions[model];
  //echo(model);
  motorDef = model;
  echo(motorDef);
  length = lookup(size, motorDef);

  echo(str("  Motor: Nema",lookup(NemaModel, motorDef),", length= ",length,"mm, dual axis=",dualAxis));

  stepperBlack    = BlackPaint;
  stepperAluminum = Aluminum;

  side = lookup(NemaSideSize, motorDef);

  cutR = lookup(NemaMountingHoleCutoutRadius, motorDef);
  lip = lookup(NemaMountingHoleLip, motorDef);
  holeDepth = lookup(NemaMountingHoleDepth, motorDef);

  axleLengthFront = lookup(NemaFrontAxleLength, motorDef);
  axleLengthBack = lookup(NemaBackAxleLength, motorDef);
  axleRadius = lookup(NemaAxleDiameter, motorDef) * 0.5;

  extrSize = lookup(NemaRoundExtrusionHeight, motorDef);
  extrRad = lookup(NemaRoundExtrusionDiameter, motorDef) * 0.5;

  holeDist = lookup(NemaDistanceBetweenMountingHoles, motorDef) * 0.5;
  holeRadius = lookup(NemaMountingHoleDiameter, motorDef) * 0.5;

  mid = side / 2;

  roundR = lookup(NemaEdgeRoundingRadius, motorDef);

  axleFlatDepth = lookup(NemaAxleFlatDepth, motorDef);
  axleFlatLengthFront = lookup(NemaAxleFlatLengthFront, motorDef);
  axleFlatLengthBack = lookup(NemaAxleFlatLengthBack, motorDef);

  color(stepperBlack){
    translate(pos) rotate(orientation) {
      translate([-mid, -mid, 0]) 
        difference() {          
          cube(size=[side, side, length + extrSize]);
 
          // Corner cutouts
          if (lip > 0) {
            translate([0,    0,    lip]) cylinder(h=length, r=cutR);
            translate([side, 0,    lip]) cylinder(h=length, r=cutR);
            translate([0,    side, lip]) cylinder(h=length, r=cutR);
            translate([side, side, lip]) cylinder(h=length, r=cutR);

          }

          // Rounded edges
          if (roundR > 0) {
                translate([mid+mid, mid+mid, length/2])
                  rotate([0,0,45])
                    cube(size=[roundR, roundR*2, 4+length + extrSize+2], center=true);
                translate([mid-(mid), mid+(mid), length/2])
                  rotate([0,0,45])
                    cube(size=[roundR*2, roundR, 4+length + extrSize+2], center=true);
                translate([mid+mid, mid-mid, length/2])
                  rotate([0,0,45])
                    cube(size=[roundR*2, roundR, 4+length + extrSize+2], center=true);
                translate([mid-mid, mid-mid, length/2])
                  rotate([0,0,45])
                    cube(size=[roundR, roundR*2, 4+length + extrSize+2], center=true);

          }

          // Bolt holes
          color(stepperAluminum, $fs=holeRadius/8) {
            translate([mid+holeDist,mid+holeDist]) cylinder(h=holeDepth+1*length_mm, r=holeRadius);
            translate([mid-holeDist,mid+holeDist]) cylinder(h=holeDepth+1*length_mm, r=holeRadius);
            translate([mid+holeDist,mid-holeDist]) cylinder(h=holeDepth+1*length_mm, r=holeRadius);
            translate([mid-holeDist,mid-holeDist]) cylinder(h=holeDepth+1*length_mm, r=holeRadius);

          } 

          // Grinded flat
          color(stepperAluminum) {
            difference() {
              translate([-1*length_mm, -1*length_mm, -1*length_mm]) 
                cube(size=[side+2*length_mm, side+2*length_mm, extrSize + 1*length_mm]);
              translate([side/2, side/2, -1.1*length_mm]) 
                cylinder(h=4*length_mm, r=extrRad);
            }
          }

        }

      // Axle
      translate([0, 0, extrSize-axleLengthFront]) color(stepperAluminum) 
        difference() {
                     
          cylinder(h=axleLengthFront + 1*length_mm , r=axleRadius, $fs=axleRadius/10);

          // Flat
          if (axleFlatDepth > 0)
            translate([axleRadius - axleFlatDepth,-5*length_mm,-extrSize*length_mm -(axleLengthFront-axleFlatLengthFront)] ) cube(size=[5*length_mm, 10*length_mm, axleLengthFront]);
        }

        if (dualAxis) {
          translate([0, 0, length+extrSize]) color(stepperAluminum) 
            difference() {
                     
              cylinder(h=axleLengthBack + 0*length_mm, r=axleRadius, $fs=axleRadius/10);

              // Flat
              if (axleFlatDepth > 0)
                translate([axleRadius - axleFlatDepth,-5*length_mm,(axleLengthBack-axleFlatLengthBack)]) cube(size=[5*length_mm, 10*length_mm, axleLengthBack]);
          }

        }

    }
  }
}

