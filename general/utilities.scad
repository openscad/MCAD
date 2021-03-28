/*
 * Utility functions.
 *
 * Originally by Hans Häggström, 2010.
 * Dual licenced under Creative Commons Attribution-Share Alike 3.0 and LGPL2 or later
 */

include <MCAD/general/constants.scad>


/******************** Disance Poins ******************************/
function distance3D(a,b) =sqrt( (a[0] - b[0])*(a[0] - b[0]) +
                                (a[1] - b[1])*(a[1] - b[1]) +
                                (a[2] - b[2])*(a[2] - b[2]) );
//Obsolet
function distance(a, b) = distance3D(a,b);

function distance2D(a,b) = sqrt( (a[0] - b[0])*(a[0] - b[0]) +
                                (a[1] - b[1])*(a[1] - b[1]));
								
function distance1D(a,b) = sqrt(a*a+b*b);
//Obsolet
function length2(a) = distance1D(a[0],a[1]);


/************************ vector *************************/
function normalized(a) = a / (max(distance3D([0,0,0], a), 0.00001));

function normalized_axis(a) = a == "x" ? [1, 0, 0]:
                   a == "y" ? [0, 1, 0]:
                   a == "z" ? [0, 0, 1]: normalized(a);

function angleOfNormalizedVector(n) = [0, -atan2(n[2], distance1D([n[0], n[1]])), atan2(n[1], n[0]) ];

function angle(v) = angleOfNormalizedVector(normalized(v));

function angleBetweenTwoPoints(a, b) = angle(normalized(b-a));

function _angleVectore2D(a) = atan2(a[0],a[1]);
function angle_betweentTwoPoints2D (a,b) = _angleVectore2D(b-a);

function mirror_2dvector (coord) =
[
	coord[0],
	-coord[1]
];

function rotate_2dvector (rotate, coord) =
[
	cos (rotate) * coord[0] + sin (rotate) * coord[1],
	cos (rotate) * coord[1] - sin (rotate) * coord[0]
];




/********************** Circel ***************************/

function circel_area(r) = mcad_const_pi * r * r;

function circel_radius3Points(a,b,c) = (distance2D(a,b) * distance2D(b,c) * distance2D(c,a)) / (4 * triangle_area3Points(a,b,c));

function circel_radius3lengths(a,b,c) = (a*b*c) / (4 * triangle_area3lengths(a,b,c));


/********************** triangle **************************/
//Satz des Heron
function triangle_area3lengths(a,b,c) = sqrt((a+b+c)*(a+b-c)*(b+c-a)*(c+a-b))/4;

function triangle_area3Points(a,b,c) = triangle_area3lengths(distance2D(a,b),distance2D(b,c),distance2D(c,a));



/************************** coordinate systems translation ****/
//[radius,phi] <=> [x,y]
function conv2D_cartesian2polar(x) = [ distance1D(x[0],x[1]) , atan2(x[1],x[0]) ];
function conv2D_polar2cartesian(x) = [ x[0]*cos(x[1]) , x[0]*sin(x[1]) ];


CENTER = 0;
LEFT = -0.5;
RIGHT = 0.5;
TOP = 0.5;
BOTTOM = -0.5;

FlatCap =0;
ExtendedCap =0.5;
CutCap =-0.5;


module fromTo(from=[0,0,0], to=[1,0,0], size=[1, 1], align=[CENTER, CENTER], material=[0.5, 0.5, 0.5], name="", endExtras=[0,0], endCaps=[FlatCap, FlatCap], rotation=[0,0,0], printString=true) {

  angle = angleBetweenTwoPoints(from, to);
  length = distance(from, to) + endCaps[0]*size[0] + endCaps[1]*size[0] + endExtras[0] + endExtras[1];

  if (length > 0) {
    if (printString) echo(str( "  " ,name, " ", size[0], "mm x ", size[1], "mm, length ", length, "mm"));

    color(material)
      translate(from)
        rotate(angle)
          translate( [ -endCaps[0]*size[0] - endExtras[0], size[0]*(-0.5-align[0]), size[1]*(-0.5+align[1]) ] )
            rotate(rotation)
              scale([length, size[0], size[1]]) children();
  }
}

module part(name) {
  echo("");
  echo(str(name, ":"));
}

module mirror_duplicate (plane = [0, 0, 1])
union () {
    children ();

    mirror (plane)
    children ();
}

module linear_extrude_if (condition, height, center = undef, convexity = undef,
                          twist = undef, slices = undef)
{
  if (condition)
    linear_extrude (height = height, center = center, convexity = convexity,
                    twist = twist, slices = slices)
      children ();

  else
    children ();
}
