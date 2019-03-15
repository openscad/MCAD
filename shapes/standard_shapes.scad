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

include <MCAD/general/utilities.scad>;
include <MCAD/units/metric.scad>;

module cylinderSegment_angle(r,h,Phi,center = false){
	a = Phi/2;
	if(center == false ){
		translate([0, 0, h/2]){
			_halfCircelSegment(radius=r,height=h,angle=abs(a));
			rotate(a = 180, v = X)
				_halfCircelSegment(radius=r,height=h,angle=abs(a));
		}
	}else{
		_halfCircelSegment(radius=r,height=h,angle=abs(a));
		rotate(a = 180, v = X)
			_halfCircelSegment(radius=r,height=h,angle=abs(a));
	}
}
//cylinderSegment_angle(radius=10,height=1,Phi=360);

module _halfCircelSegment(radius,height,angle){
	difference(){
		union(){
			cylinder(h = height, r = radius, center = true);
		}
		union(){
			translate([0, -radius/2-OS, 0])
				cube ([(radius+OS)*2,radius+OS,height+2*OS],center =true);
			rotate(a = angle, v = Z) translate([0, -radius/2, 0])
				cube ([(radius+OS)*2,radius+OS,height+2*OS],center =true);
		}
	}
}
//_halfCircelSegment(10,1,111);
