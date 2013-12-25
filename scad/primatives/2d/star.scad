use <../../utilities/utilities.scad>;
use <../../layouts.scad>;

nStars();
module nStars() {
  grid(105,105,true,4){
    nStar(points=3, ir=10, or=50);
    nStar(points=4, ir=20, or=50);
    nStar(points=5, ir=20, or=40);
    nStar(points=6, ir=25, or=50);
    nStar(points=7, ir=30, or=50);
    nStar(points=8, ir=10, or=50);
    nStar(points=9, ir=40, or=50);
    nStar(points=50, ir=40, or=50);

    nStar(points=3, ir=10, or=50, it=0.4, ot=1);
    nStar(points=4, ir=20, or=50, it=0.4, ot=1);
    nStar(points=5, ir=30, or=40, it=0.4, ot=1);
    nStar(points=6, ir=35, or=50, it=0.4, ot=1);
    nStar(points=7, ir=45, or=50, it=0.4, ot=1);
    nStar(points=8, ir=10, or=50, it=0.95, ot=1);
    nStar(points=9, ir=45, or=50, it=0.6, ot=0.6);
    nStar(points=50,ir=47, or=50, it=1, ot=1);
  }
}

module nStar(points=5,
             or=50,
             ir=45,
				it=0,
				ot=0) {

  for ( i = [0 : points-1] ){
    rotate(v=[0,0,1], i*360/points)
      polygon(points=[
        [0,or],
        rotatePoint([0,or],180/points*it/2),
        rotatePoint([0,ir],180/points*(1-ot/2)),

        rotatePoint([0,ir],180/points),
        [0,0], 
        rotatePoint([0,ir],-180/points),
        rotatePoint([0,ir],-180/points*(1-ot/2)),

        rotatePoint([0,or],-180/points*it/2),
      ]);
  }
}


