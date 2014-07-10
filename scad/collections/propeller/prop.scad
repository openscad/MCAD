include <aerofoil.scad>

$fn=64;
d=0.01;
	//Leading edge to training edge distance.
	 function get_chord(p) = lookup(p, [
                [ 0.0, 5 ],
                [ 0.1, 8.2 ],
                [ 0.2, 10 ],
                [ 0.3, 11.2 ],
                [ 0.4, 12 ],
                [ 0.5, 12 ],
                [ 0.6, 11.2 ],
                [ 0.7, 10 ],
                [ 0.8, 8.6 ],
                [ 0.9, 6.4],
                [ 1.0, 4]
        ]);

	//depth of airofoil
	 function get_depth(p) = lookup(p, [
                [0.00, 18 ],
                [0.06, 14 ],
                [0.12, 12 ],
                [0.15, 11 ],
                [0.17, 10 ],
                [0.20, 9 ],
                [0.23, 8 ],
                [0.30, 6 ],
                [1.00, 02 ]
        ]);

	//max camber "curveyness"
	 function get_mc(p) = lookup(p, [
                [ 0, 0 ],
		  [0.2,5 ],
		  [0.5,20 ],
                [ 1, 20 ]
        ]);

//prop();

module prop(	blades=3,
				hubRadius=10,
				height=10,
				stork=2,
				or=10,
				ir=8){

	/*color("DarkSlateGray")blades(	h=height+d,
									or=or,
									ir=ir,
									blades=blades, 
									stork=stork);*/

	mountBearing(blades=blades,or=or,ir=ir);

}

//mountBearing();
module mountBearing(	blades=2,
							r=10,
							height=10,
							stork=3,
							ir=10,
							or=11,
							inner_bearing=2.5){
	difference(){
		cylinder(h=height, r= ir);// non slip shape
		translate(v=[0,0,-d]) blades(blade="false",h=height+(2*d),or=or+d+1,ir=ir,blades=blades);
		translate(v=[0,0,-d]) cylinder(h=height+2*d, r= inner_bearing);
		
	}
}

//nonslip();
module nonslip(height=10,
			ir =5,
			or=6,
			teeth=8) {
	cylinder(h=height, r=ir);

	for ( i = [0 : teeth] ){
		rotate([0,0,360/teeth*i]){
			mountFlush(depth=height,ir=5,or=6, a=90/teeth);
		}	
	}

}

//blades();
module blades(	h=12,
					or=10,
					ir=9, 
					blades=3,
					stork=2.5,
					rootAOA=40,
					tipAOA=15,
					blade="true"){
	for ( i = [0 : blades] ){
		rotate([0,0,360/blades*i]){
				//color([1/blades*i,0,1-(1/blades*i)])
					bladeassembley(length=70,
										sections=50,
										rootChord=0.4,
										tipChord=0.1, 
										rootThickness=0.6,
										tipThickness=0.1,
										stork=stork, 
										flushangle=(180/blades),
										blade=blade,
										depth=h,
										rootAOA=rootAOA,
										tipAOA=tipAOA,
										or=or,
										ir=ir);
		}	
	}	
}

bladeassembley();
module bladeassembley(length=50, 
				depth=10,
				sections=50, 
				rootAOA=40,
				tipAOA=15,
				rootChord=0.6,
				tipChord=0.2,
				rootThickness=1,
				tipThickness=0.2,
				or=11,
				ir=10,
				flushangle=35,
				blade="true"){
	if (blade=="true"){
		intersection(){
			difference(){
				translate(v=[0,-ir,depth/10*6])
					airfoil(length=length,
							sections=sections,
							rootAOA=rootAOA,
							tipAOA=tipAOA,
							rootChord=rootChord,
							tipChord=tipChord,
							rootThickness=rootThickness,
							tipThickness=tipThickness);
				//translate(v=[0,0,-depth/2])
					//cylinder(h=2*depth,r=(or+ir)/2);
			}
		mountFlush(depth=depth,or=or+length, ir=or, a=flushangle);
		}

	}
	translate(v=[0,0,0]){
		mount(width=4,
				depth=depth,
				teirs=2,
				ir=ir,
				or=or,
				a=flushangle,
				doflush=blade);
		
	}
}

//airfoil();


//mount();
module mount(	width=4,
					depth=5,
					teirs=4,
					core=2,
					a=20,
					or=11,
					ir=10,
					stork=1.5,
					doflush="true"){
	if (doflush == "true"){
		color("DimGray")mountFlush(depth=depth,or=or, ir=ir, a=a);
	}

	translate(v=[0,-ir,0])
		treefixture(teirWidth=width, 
						length=ir/5*2,
						teirs=teirs,
						depth=depth, 
						stork=stork);
}

module mountFlush(depth=10, or=10, ir=9, a=45){
	difference(){

		//color("green")
		cylinder(h=depth, r=or);

		translate(v=[0,0,-d]){

			cylinder(h=depth+2*d, r=ir);

			translate(v=[-(or+d),0,0]){
				cube([2*(or+d),2*(or+d),depth+2*d]);
			}
		
			rotate(v=[0,0,1],a=180-a){
				cube([2*or+d,2*or+d,depth+2*d]);
			}

			mirror([1,0,0]){
				rotate(v=[0,0,1],a=180-a){
					cube([2*or+d,2*or+d,depth+2*d]);
				}
			}
		}
	}
}

//treefixture();
module treefixture(	teirWidth=5,
							length=5,
							depth=2,
							teirs=4,
							core=2,
							stork=3){
	td=length/teirs;
	color("green") linear_extrude(height =depth){
		translate(v=[0,stork,0])
		for (i = [0 : teirs-1]){
			translate(v=[0,td*i,0])
			color("green")
			lockingTeir(width=teirWidth*(1-(i/(teirs+1))),
							core=core*(1-(i/teirs)),
							storkDepth=td);
			if (i!=teirs-1)
				translate(v=[-core/2*(1-(i/teirs)),td*(i+1)-td/5,0])
					color("darkgreen")square ([core*(1-(i/teirs)),td/5]);
			
		}
		translate(v=[-core/2,0,0]){
			color("red")square([core,stork]);
		}
	}
}

module lockingTeir(width=10,core=5,storkDepth=5){
	polygon(
		points=[
			[-core/2,storkDepth/5*4],
			[core/2,storkDepth/5*4],
			[width/2,storkDepth/5],
			[width/2,0],
			[-width/2,0],
			[-width/2,storkDepth/5]], 
		paths=[
			[0,1,2,3,4,5]]);
}



