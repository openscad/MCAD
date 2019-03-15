include <MCAD/hardware/hardware.scad>;

rod(20);
translate([rodsize * 2.5, 0, 0]) rod(20, true);
translate([rodsize * 5, 0, 0]) screw(10, true);
translate([rodsize * 7.5, 0, 0]) bearing();
translate([rodsize * 10, 0, 0]) rodnut();
translate([rodsize * 12.5, 0, 0]) rodwasher();
translate([rodsize * 15, 0, 0]) nut();
translate([rodsize * 17.5, 0, 0]) washer();