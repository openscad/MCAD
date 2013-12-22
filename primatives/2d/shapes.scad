use <regularShapes.scad>;
use <ngons.scad>;

shapes();
include <../../layouts.scad>;


module shapes() {
  grid(500,500,true,4){
    ngons();
    regularShapes();
  }
}
