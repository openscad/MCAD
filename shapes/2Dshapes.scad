
/*
 *  OpenSCAD 2D Shapes Library (www.openscad.org)
 *  Copyright (C) 2012 Peter Uithoven
 *
 *  License: LGPL 2.1 or later
 */

// 2D Shapes
// ngon(sides, radius, center=false);
// complexRoundSquare(size,rads1=[0,0], rads2=[0,0], rads3=[0,0], rads4=[0,0],
// center=true) roundedSquare(pos=[10,10],r=2) csquare(size, center = false)
// trapezoid (bottom, height, top = undef, left_angle = undef, right_angle =
// undef)

// ring(inside_diameter, thickness)
// ellipse(width, height)
// ellipsePart(width,height,numQuarters)
// egg_outline(width, length)

// donutSlice(innerSize,outerSize, start_angle, end_angle)
// pieSlice(size, start_angle, end_angle) //size in radius(es)

// Examples
/*use <layouts.scad>;
grid(105,105,true,4)
{
    // ellipse
    ellipse(50,75);

    // part of ellipse (a number of quarters)
    ellipsePart(50,75,3);
    ellipsePart(50,75,2);
    ellipsePart(50,75,1);

    // complexRoundSquare examples
    complexRoundSquare([75,100],[20,10],[20,10],[20,10],[20,10]);
    complexRoundSquare([75,100],[0,0],[0,0],[30,50],[20,10]);
    complexRoundSquare([50,50],[10,20],[10,20],[10,20],[10,20],false);
    complexRoundSquare([100,100]);
    complexRoundSquare([100,100],rads1=[20,20],rads3=[20,20]);

    // pie slice
    pieSlice(50,0,10);
    pieSlice(50,45,190);
    pieSlice([50,20],180,270);

    // donut slice
    donutSlice(20,50,0,350);
    donutSlice(30,50,190,270);
    donutSlice([40,22],[50,30],180,270);
    donutSlice([50,20],50,180,270);
    donutSlice([20,30],[50,40],0,270);
}*/
//----------------------

// Regular 2D shapes
// The orientation might change with the implementation of circle...
module ngon(sides, radius, center = false)
{
    rotate([ 0, 0, 360 / sides / 2 ])
        circle(r = radius, $fn = sides, center = center);
}

// 2D regular shapes

module reg_polygon(sides, radius, center = false)
{
    function dia(r) = sqrt(
        pow(r * 2, 2) / 2); // sqrt((r*2^2)/2) if only we had an exponention op
    if (sides < 2)
        square([ radius, 0 ]);
    if (sides == 3)
        triangle(radius);
    if (sides == 4)
        square([ dia(radius), dia(radius) ], center = true);
    if (sides > 4)
        circle(r = radius, $fn = sides, center = center);
}

module pentagon(radius)
{
    reg_polygon(5, radius);
}

module hexagon(radius)
{
    reg_polygon(6, radius);
}

module heptagon(radius)
{
    reg_polygon(7, radius);
}

module octagon(radius)
{
    reg_polygon(8, radius);
}

module nonagon(radius)
{
    reg_polygon(9, radius);
}

module decagon(radius)
{
    reg_polygon(10, radius);
}

module hendecagon(radius)
{
    reg_polygon(11, radius);
}

module dodecagon(radius)
{
    reg_polygon(12, radius);
}

// size, top left radius, top right radius, bottom right radius, bottom left
// radius, center
module complexRoundSquare(size,
                          rads1 = [ 0, 0 ],
                          rads2 = [ 0, 0 ],
                          rads3 = [ 0, 0 ],
                          rads4 = [ 0, 0 ],
                          center = true)
{
    width = size[0];
    height = size[1];
    //%square(size=[width, height],center=true);
    x1 = 0 - width / 2 + rads1[0];
    y1 = 0 - height / 2 + rads1[1];
    x2 = width / 2 - rads2[0];
    y2 = 0 - height / 2 + rads2[1];
    x3 = width / 2 - rads3[0];
    y3 = height / 2 - rads3[1];
    x4 = 0 - width / 2 + rads4[0];
    y4 = height / 2 - rads4[1];

    scs = 0.1; // straight corner size

    x = (center) ? 0 : width / 2;
    y = (center) ? 0 : height / 2;

    translate([ x, y, 0 ])
    {
        hull()
        {
            // top left
            if (rads1[0] > 0 && rads1[1] > 0)
                translate([ x1, y1 ]) mirror([ 1, 0 ])
                    ellipsePart(rads1[0] * 2, rads1[1] * 2, 1);
            else
                translate([ x1, y1 ]) square(size = [ scs, scs ]);

            // top right
            if (rads2[0] > 0 && rads2[1] > 0)
                translate([ x2, y2 ])
                    ellipsePart(rads2[0] * 2, rads2[1] * 2, 1);
            else
                translate([ width / 2 - scs, 0 - height / 2 ])
                    square(size = [ scs, scs ]);

            // bottom right
            if (rads3[0] > 0 && rads3[1] > 0)
                translate([ x3, y3 ]) mirror([ 0, 1 ])
                    ellipsePart(rads3[0] * 2, rads3[1] * 2, 1);
            else
                translate([ width / 2 - scs, height / 2 - scs ])
                    square(size = [ scs, scs ]);

            // bottom left
            if (rads4[0] > 0 && rads4[1] > 0)
                translate([ x4, y4 ]) rotate([ 0, 0, -180 ])
                    ellipsePart(rads4[0] * 2, rads4[1] * 2, 1);
            else
#translate([ x4, height / 2 - scs ]) square(size = [ scs, scs ]);
        }
    }
}
module roundedSquare(pos = [ 10, 10 ], r = 2)
{
    minkowski()
    {
        square([ pos[0] - r * 2, pos[1] - r * 2 ], center = true);
        circle(r = r);
    }
}

module csquare(size, center = false)
{
    center = (len(center) == undef) ? [ center, center ] : center;
    size = (len(size) == undef) ? [ size, size ] : size;

    function get_offset(i) = center[i] ? -size[i] / 2 : 0;

    translate([ get_offset(0), get_offset(1) ]) square(size);
}

module triangle(radius)
{
    o = radius / 2;           // equivalent to radius*sin(30)
    a = radius * sqrt(3) / 2; // equivalent to radius*cos(30)
    polygon(points = [ [ -a, -o ], [ 0, radius ], [ a, -o ] ],
            paths = [[ 0, 1, 2 ]]);
}

module trapezoid(bottom,
                 height,
                 top = undef,
                 left_angle = undef,
                 right_angle = undef)
{
    function tan90(angle) = (angle == 90) ? 0 : tan(angle);

    function get_trapezoid_offset(adjacent, opposite) =
        ((adjacent == undef && opposite == undef)
             ? (bottom - top) / 2
             : (adjacent == undef)
                   ? bottom - tan90(90 - opposite) * height - top
                   : tan90(90 - adjacent) * height);

    offset_left = get_trapezoid_offset(left_angle, right_angle);
    offset_right = get_trapezoid_offset(right_angle, left_angle);

    polygon([
        [ -bottom / 2, 0 ],
        [ bottom / 2, 0 ],
        [ bottom / 2 - offset_right, height ],
        [ -bottom / 2 + offset_left, height ]
    ]);
}

module ring(inside_diameter, thickness)
{
    difference()
    {
        circle(r = (inside_diameter + thickness * 2) / 2);
        circle(r = inside_diameter / 2);
    }
}

module ellipse(width, height)
{
    scale([ 1, height / width, 1 ]) circle(r = width / 2);
}

module ellipsePart(width, height, numQuarters)
{
    o = 1; // slight overlap to fix a bug
    difference()
    {
        ellipse(width, height);
        if (numQuarters <= 3)
            translate([ 0 - width / 2 - o, 0 - height / 2 - o, 0 ])
                square([ width / 2 + o, height / 2 + o ]);
        if (numQuarters <= 2)
            translate([ 0 - width / 2 - o, -o, 0 ])
                square([ width / 2 + o, height / 2 + o * 2 ]);
        if (numQuarters < 2)
            translate([ -o, 0, 0 ])
                square([ width / 2 + o * 2, height / 2 + o ]);
    }
}

// The ratio of length and width is about 1.39 for a real egg
module egg_outline(width, length)
{
    translate([ 0, width / 2, 0 ]) union()
    {
        rotate([ 0, 0, 180 ]) difference()
        {
            ellipse(width, 2 * length - width);
            translate([ -length / 2, 0, 0 ]) square(length);
        }
        circle(r = width / 2);
    }
}

module donutSlice(innerSize, outerSize, start_angle, end_angle)
{
    difference()
    {
        pieSlice(outerSize, start_angle, end_angle);
        if (len(innerSize) > 1)
            ellipse(innerSize[0] * 2, innerSize[1] * 2);
        else
            circle(innerSize);
    }
}
module pieSlice(size, start_angle, end_angle) // size in radius(es)
{
    rx = ((len(size) > 1) ? size[0] : size);
    ry = ((len(size) > 1) ? size[1] : size);
    trx = rx * sqrt(2) + 1;
    try
        = ry * sqrt(2) + 1;
    a0 = (4 * start_angle + 0 * end_angle) / 4;
    a1 = (3 * start_angle + 1 * end_angle) / 4;
    a2 = (2 * start_angle + 2 * end_angle) / 4;
    a3 = (1 * start_angle + 3 * end_angle) / 4;
    a4 = (0 * start_angle + 4 * end_angle) / 4;
    if (end_angle > start_angle)
        intersection()
        {
            if (len(size) > 1)
                ellipse(rx * 2, ry * 2);
            else
                circle(rx);
            polygon([
                [ 0, 0 ],
                [ trx * cos(a0), try * sin(a0) ],
                [ trx * cos(a1), try * sin(a1) ],
                [ trx * cos(a2), try * sin(a2) ],
                [ trx * cos(a3), try * sin(a3) ],
                [ trx * cos(a4), try * sin(a4) ],
                [ 0, 0 ]
            ]);
        }
}
