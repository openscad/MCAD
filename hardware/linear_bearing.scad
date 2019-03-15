//By Glen Chung, 2013.
//Dual licenced under Creative Commons Attribution-Share Alike 3.0 and LGPL2 or later

include <MCAD/units/metric.scad>;
include <MCAD/materials/materials.scad>;

LINEAR_BEARING_dr = 0;  //Inscribed circle
LINEAR_BEARING_D  = 1;  //Outer diameter
LINEAR_BEARING_L  = 2;  //Length
LINEAR_BEARING_B  = 3;  //Outer locking groove B
LINEAR_BEARING_D1 = 4;  //Outer locking groove D1
LINEAR_BEARING_W  = 5;  //W


// Common bearing names
LinearBearing = "LM8UU";

// Linear Bearing dimensions
//  model == "XXXXX"   ?   [    dr,      D,      L,        B,      D1,       W]:
function linearBearingDimensions(model) =
model == "LM3UU"   ?   [  3*length_mm,   7*length_mm,  10*length_mm,   0.0*length_mm,   0.0*length_mm, 0.00*length_mm]:
model == "LM4UU"   ?   [  4*length_mm,   8*length_mm,  12*length_mm,   0.0*length_mm,   0.0*length_mm, 0.00*length_mm]:
model == "LM5UU"   ?   [  5*length_mm,  10*length_mm,  15*length_mm,  10.2*length_mm,   9.6*length_mm, 1.10*length_mm]:
model == "LM6UU"   ?   [  6*length_mm,  12*length_mm,  19*length_mm,  13.5*length_mm,  11.5*length_mm, 1.10*length_mm]:
model == "LM8SUU"  ?   [  8*length_mm,  15*length_mm,  17*length_mm,  11.5*length_mm,  14.3*length_mm, 1.10*length_mm]:
model == "LM10UU"  ?   [ 10*length_mm,  19*length_mm,  29*length_mm,  22.0*length_mm,  18.0*length_mm, 1.30*length_mm]:
model == "LM12UU"  ?   [ 12*length_mm,  21*length_mm,  30*length_mm,  23.0*length_mm,  20.0*length_mm, 1.30*length_mm]:
model == "LM13UU"  ?   [ 13*length_mm,  23*length_mm,  32*length_mm,  23.0*length_mm,  22.0*length_mm, 1.30*length_mm]:
model == "LM16UU"  ?   [ 16*length_mm,  28*length_mm,  37*length_mm,  26.5*length_mm,  27.0*length_mm, 1.60*length_mm]:
model == "LM20UU"  ?   [ 20*length_mm,  32*length_mm,  42*length_mm,  30.5*length_mm,  30.5*length_mm, 1.60*length_mm]:
model == "LM25UU"  ?   [ 25*length_mm,  40*length_mm,  59*length_mm,  41.0*length_mm,  38.0*length_mm, 1.85*length_mm]:
model == "LM30UU"  ?   [ 30*length_mm,  45*length_mm,  64*length_mm,  44.5*length_mm,  43.0*length_mm, 1.85*length_mm]:
model == "LM35UU"  ?   [ 35*length_mm,  52*length_mm,  70*length_mm,  49.5*length_mm,  49.0*length_mm, 2.10*length_mm]:
model == "LM40UU"  ?   [ 40*length_mm,  60*length_mm,  80*length_mm,  60.5*length_mm,  57.0*length_mm, 2.10*length_mm]:
model == "LM50UU"  ?   [ 50*length_mm,  80*length_mm, 100*length_mm,  74.0*length_mm,  76.5*length_mm, 2.60*length_mm]:
model == "LM60UU"  ?   [ 60*length_mm,  90*length_mm, 110*length_mm,  85.0*length_mm,  86.5*length_mm, 3.15*length_mm]:
model == "LM80UU"  ?   [ 80*length_mm, 120*length_mm, 140*length_mm, 105.5*length_mm, 116.0*length_mm, 4.15*length_mm]:
model == "LM100UU" ?   [100*length_mm, 150*length_mm, 150*length_mm, 125.5*length_mm, 145.0*length_mm, 4.15*length_mm]:
/*model == "LM8UU"   ?*/ [  8*length_mm,  15*length_mm,  24*length_mm,  17.5*length_mm,  14.3*length_mm, 1.10*length_mm];


function linearBearing_dr(model) = linearBearingDimensions(model)[LINEAR_BEARING_dr];
function linearBearing_D(model)  = linearBearingDimensions(model)[LINEAR_BEARING_D];
function linearBearing_L(model)  = linearBearingDimensions(model)[LINEAR_BEARING_L];
function linearBearing_B(model)  = linearBearingDimensions(model)[LINEAR_BEARING_B];
function linearBearing_D1(model) = linearBearingDimensions(model)[LINEAR_BEARING_D1];
function linearBearing_W(model)  = linearBearingDimensions(model)[LINEAR_BEARING_W];

module linearBearing(pos=[0,0,0], angle=[0,0,0], model=LinearBearing,
		material=Steel, sideMaterial=BlackPaint) {
	dr = linearBearing_dr(model);
	D  = linearBearing_D(model);
	L  = linearBearing_L(model);
	B  = linearBearing_B(model);
	D1 = linearBearing_D1(model);
	W  = linearBearing_W(model);

	innerRim = dr + (D - dr) * 0.2;
	outerRim = D - (D - dr) * 0.2;
	midSink = W/4;

	translate(pos) rotate(angle) union() {
		color(material)
			difference() {
				// Basic ring
				Ring([0,0,0], D, dr, L, material, material);

				if(W) {
					// Side shields
					Ring([0,0,-epsilon], outerRim, innerRim, L*epsilon+midSink, sideMaterial, material);
					Ring([0,0,L-midSink-epsilon], outerRim, innerRim, L*epsilon+midSink, sideMaterial, material);
					//Outer locking groove
					Ring([0,0,(L-B)/2], D+epsilon, outerRim+W/2, W, material, material);
					Ring([0,0,L-(L-B)/2], D+epsilon, outerRim+W/2, W, material, material);
				}
			}
		if(W)
			Ring([0,0,midSink], D-L*epsilon, dr+L*epsilon, L-midSink*2, sideMaterial, sideMaterial);
	}

	module Ring(pos, od, id, h, material, holeMaterial) {
		color(material) {
			translate(pos)
				difference() {
					cylinder(r=od/2, h=h,  $fn = 100);
					color(holeMaterial)
						translate([0,0,-10*epsilon])
						cylinder(r=id/2, h=h+20*epsilon,  $fn = 100);
				}
		}
	}

}

