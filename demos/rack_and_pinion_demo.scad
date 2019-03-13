
include<MCAD / gears / rack_and_pinion.scad>;

// examples of usage
// include this in your code:
// use <rack_and_pinion.scad>
// then:
// a simple rack
rack(4,
     20,
     10,
     1); // CP (mm/tooth), width (mm), thickness(of base) (mm), # teeth
// a simple pinion and translation / rotation to make it mesh the rack
translate([ 0, -8.5, 0 ]) rotate([ 0, 0, 360 / 10 / 2 ]) pinion(4, 10, 10, 5);