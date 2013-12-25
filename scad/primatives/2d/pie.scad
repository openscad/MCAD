use <../../utilities/utilities.scad>;
use <../../layouts.scad>;

pies();
module pies() {
  grid(105,105,true,4){
    pie(sections=2, r=50,  a=45);
    pie(sections=4, r=50,  a=90);
    pie(sections=3, r=50,  a=180);
    pie(sections=16, r=50,  a=290);

    pie(sections=8, r1=50, r2=35, a=45);
    pie(sections=4, r1=50, r2=15, a=120);
    pie(sections=32,r1=50, r2=10, a=270);
    pie(sections=32,r1=50, r2=35, a=360);
  }
}

module pie(sections=2,
           r=0,
           r1=0,
           r2=25,
		     a=0) {

  function p(g,s) = ((g != 0)? g : s);

  csr = p(r,r1);
  cer = p(r,r2);

  function sp(x,s) = 1-(x/s);
  function ep(x,s) = x/s;

  for ( i = [0 : sections-1] ){
    rotate(v=[0,0,-1], i*a/sections){
      polygon(points=[
        [0,cer*ep(i,sections) + csr*sp(i,sections)],
        rotatePoint([0,csr*sp(i+1,sections) + cer*ep(i+1,sections)
                    ],a/sections),
        [0,0], 
      ]);
    }
  }
}


