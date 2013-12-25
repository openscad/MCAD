/*
 *  OpenSCAD Shapes Library (www.openscad.org)
 *  Copyright (C) 2010  Giles Bathgate
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
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

// 2D regular shapes

module triangle(radius)
{
  o=radius/2;		//equivalent to radius*sin(30)
  a=radius*sqrt(3)/2;	//equivalent to radius*cos(30)
  polygon(points=[[-a,-o],[0,radius],[a,-o]],paths=[[0,1,2]]);
}

module reg_polygon(sides,radius)
{
  function dia(r) = sqrt(pow(r*2,2)/2);  //sqrt(r*2^2/2) if only we had an exponention op
  if(sides<2) square([radius,0]);
  if(sides==3) triangle(radius);
  if(sides==4) square([dia(radius),dia(radius)],center=true);
  if(sides>4) circle(r=radius,$fn=sides);
}

module pentagon(radius)
{
  reg_polygon(5,radius);
}

module hexagon(radius)
{
  reg_polygon(6,radius);
}

module heptagon(radius)
{
  reg_polygon(7,radius);
}

module octagon(radius)
{
  reg_polygon(8,radius);
}

module nonagon(radius)
{
  reg_polygon(9,radius);
}

module decagon(radius)
{
  reg_polygon(10,radius);
}

module hendecagon(radius)
{
  reg_polygon(11,radius);
}

module dodecagon(radius)
{
  reg_polygon(12,radius);
}

//3D regular shapes

module cone(height, radius, center = false) 
{
  cylinder(height, radius, 0, center);
}

module oval_prism(height, rx, ry, center = false) 
{
  scale([1, rx/ry, 1]) cylinder(h=height, r=ry, center=center);
}

module oval_tube(height, rx, ry, wall, center = false) 
{
  difference() {
    scale([1, ry/rx, 1]) cylinder(h=height, r=rx, center=center);
    scale([(rx-wall)/rx, (ry-wall)/rx, 1]) cylinder(h=height, r=rx, center=center);
  }
}

module cylinder_tube(height, radius, wall, center = false) 
{
    tubify(radius,wall)
    cylinder(h=height, r=radius, center=center);
}

//Tubifies any regular prism
module tubify(radius,wall)
{
  difference()
  {
    child(0);
    scale([(radius-wall)/radius,(radius-wall)/radius,1]) child(0);
  }
}

module triangle_prism(height,radius)
{
  linear_extrude(height=height) triangle(radius);
}

module triangle_tube(height,radius,wall)
{
   tubify(radius,wall) triangle_prism(height,radius);
}

module pentagon_prism(height,radius)
{
  linear_extrude(height=height) pentagon(radius);
}

module pentagon_tube(height,radius,wall)
{
 tubify(radius,wall) pentagon_prism(height,radius);	
}

module hexagon_prism(height,radius) 
{
  linear_extrude(height=height) hexagon(radius);
}

module heptagon_prism(height,radius) 
{
  linear_extrude(height=height) heptagon(radius);
}

module octagon_prism(height,radius) 
{
  linear_extrude(height=height) octagon(radius);  
}

module nonagon_prism(height,radius)
{
  linear_extrude(height=height) nonagon(radius); 
}

module decagon_prism(height,radius)
{
  linear_extrude(height=height) decagon(radius); 
}

module hendecagon_prism(height,radius)
{
  linear_extrude(height=height) hendecagon(radius); 
}

module dodecagon_prism(height,radius)
{
  linear_extrude(height=height) dodecagon(radius); 
}

module torus(outerRadius, innerRadius)
{
  r=(outerRadius-innerRadius)/2;
  rotate_extrude() translate([innerRadius+r,0,0]) circle(r);	
}

module triangle_pyramid(radius)
{
  o=radius/2;		//equivalent to radius*sin(30)
  a=radius*sqrt(3)/2;	//equivalent to radius*cos(30)
  polyhedron(points=[[-a,-o,-o],[a,-o,-o],[0,radius,-o],[0,0,radius]],triangles=[[0,1,2],[1,2,3],[0,1,3],[0,2,3]]);
}

module square_pyramid(width,height,depth)
{
  w=width/2;
  h=height/2;
  polyhedron(points=[[-w,-h,0],[-w,h,0],[w,h,0],[w,-h,0],[0,0,depth]],triangles=[[0,1,2],[0,1,4],[0,1,3],[0,2,3]]);
}

module example()
{
	//linear_extrude(50) reg_polygon(4,20);

	//oval_tube(50,20,10,3);
	
	//triangle_tube(50,20,1);
	
	//torus(60,30);

	//square_pyramid(20,20,40);
}

//example();
