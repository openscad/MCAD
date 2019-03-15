/*
Parametric Name Tag 
Tony Buser <tbuser@gmail.com>
http://tonybuser.com
http://creativecommons.org/licenses/by/3.0/
*/

use <bitmap.scad>

/*
 chars = chars array
 block_size = letter size (block size 1 will result in 8mm per letter)
 height = the Z height of each letter in mm
 key_ring_hole = (boolean) Append a hole to a keyring, necklace etc. ?
*/
module name_tag(chars = ["R", "E", "P", "R", "A", "P"],
    block_size = 2, height = 3, key_ring_hole = true) {
  char_count = len(chars);
  union() {
    translate(v = [0,-block_size*8*char_count/2+block_size*8/2,3]) {
      8bit_str(chars, char_count, block_size, height);
    }
    translate(v = [0,0,3/2]) {
      color([0,0,1,1]) {
        cube(size = [block_size * 8, block_size * 8 * char_count, 3], center = true);
      }
    }
    if (key_ring_hole == true){
      translate([0, block_size * 8 * (char_count+1)/2, 3/2])	
      difference(){
        cube(size = [block_size * 8, block_size * 8 , 3], center = true);
        cube(size = [block_size * 4, block_size * 4 , 5], center = true);
      }
    }
  }
}
