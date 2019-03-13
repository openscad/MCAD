include <MCAD/units/metric.scad>
/*
 *  Copyright (C) 2012  Krallinger Sebastian
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 3 of the License,
 *  LGPL version 2.1, or (at your option) any later version of the GPL.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 *
 */

ATX_outlines = [ 86, 140, 150 ]; //!< metal box outline

ATX_threadedHoles = [
    [ 6, 30 ],
    [ 16, 144 ],
    [ 80, 6 ],
    [ 80, 144 ]
]; //!< thread hols M4  in the x,z Coordinates 0:@powerconector corner
ATX_threadedHoleDiameter = 4;
ATX_threadedHoleDepth = 10;

ATX_fanPos = [ 43, 100 ];
ATX_fanDiameter = 74;
ATX_fanDepth = 5;

ATX_powConPos = [ 24, 30 ];
ATX_powConSize = [ 22, 40 ];
ATX_powHeight = 5;

ATX_wireHarnesPos = [ 53, 16 ];
ATX_wireHarnesDiameter = 14;
ATX_wireHarnesLenght = 10;

/**
 * @brief   ATX power Suply.
 *
 * http://www.formfactors.org/developer/specs/ATX12V_PSDG_2_2_public_br2.pdf.
 * @param[in,out] VALUE   DESCRIPTION
 * @return                DESCRIPTION
 **/
module
powerSuplyATX()
{
    difference()
    {
        union()
        {
            // box
            color("Gainsboro") cube(size = ATX_outlines, center = false);

            // wireHarnest
            color("DarkOrange") translate([
                ATX_wireHarnesPos[0],
                ATX_outlines[1] + ATX_wireHarnesLenght - OS,
                ATX_wireHarnesPos[1]
            ]) rotate(a = 90, v = X) cylinder(r = ATX_wireHarnesDiameter / 2,
                                              h = ATX_wireHarnesLenght + OS,
                                              center = false);

            // power
            color("DarkSlateGray")
                translate([ ATX_powConPos[0], -OS, ATX_powConPos[1] ]) cube(
                    size =
                        [ ATX_powConSize[0], ATX_powHeight, ATX_powConSize[1] ],
                    center = true);
        }
        union()
        {
            // thread holse
            for (i = ATX_threadedHoles) {
                color("Black")
                    translate([ i[0], +ATX_threadedHoleDepth - OS, i[1] ])
                        rotate(a = 90, v = X)
                            cylinder(r = ATX_threadedHoleDiameter / 2,
                                     h = ATX_threadedHoleDepth + OS,
                                     center = false);
            }

            // fan
            color("Black")
                translate([ ATX_fanPos[0], +ATX_fanDepth - OS, ATX_fanPos[1] ])
                    rotate(a = 90, v = X) cylinder(r = ATX_fanDiameter / 2,
                                                   h = ATX_fanDepth + OS,
                                                   center = false);
        }
    }
}
// powerSuplyATX();
