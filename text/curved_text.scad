// Uncomment to render examples:
// test_curved_text();

module test_curved_text() {
    let(D = 50, f="Liberation Mono") {
        // text on a circle vertically aligned at the bottom and
        // with clockwise and counterclockwise directions
        translate([-0.75*D,0,0]) {
            difference() {
                circle(d=D);
                circle(d=D-0.5);
            }
            mcad_circle_text(50, "CW+BOT", font=f, halign="center");
            rotate([0,0,180])
                mcad_circle_text(50, "CCW+BOT", font=f, halign="center",
                                 valign="bot", spacing=1.5,
                                 direction="ccw");
        }
		
        // text on a circle "horizontally" aligned left and right
        translate([0.75*D,0,0]) {
            difference() {
                circle(d=D);
                circle(d=D-0.5);
            }
            mcad_circle_text(50, "LEFT", font=f, halign="left");
            square([0.5, D+2*10], center=true);
            mcad_circle_text(50, "RIGHT", font=f, halign="right",
                             valign="top", spacing=1.5);
        }

        // text on cylinder
        translate([-0.75*D,1.5*D,0]) {
             mcad_cylinder_text(D, "INSIDE", depth=2, halign = "center",
                                spacing = 1.2, font=f);
             rotate([0,0,180])
                  mcad_cylinder_text(D, "OUTSIDE", depth=2, font=f,
                                     halign = "center", spacing = 1.2,
                                     direction="ccw");
             linear_extrude(height=2){
                  difference() {
                       circle(d=50);
                       circle(d=50-0.5);
                  }
             }
        }

        // text on cone:
        //   - word "obtuse" on a (inverted) cone with an angle > 90º
        //   - word "acute" on a cone with an angle < 90º
        translate([0.75*D,1.5*D,0]) {
             mcad_cone_text(D, angle=120, t="OBTUSE", depth=2,
                            halign="center", spacing=1.2, font=f);
             rotate([0,0,180])
                  mcad_cone_text(D, angle=60, t="ACUTE", depth=2,
                                 halign = "center", spacing = 1.2,
                                 direction="ccw", font=f);
        }
    }
}

/**
 * Generate 2D text along a reference circle.
 *
 * Note that input text string is divided into characters which are
 * then equally spaced regardless of their original width on each font.
 *
 * @param diameter Diameter of the circle to generate text around.
 * @param t The text to generate.
 * @param size, font, valign See description for function `text`.
 *     These parameters are passed unaltered to the underlying `text`
 *     function. Same default values apply.
 * @param halign, spacing, direction See description of function
 *     `mcad_cone_text` which is called by this function. These
 *     parameters have the same interpretation and the same default
 *     values.
 */
module mcad_circle_text(diameter, t, size = 10, font, halign, valign,
                        spacing = 1, direction)
{
    angle = direction == "ccw" ? 0 : 180;
    mcad_cone_text(angle = angle, diameter=diameter, t=t, size=size,
                   font=font, halign=halign, valign=valign,
                   spacing=spacing, direction=direction);

}

/**
 * Generate 3D text along a reference cylinder.
 *
 * Note that input text string is divided into characters which are
 * then equally spaced regardless of their original width on each font.
 *
 * @param diameter Diameter of the reference cylinder.
 * @param t The text to generate.
 * @param depth Text will be extruded by this amount. Effectively,
 *     text is extruded outwards from the cylinder when the 'direction'
 *     parameter is set to "cw" and inwards when it is set to "ccw".
 * @param size, font, valign See description for function `text`.
 *     These parameters are passed unaltered to the underlying `text`
 *     function. Same default values apply.
 * @param halign, spacing, direction See description of function
 *     `mcad_cone_text` which is called by this function. These
 *     parameters have the same interpretation and the same default
 *     values.
 */
module mcad_cylinder_text(diameter, t, depth, size = 10, font, halign,
                      valign, spacing = 1, direction)
{
    mcad_cone_text(angle = 90, diameter=diameter, t=t, depth=depth,
                   size=size, font=font, halign=halign, valign=valign,
                   spacing=spacing, direction=direction);
}

/**
 * Generate 3D text along the surface of a right circular cone.
 *
 * Note that input text string is divided into characters which are
 * then equally spaced regardless of their original width on each font.
 *
 * @param diameter Diameter of the circle resulting from sectioning
 *     the cone by the XY plane. Text is generated around this circle.
 * @param angle Inclination of the text in degrees from 0 to 180. Angle
 *     measured from the front face of the text to the base XY plane.
 * @param t The text to generate.
 * @param depth Text will be extruded by this amount.
 * @param size, font, valign See description for function `text`.
 *     These parameters are passed unaltered to the underlying `text`
 *     function. Same default values apply.
 * @param halign Alignment of the text with respect to the 'Y' axis.
 *     Possible values are "left", "center" and "right". Default is
 *     "left". Note that the meaning of left/right might be
 *     counter-intuitive when parameter 'direction' is set to "ccw".
 * @param spacing Factor to increase/decrease the character spacing.
 *     The default value of 1 results in a circular character spacing
 *     of about five-sevenths the 'size' parameter, regardless of the
 *     font. A value greater than 1 causes the letters to be spaced
 *     further apart.
 * @param direction Direction of the text flow. Possible values are
 *     "cw" (clockwise, flow along a turn in the -Z axis) and "ccw"
 *     (counterclockwise, flow along a turn in the +Z axis). Default
 *     is "cw".
 */
module mcad_cone_text(diameter, angle, t, depth, size = 10, font, halign,
                      valign, spacing = 1, direction)
{
    s = size*5/7;
    a = 2*atan(s/diameter)*spacing;
    a0 = halign == "right"
        ? a*(len(t)-1) + a/2
        : halign == "center"
            ? a*(len(t)-1)/2
            : 0 - a/2;
    d = direction == "ccw" ? 180 : 0;
    theta = direction == "ccw" ? -angle : 180 - angle;
    for(i = [0:len(t)-1]) {
        letter_index = direction == "ccw" ? len(t)-1-i : i;
        rotate([0,0,a0-a*i])
        translate([0,diameter/2,0])
        rotate([theta,0,0])
        rotate([0,0,d])
            if (depth == undef)
                 text(t[letter_index], size=size, font=font, halign="center",
                      valign=valign);
            else
                linear_extrude(height=depth, center=false)
                    text(t[letter_index], size=size, font=font,
                         halign="center", valign=valign);
    }
}
