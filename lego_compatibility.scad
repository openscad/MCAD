// This file is placed under the public domain

// Author: nefercheprure


// // Examples:
// //  standard LEGO 4×2×1 brick solid_bottom
//      block();

// //  standard LEGO 2x1 tile has no pin
//      block(1,2,1/3,reinforcement=false,flat_top=true);
// //  standard LEGO 2x1 flat has pin
//      block(1,2,1/3,reinforcement=false,solid_bottom=true,center=false);
// //  standard LEGO 2x1 brick has pin
//      block(1,2,1,reinforcement=true);
// //  standard LEGO 2x1 brick without pin
//      block(1,2,1,reinforcement=false);
// //  standard LEGO 2x1x5 brick has no pin and has hollow knobs
//      block(1,2,5,reinforcement=false,hollow_knob=true);
// //  standard LEGO 2x2x1/3 brick round no solid bottom
//      block(2,2,1/3,reinforcement=true,solid_bottom=false,round=true);
// //  standard LEGO 1x1x1 brick round no solid bottom
//      block(1,1,1,reinforcement=true,solid_bottom=false,round=true,center=1);



knob_diameter=4.8;     //knobs on top of blocks
knob_height=2;
knob_spacing=8.0;
wall_thickness=1.45;
roof_thickness=1.05;
block_height=9.5;
pin_diameter=3;        //pin for bottom blocks with width or length of 1
post_diameter=6.5;
reinforcing_width=1.5;
axle_spline_width=2.0;
axle_diameter=5;
cylinder_precision=0.5;

/* EXAMPLES:

// 1×1 
translate([0,-40,0])block(1,1,1,round=true,flat_top=false,hollow_knob=true,solid_bottom=false,center=false);
translate([10,-40,0])block(1,1,1/3,round=true,flat_top=true,hollow_knob=true,solid_bottom=false,center=false);
translate([20,-40,0])block(1,1,1,round=true,flat_top=true,hollow_knob=true,solid_bottom=false,center=false);
translate([30,-40,0])block(1,1,1/3,round=true,flat_top=false,hollow_knob=false,solid_bottom=false,center=false);
translate([40,-40,0])block(1,1,1/3,round=true,flat_top=false,hollow_knob=true,solid_bottom=false,center=false);

block(2,1,1/3,axle_hole=false,circular_hole=true,reinforcement=true,hollow_knob=true,flat_top=true, solid_bottom=true);

translate([50,-10,0])
    block(1,2,1/3,axle_hole=false,circular_hole=true,reinforcement=false,hollow_knob=true,flat_top=true, solid_bottom=true);


translate([10,0,0])
    block(2,2,1/3,axle_hole=false,circular_hole=true,reinforcement=true,hollow_knob=true,flat_top=true, solid_bottom=true);
translate([30,0,0])
    block(2,2,1/3,axle_hole=false,circular_hole=true,reinforcement=true,hollow_knob=false,flat_top=false, solid_bottom=true);
translate([50,0,0])
    block(2,2,1/3,axle_hole=false,circular_hole=true,reinforcement=true,hollow_knob=true,flat_top=false, solid_bottom=true);
translate([70,0,0])
    block(2,2,1/3,axle_hole=false,circular_hole=false,reinforcement=true,hollow_knob=false,flat_top=true, solid_bottom=true,round=true);
translate([90,0,0])
    block(2,2,1/3,axle_hole=false,circular_hole=true,reinforcement=true,hollow_knob=false,flat_top=false, solid_bottom=true,round=true);
translate([110,0,0])
    block(2,2,1/3,axle_hole=true,circular_hole=false,reinforcement=true,hollow_knob=true,flat_top=false, solid_bottom=false,round=true);

translate([0,20,0])
    block(3,2,2/3,axle_hole=false,circular_hole=true,reinforcement=true,hollow_knob=true,flat_top=false, solid_bottom=true);
translate([20,20,0])
    block(3,2,1,axle_hole=true,circular_hole=false,reinforcement=true,hollow_knob=false,flat_top=false, solid_bottom=true);
translate([40,20,0])
    block(3,2,1/3,axle_hole=false,circular_hole=false,reinforcement=false,hollow_knob=false,flat_top=false, solid_bottom=true);

translate([0,-10,0])
    block(1,5,1/3,axle_hole=true,circular_hole=false,reinforcement=true,hollow_knob=false,flat_top=false, solid_bottom=true);
translate([0,-20,0])
    block(1,5,1/3,axle_hole=true,circular_hole=false,reinforcement=true,hollow_knob=true,flat_top=false, solid_bottom=true);
translate([0,-30,0])
    block(1,5,1/3,axle_hole=true,circular_hole=false,reinforcement=true,hollow_knob=true,flat_top=true,solid_bottom=true);
//*/
echo("lego_compatibility.scad useable module: \nblock(width=2,length=4,height=1,\n     axle_hole=false,\n     reinforcement=false,\n     hollow_knob=false,\n     flat_top=false,\n     circular_hole=false,\n     solid_bottom=true,\n     center=false,\n     round=false\n);\n");
module block(width=2,length=4,height=1,axle_hole=false,reinforcement=false, hollow_knob=false, flat_top=false, circular_hole=false, solid_bottom=true, center=false,round=false) {
    overall_length=(length-1)*knob_spacing+knob_diameter+wall_thickness*2;
    overall_width=(width-1)*knob_spacing+knob_diameter+wall_thickness*2;
    center= center==true ? 1 : 0;
    translate(center*[-overall_length/2, -overall_width/2, 0])
    union() {
        difference() {
            union() {
                // body:  use cylinder if round
                if (width == length && round == true ) translate([overall_length/2,overall_width/2])
                    linear_extrude(height*block_height,convexity=2)
                        circle(d=overall_length-.01,$fs=cylinder_precision,$fa=5);
                else cube([overall_length,overall_width,height*block_height]);
                // knobs:
                if (flat_top != true)
                translate([knob_diameter/2+wall_thickness,knob_diameter/2+wall_thickness,0]) 
                    for (ycount=[0:width-1])
                        for (xcount=[0:length-1]) {
                            translate([xcount*knob_spacing,ycount*knob_spacing,0])
                                difference() {
                                    cylinder(r=knob_diameter/2,h=block_height*height+knob_height,$fs=cylinder_precision);
                                    if (hollow_knob==true)
                                        translate([0,0,-roof_thickness])
                                            cylinder(r=pin_diameter/2,h=block_height*height+knob_height+2*roof_thickness,$fs=cylinder_precision);
                                }
                    }
            }
            // hollow bottom:
            if (solid_bottom == false)
                if(width == length && round == true ){
                        translate([overall_width/2,overall_length/2,-roof_thickness]) cylinder(block_height*height,d=overall_length-wall_thickness*2,$fs=cylinder_precision,$fa=5);
                  if(width == 1) translate([overall_width/2,overall_length/2,-roof_thickness]) cylinder(block_height/3,d=(overall_length-wall_thickness*2)/cos(180/8),$fn=8);
                        // place for knobs if >1
                        if(width > 1 || length >1) translate([wall_thickness,wall_thickness,-roof_thickness]) cube([overall_length-wall_thickness*2,overall_width-wall_thickness*2,block_height/3]);
                }// end round
                else translate([wall_thickness,wall_thickness,-roof_thickness]) cube([overall_length-wall_thickness*2,overall_width-wall_thickness*2,block_height*height]);


            // round 1x1 -> groove around bottom
            if(round == true && width == 1 && length ==1 && !(height==1/3&&flat_top))translate([overall_length/2,overall_width/2])
                rotate_extrude($fs=cylinder_precision,$fa=5)translate([overall_length/2,0])
                square([overall_length-(sqrt(2)*knob_spacing-knob_diameter),block_height/2-wall_thickness/2],true);

            // flat_top -> groove around bottom
            if (flat_top == true) {
                translate([-wall_thickness/2,-wall_thickness*2/3,-wall_thickness/2])
                    cube([overall_length+wall_thickness,wall_thickness,wall_thickness]);
                translate([-wall_thickness/2,overall_width-wall_thickness/3,-wall_thickness/2])
                    cube([overall_length+wall_thickness,wall_thickness,wall_thickness]);
    
                translate([-wall_thickness*2/3,-wall_thickness/2,-wall_thickness/2])
                    cube([wall_thickness,overall_width+wall_thickness,wall_thickness]);
                translate([overall_length-wall_thickness/3,0,-wall_thickness/2])
                    cube([wall_thickness,overall_width+wall_thickness,wall_thickness]);
                if(round)translate([overall_length/2,overall_width/2])
                rotate_extrude($fs=cylinder_precision,$fa=5)translate([overall_length/2,0])square([wall_thickness*2/3,wall_thickness],true);
            }
            if (axle_hole==true)
                if (width>1 && length>1)
                  for (ycount=[0:width-2])
                    for (xcount=[0:length-2])
                        translate([
                          knob_diameter/2+wall_thickness+knob_spacing/2+xcount*knob_spacing,
                          knob_diameter/2+wall_thickness+knob_spacing/2+ycount*knob_spacing,
                          solid_bottom?-.1:+block_height/3-roof_thickness
                        ])
                        axle(height*block_height+roof_thickness/2);
// circular hole
            if (circular_hole==true)
                if (width>1 && length>1)
                  for (ycount=[0:width-2])
                    for (xcount=[0:length-2])
                        translate([
                          knob_diameter/2+wall_thickness+knob_spacing/2+xcount*knob_spacing,
                          knob_diameter/2+wall_thickness+knob_spacing/2+ycount*knob_spacing,
                          -roof_thickness/8
                        ])
                        cylinder(r=axle_diameter/2, h=height*block_height+roof_thickness/4,$fs=cylinder_precision);

// cut knobs if round
        if(round==true&&width==length)translate([overall_length/2,overall_width/2])rotate_extrude($fs=cylinder_precision,$fa=5)translate([overall_length/2,-1])square([20,height*block_height+10],false);
        } // end difference line 81

        if (reinforcement==true && width>1 && length>1)
            difference() {
                for (ycount=[0:width-2])
                    for (xcount=[0:length-2])
                        translate([
                            knob_diameter/2+wall_thickness+knob_spacing/2+xcount*knob_spacing,
                            knob_diameter/2+wall_thickness+knob_spacing/2+ycount*knob_spacing,
                            0])
                        reinforcement(height);
                for (ycount=[0:width-2])
                    for (xcount=[0:length-2])
                        translate([
                            knob_diameter/2+wall_thickness+knob_spacing/2+xcount*knob_spacing,
                            knob_diameter/2+wall_thickness+knob_spacing/2+ycount*knob_spacing,
                            -roof_thickness/2])
                                cylinder(r=axle_diameter/2, h=height*block_height+roof_thickness, $fs=cylinder_precision,$fa=5);
            }
        // posts:
        if (solid_bottom == false){
            if (width>1 && length>1)
                for (ycount=[0:width  -2])
                    for (xcount=[0:length -2])translate([
                        knob_diameter/2+wall_thickness+knob_spacing/2+xcount*knob_spacing,
                        knob_diameter/2+wall_thickness+knob_spacing/2+ycount*knob_spacing,
                        0])
                    post(height,axle_hole,circular_hole);
        }
        if (reinforcement == true && width==1 && length!=1)
            for (xcount=[0:length -2])
                translate([
                  knob_diameter/2+wall_thickness+knob_spacing/2+xcount*knob_spacing,
                  overall_width/2,
                  0])
                cylinder(r=pin_diameter/2,h=block_height*height,$fs=cylinder_precision);

        if (reinforcement == true && length==1 && width!=1)
            for (ycount=[0:width -2])
                translate([
                  overall_length/2,
                  knob_diameter/2+wall_thickness+knob_spacing/2+ycount*knob_spacing,
                  0])
                cylinder(r=pin_diameter/2,h=block_height*height,$fs=cylinder_precision);
    }
}

module post(height,axle_hole,circular_hole) {
    difference() {
        cylinder(r=post_diameter/2, h=height*block_height-roof_thickness/2,$fs=cylinder_precision);
        translate([0,0,-roof_thickness/2])
      if(!axle_hole)cylinder(r=knob_diameter/2, h=height*block_height+roof_thickness/4,$fs=cylinder_precision);
      
      if(axle_hole){
        translate([0,0,-roof_thickness/4])axle(height*block_height+roof_thickness/2);
        cylinder(r=axle_diameter/2, h=(block_height/3-roof_thickness)*2,center=true,$fs=cylinder_precision,$fa=5);
      }
      if(circular_hole)translate([0,0,-roof_thickness/4])cylinder(r=axle_diameter/2, h=height*block_height+roof_thickness/2,$fs=cylinder_precision,$fa=5);
    }
}

module reinforcement(height) {
    union() {
        translate([0,0,height*block_height/2]) union() {
            cube([reinforcing_width,knob_spacing+knob_diameter+wall_thickness/2,height*block_height],center=true);
            rotate(v=[0,0,1],a=90) cube([reinforcing_width,knob_spacing+knob_diameter+wall_thickness/2,height*block_height], center=true);
        }
    }
}

module axle(height) {
  assert(height);
  translate([0,0,height/2-.01])
    intersection(){
      union(){
        cube([axle_diameter,axle_spline_width,height],center=true);
        cube([axle_spline_width,axle_diameter,height],center=true);
      }
    cylinder(r=axle_diameter/2, h=height,center=true,$fa=5,$fs=cylinder_precision);
    }
}

//EOF