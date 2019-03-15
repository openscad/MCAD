include <name_tag.scad>;

translate([0,0,0])
name_tag("name_tag");

translate([20,0,0]) // 0 + 16/2 + 16/2 + 4
name_tag("NAME_TAG");

translate([52,0,0]) // 20 + 16/2 + 40/2 + 4
name_tag("name_tag", block_size=5);

translate([96,0,0]) // 52 + 40/2 + 40/2 + 4
name_tag("NAME_TAG", block_size=5);

translate([130,0,0]) // 92 + 40/2 + 16/2 + 4
name_tag("name_tag", height=30);

translate([150,0,0]) // 130 + 16/2 + 16/2 + 4
name_tag("NAME_TAG", height=30);
