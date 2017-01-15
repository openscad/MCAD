/*
 * A nema standard stepper motor module.
 * 
 * Originally by Hans Häggström, 2010.
 * Dual licenced under Creative Commons Attribution-Share Alike 3.0 and LGPL2 or later
 */

include <units.scad>
include <materials.scad>


// Demo, uncomment to show:
//nema_demo();

module nema_demo(){
    for (size = [NemaShort, NemaMedium, NemaLong]) {  
      translate([-100,size*100,0]) motor(Nema34, size, dualAxis=true);
      translate([0,size*100,0])    motor(Nema23, size, dualAxis=true);
      translate([100,size*100,0])  motor(Nema17, size, dualAxis=true);
      translate([200,size*100,0])  motor(Nema14, size, dualAxis=true);
      translate([300,size*100,0])  motor(Nema11, size, dualAxis=true);
      translate([400,size*100,0])  motor(Nema08, size, dualAxis=true);
    }
}


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
                [NemaLengthShort,                  mm( 33    )],
                [NemaLengthMedium,                 mm( 43    )],
                [NemaLengthLong,                   mm( 43    )],
                [NemaSideSize,                     mm( 20    )],
                [NemaDistanceBetweenMountingHoles, mm( 15.4  )],
                [NemaMountingHoleDiameter,         mm(  2    )],
                [NemaMountingHoleDepth,            mm(  1.75 )],
                [NemaMountingHoleLip,              mm(- 1    )],
                [NemaMountingHoleCutoutRadius,     mm(  0    )],
                [NemaEdgeRoundingRadius,           mm(  2    )],
                [NemaRoundExtrusionDiameter,       mm( 16    )],
                [NemaRoundExtrusionHeight,         mm(  1.5  )],
                [NemaAxleDiameter,                 mm(  4    )],
                [NemaFrontAxleLength,              mm( 13.5  )],
                [NemaBackAxleLength,               mm(  9.9  )],
                [NemaAxleFlatDepth,                mm(- 1    )],
                [NemaAxleFlatLengthFront,          mm(  0    )],
                [NemaAxleFlatLengthBack,           mm(  0    )]
         ];

Nema11 = [
                [NemaModel, 11],
                [NemaLengthShort,                  mm( 32   )],
                [NemaLengthMedium,                 mm( 40   )],
                [NemaLengthLong,                   mm( 52   )],
                [NemaSideSize,                     mm( 28   )],
                [NemaDistanceBetweenMountingHoles, mm( 23   )],
                [NemaMountingHoleDiameter,         mm(  2.5 )],
                [NemaMountingHoleDepth,            mm(  2   )],
                [NemaMountingHoleLip,              mm(- 1   )],
                [NemaMountingHoleCutoutRadius,     mm(  0   )],
                [NemaEdgeRoundingRadius,           mm(  2.5 )],
                [NemaRoundExtrusionDiameter,       mm( 22   )],
                [NemaRoundExtrusionHeight,         mm(  1.8 )],
                [NemaAxleDiameter,                 mm(  5   )],
                [NemaFrontAxleLength,              mm( 13.7 )],
                [NemaBackAxleLength,               mm( 10   )],
                [NemaAxleFlatDepth,                mm(  0.5 )],
                [NemaAxleFlatLengthFront,          mm( 10   )],
                [NemaAxleFlatLengthBack,           mm(  9   )]
         ];

Nema14 = [
                [NemaModel, 14],
                [NemaLengthShort,                  mm( 26   )],
                [NemaLengthMedium,                 mm( 28   )],
                [NemaLengthLong,                   mm( 34   )],
                [NemaSideSize,                     mm( 35.3 )],
                [NemaDistanceBetweenMountingHoles, mm( 26   )],
                [NemaMountingHoleDiameter,         mm(  3   )],
                [NemaMountingHoleDepth,            mm(  3.5 )],
                [NemaMountingHoleLip,              mm(- 1   )],
                [NemaMountingHoleCutoutRadius,     mm(  0   )],
                [NemaEdgeRoundingRadius,           mm(  5   )],
                [NemaRoundExtrusionDiameter,       mm( 22   )],
                [NemaRoundExtrusionHeight,         mm(  1.9 )],
                [NemaAxleDiameter,                 mm(  5   )],
                [NemaFrontAxleLength,              mm( 18   )],
                [NemaBackAxleLength,               mm( 10   )],
                [NemaAxleFlatDepth,                mm(  0.5 )],
                [NemaAxleFlatLengthFront,          mm( 15   )],
                [NemaAxleFlatLengthBack,           mm(  9   )]
         ];

Nema17 = [
                [NemaModel, 17],
                [NemaLengthShort,                  mm( 33    )],
                [NemaLengthMedium,                 mm( 39    )],
                [NemaLengthLong,                   mm( 47    )],
                [NemaSideSize,                     mm( 42.20 )],
                [NemaDistanceBetweenMountingHoles, mm( 31.04 )],
                [NemaMountingHoleDiameter,         mm(  4    )],
                [NemaMountingHoleDepth,            mm(  4.5  )],
                [NemaMountingHoleLip,              mm(- 1    )],
                [NemaMountingHoleCutoutRadius,     mm(  0    )],
                [NemaEdgeRoundingRadius,           mm(  7    )],
                [NemaRoundExtrusionDiameter,       mm( 22    )],
                [NemaRoundExtrusionHeight,         mm(  1.9  )],
                [NemaAxleDiameter,                 mm(  5    )],
                [NemaFrontAxleLength,              mm( 18    )],
                [NemaBackAxleLength,               mm( 15    )],
                [NemaAxleFlatDepth,                mm(  0.5  )],
                [NemaAxleFlatLengthFront,          mm( 15    )],
                [NemaAxleFlatLengthBack,           mm( 14    )]
         ];

Nema23 = [
                [NemaModel, 23],
                [NemaLengthShort,                  mm( 39    )],
                [NemaLengthMedium,                 mm( 54    )],
                [NemaLengthLong,                   mm( 76    )],
                [NemaSideSize,                     mm( 56.4  )],
                [NemaDistanceBetweenMountingHoles, mm( 47.14 )],
                [NemaMountingHoleDiameter,         mm(  4.75 )],
                [NemaMountingHoleDepth,            mm(  5    )],
                [NemaMountingHoleLip,              mm(  4.95 )],
                [NemaMountingHoleCutoutRadius,     mm(  9.5  )],
                [NemaEdgeRoundingRadius,           mm(  2.5  )],
                [NemaRoundExtrusionDiameter,       mm( 38.10 )],
                [NemaRoundExtrusionHeight,         mm(  1.52 )],
                [NemaAxleDiameter,                 mm(  6.36 )],
                [NemaFrontAxleLength,              mm( 18.80 )],
                [NemaBackAxleLength,               mm( 15.60 )],
                [NemaAxleFlatDepth,                mm(  0.5  )],
                [NemaAxleFlatLengthFront,          mm( 16    )],
                [NemaAxleFlatLengthBack,           mm( 14    )]
         ];

Nema34 = [
                [NemaModel, 34],
                [NemaLengthShort,                  mm(  66    )],
                [NemaLengthMedium,                 mm(  96    )],
                [NemaLengthLong,                   mm( 126    )],
                [NemaSideSize,                     mm(  85    )],
                [NemaDistanceBetweenMountingHoles, mm(  69.58 )],
                [NemaMountingHoleDiameter,         mm(   6.5  )],
                [NemaMountingHoleDepth,            mm(   5.5  )],
                [NemaMountingHoleLip,              mm(   5    )],
                [NemaMountingHoleCutoutRadius,     mm(  17    )],
                [NemaEdgeRoundingRadius,           mm(   3    )],
                [NemaRoundExtrusionDiameter,       mm(  73.03 )],
                [NemaRoundExtrusionHeight,         mm(   1.9  )],
                [NemaAxleDiameter,               inch(   0.5  )],
                [NemaFrontAxleLength,              mm(  37    )],
                [NemaBackAxleLength,               mm(  34    )],
                [NemaAxleFlatDepth,                mm(   1.20 )],
                [NemaAxleFlatLengthFront,          mm(  25    )],
                [NemaAxleFlatLengthBack,           mm(  25    )]
         ];



function motorWidth(model=Nema23) = lookup(NemaSideSize, model);
function motorLength(model=Nema23, size=NemaMedium) = lookup(size, model);


module motor(model=Nema23, size=NemaMedium, dualAxis=false, pos=[0,0,0], orientation = [0,0,0]) {

  length = lookup(size, model);

  echo(str("  Motor: Nema",lookup(NemaModel, model),", length= ",length,"mm, dual axis=",dualAxis));

  stepperBlack    = BlackPaint;
  stepperAluminum = Aluminum;

  side = lookup(NemaSideSize, model);

  cutR = lookup(NemaMountingHoleCutoutRadius, model);
  lip = lookup(NemaMountingHoleLip, model);
  holeDepth = lookup(NemaMountingHoleDepth, model);

  axleLengthFront = lookup(NemaFrontAxleLength, model);
  axleLengthBack = lookup(NemaBackAxleLength, model);
  axleRadius = lookup(NemaAxleDiameter, model) * 0.5;

  extrSize = lookup(NemaRoundExtrusionHeight, model);
  extrRad = lookup(NemaRoundExtrusionDiameter, model) * 0.5;

  holeDist = lookup(NemaDistanceBetweenMountingHoles, model) * 0.5;
  holeRadius = lookup(NemaMountingHoleDiameter, model) * 0.5;

  mid = side / 2;

  roundR = lookup(NemaEdgeRoundingRadius, model);

  axleFlatDepth = lookup(NemaAxleFlatDepth, model);
  axleFlatLengthFront = lookup(NemaAxleFlatLengthFront, model);
  axleFlatLengthBack = lookup(NemaAxleFlatLengthBack, model);

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
            translate([mid+holeDist,mid+holeDist,mm(-1)]) cylinder(h=holeDepth+mm(1), r=holeRadius);
            translate([mid-holeDist,mid+holeDist,mm(-1)]) cylinder(h=holeDepth+mm(1), r=holeRadius);
            translate([mid+holeDist,mid-holeDist,mm(-1)]) cylinder(h=holeDepth+mm(1), r=holeRadius);
            translate([mid-holeDist,mid-holeDist,mm(-1)]) cylinder(h=holeDepth+mm(1), r=holeRadius);

          } 

          // Grinded flat
          color(stepperAluminum) {
            difference() {
              translate([mm(-1), mm(-1), -extrSize])
                cube(size=[side+mm(2), side+mm(2), extrSize + mm(1)]);
              translate([side/2, side/2, -extrSize - mm(1)])
                cylinder(h=mm(4), r=extrRad);
            }
          }

        }

      // Axle
      translate([0, 0, extrSize-axleLengthFront]) color(stepperAluminum) 
        difference() {
                     
          cylinder(h=axleLengthFront + mm(1) , r=axleRadius, $fs=axleRadius/10);

          // Flat
          if (axleFlatDepth > 0)
            translate([axleRadius - axleFlatDepth,mm(-5),-extrSize -(axleLengthFront-axleFlatLengthFront)] ) cube(size=[mm(5), mm(10), axleLengthFront]);
        }

        if (dualAxis) {
          translate([0, 0, length+extrSize]) color(stepperAluminum) 
            difference() {
                     
              cylinder(h=axleLengthBack + mm(0), r=axleRadius, $fs=axleRadius/10);

              // Flat
              if (axleFlatDepth > 0)
                translate([axleRadius - axleFlatDepth,mm(-5),(axleLengthBack-axleFlatLengthBack)]) cube(size=[mm(5), mm(10), axleLengthBack]);
          }

        }

    }
  }
}

module roundedBox(size, edgeRadius) {
    cube(size);

}

