
//test
//airfoilSection();

module airfoil(	length=50, 
					sections=20, 
					rootAOA=0,
					tipAOA=0,
					rootChord=0.7,
					rootThickness=2,
					tipChord=0.2,
					tipThickness=0.2){



	function get_ps(i,sections) = i/sections;
	function get_pe(i,sections) = (i+1)/sections;

	layerHeight=length/sections;
	layerAOA=(rootAOA-tipAOA)/sections;
	layerPercent=100/(sections-1);
	rotate([90,0,0])
	rotate([0,0,-rootAOA])
	for ( i = [0 : sections-1] ){
		translate(v=[0,0,(i*layerHeight)+(layerHeight/2)])
			rotate([0,0,layerAOA*i])
				color([0.5-((i/2)/sections),0,((i)/sections)],0.5)
				airfoilSection(	length=layerHeight,
								rotation=layerAOA,
								root_scale_x=get_chord(i/sections),	
								tip_scale_x=get_chord((i+1)/sections),
								root_scale_y=get_depth(i/sections),	
								tip_scale_y=get_depth((i+1)/sections),
								root_camber_max=get_mc(i/sections),
								tip_camber_max=get_mc((i+1)/sections));
	}
}

module airfoilSection(root_camber_max =10,
                       tip_camber_max = 10,
                       root_camber_position = 4, 
                       tip_camber_position = 4, 
                       root_thickness = 20,
                       tip_thickness = 20,
			   root_scale_x=10,
			   root_scale_y=10,
			   tip_scale_x=10,
			   tip_scale_y=10,
			   rotation=0,
                       length=1) {
        //Expanding on the work of:
        //https://github.com/tjhowse/printawing/blob/a406715b4f5d3d5d2bd6b7e64843012068a98fb5/wing.scad
        root_m =  root_camber_max/100;
        tip_m =  tip_camber_max/100;
        root_p =  root_camber_position/10;
        tip_p =  tip_camber_position/10;
        root_t =  root_thickness/100;   
        tip_t  =  tip_thickness/100;      
        pts = 25; // datapoints on each of upper and lower surfaces
        
        function xx(i) = 1 - cos((i-1)*90/(pts-1));
        function yt(i,t) = t/0.2*(0.2969*pow(xx(i),0.5) - 0.126*xx(i)-0.3516*pow(xx(i),2) + 0.2843*pow(xx(i),3) - 0.1015*pow(xx(i),4));
        function yc(i,p,m)    = xx(i)<p ? m/pow(p,2)*(2*p*xx(i) - pow(xx(i),2)) : m/pow(1-p,2)*(1 - 2*p + 2*p*xx(i) - pow(xx(i),2));

        function xu(j,p,m,t,s) = (xx(j) - yt(j,t)*(sin(atan((yc(j,p,m)-yc(j-1,p,m))/(xx(j)-xx(j-1)))))-0.5)*s;
        function yu(j,p,m,t,s) = (yc(j,p,m) + yt(j,t)*(cos(atan(( yc(j,p,m)-yc(j-1,p,m))/(xx(j)-xx(j-1)))))-0)*s;
        function xl(j,p,m,t,s)  = (xx(j) + yt(j,t)*(sin(atan((yc(j,p,m)-yc(j-1,p,m))/(xx(j)-xx(j-1)))))-0.5)*s;
        function yl(j,p,m,t,s)  = (yc(j,p,m) - yt(j,t)*(cos(atan((yc(j,p,m)-yc(j-1,p,m))/(xx(j)-xx(j-1)))))-0)*s;

        function rot_xu(j,p,m,t,r,sx,sy) = xu(j,p,m,t,sx)*cos(r)  -  yu(j,p,m,t,sy)*sin(r);
        function rot_yu(j,p,m,t,r,sx,sy) = yu(j,p,m,t,sy)*cos(r)  +  xu(j,p,m,t,sx)*sin(r);
        function rot_xl(j,p,m,t,r,sx,sy) = xl(j,p,m,t,sx)*cos(r)    -  yl(j,p,m,t,sy)*sin(r) ;
        function rot_yl(j,p,m,t,r,sx,sy) = yl(j,p,m,t,sy)*cos(r)    +  xl(j,p,m,t,sx)*sin(r);

        function ryt(i) = yt(i,root_t);
        function ryc(i) = yc(i,root_p,root_m);

        function rxu(j) = xu(j,root_p,root_m,root_t,root_scale_x);
        function ryu(j) = yu(j,root_p,root_m,root_t,root_scale_y);
        function rxl(j) = xl(j,root_p,root_m,root_t,root_scale_x);
        function ryl(j) = yl(j,root_p,root_m,root_t,root_scale_y);

        function tyt(i) = yt(i,tip_t);
        function tyc(i) = yc(i,tip_p,tip_m);

        function txu(j) = rot_xu(j,tip_p,tip_m,tip_t,rotation,tip_scale_x,tip_scale_y);
        function tyu(j) = rot_yu(j,tip_p,tip_m,tip_t,rotation,tip_scale_x,tip_scale_y);
        function txl(j) = rot_xl(j,tip_p,tip_m,tip_t,rotation,tip_scale_x,tip_scale_y);
        function tyl(j) = rot_yl(j,tip_p,tip_m,tip_t,rotation,tip_scale_x,tip_scale_y);


        polyhedron( points=[ 
            // tip upper side front-to-back
 [txu(01),tyu(01),length/2],[txu(02),tyu(02),length/2],[txu(03),tyu(03),length/2],[txu(04),tyu(04),length/2],[txu(05),tyu(05),length/2],
 [txu(06),tyu(06),length/2],[txu(07),tyu(07),length/2],[txu(08),tyu(08),length/2],[txu(09),tyu(09),length/2],[txu(10),tyu(10),length/2],
 [txu(11),tyu(11),length/2],[txu(12),tyu(12),length/2],[txu(13),tyu(13),length/2],[txu(14),tyu(14),length/2],[txu(15),tyu(15),length/2],
 [txu(16),tyu(16),length/2],[txu(17),tyu(17),length/2],[txu(18),tyu(18),length/2],[txu(19),tyu(19),length/2],[txu(20),tyu(20),length/2],
 [txu(21),tyu(21),length/2],[txu(22),tyu(22),length/2],[txu(23),tyu(23),length/2],[txu(24),tyu(24),length/2],[txu(25),tyu(25),length/2],

            // tip lower side back to front
            [txl(25),tyl(25),length/2],
            [txl(24),tyl(24),length/2],
            [txl(23),tyl(23),length/2],
            [txl(22),tyl(22),length/2],
            [txl(21),tyl(21),length/2],
            [txl(20),tyl(20),length/2],
            [txl(19),tyl(19),length/2],
            [txl(18),tyl(18),length/2],
            [txl(17),tyl(17),length/2],
            [txl(16),tyl(16),length/2],
            [txl(15),tyl(15),length/2],
            [txl(14),tyl(14),length/2],
            [txl(13),tyl(13),length/2],
            [txl(12),tyl(12),length/2],
            [txl(11),tyl(11),length/2],
            [txl(10),tyl(10),length/2],
            [txl(09),tyl(09),length/2],
            [txl(08),tyl(08),length/2],
            [txl(07),tyl(07),length/2],
            [txl(06),tyl(06),length/2],
            [txl(05),tyl(05),length/2],
            [txl(04),tyl(04),length/2],
            [txl(03),tyl(03),length/2],
            [txl(02),tyl(02),length/2],

            // root upper side front-to-back
            [rxu(01),ryu(01),-length/2],
            [rxu(02),ryu(02),-length/2],
            [rxu(03),ryu(03),-length/2],
            [rxu(04),ryu(04),-length/2],
            [rxu(05),ryu(05),-length/2],
            [rxu(06),ryu(06),-length/2],
            [rxu(07),ryu(07),-length/2],
            [rxu(08),ryu(08),-length/2],
            [rxu(09),ryu(09),-length/2],
            [rxu(10),ryu(10),-length/2],
            [rxu(11),ryu(11),-length/2],
            [rxu(12),ryu(12),-length/2],
            [rxu(13),ryu(13),-length/2],
            [rxu(14),ryu(14),-length/2],
            [rxu(15),ryu(15),-length/2],
            [rxu(16),ryu(16),-length/2],
            [rxu(17),ryu(17),-length/2],
            [rxu(18),ryu(18),-length/2],
            [rxu(19),ryu(19),-length/2],
            [rxu(20),ryu(20),-length/2],
            [rxu(21),ryu(21),-length/2],
            [rxu(22),ryu(22),-length/2],
            [rxu(23),ryu(23),-length/2],
            [rxu(24),ryu(24),-length/2],
            [rxu(25),ryu(25),-length/2],

            // root lower side back to front
            [rxl(25),ryl(25),-length/2], 
            [rxl(24),ryl(24),-length/2],
            [rxl(23),ryl(23),-length/2],
            [rxl(22),ryl(22),-length/2],
            [rxl(21),ryl(21),-length/2],
            [rxl(20),ryl(20),-length/2],
            [rxl(19),ryl(19),-length/2],
            [rxl(18),ryl(18),-length/2],
            [rxl(17),ryl(17),-length/2],
            [rxl(16),ryl(16),-length/2],
            [rxl(15),ryl(15),-length/2],
            [rxl(14),ryl(14),-length/2],
            [rxl(13),ryl(13),-length/2],
            [rxl(12),ryl(12),-length/2],
            [rxl(11),ryl(11),-length/2],
            [rxl(10),ryl(10),-length/2],
            [rxl(09),ryl(09),-length/2],
            [rxl(08),ryl(08),-length/2],
            [rxl(07),ryl(07),-length/2],
            [rxl(06),ryl(06),-length/2],
            [rxl(05),ryl(05),-length/2],
            [rxl(04),ryl(04),-length/2],
            [rxl(03),ryl(03),-length/2],
            [rxl(02),ryl(02),-length/2]           
        ],
        faces=[
            [00,01,48],[47,48,01],
            [01,02,47],[46,47,02],    
            [02,03,46],[45,46,03],           
            [03,04,45],[44,45,04],     
            [04,05,44],[43,44,05],            
            [05,06,43],[42,43,06],
            [06,07,42],[41,42,07],
            [07,08,41],[40,41,08],
            [08,09,40],[39,40,09],
            [09,10,39],[38,39,10],
            [10,11,38],[37,38,11],
            [11,12,37],[36,37,12],
            [12,13,36],[35,36,13],
            [13,14,35],[34,35,14],
            [14,15,34],[33,34,15],
            [15,16,33],[32,33,16],
            [16,17,32],[31,32,17],
            [17,18,31],[30,31,18],
            [18,19,30],[29,30,19],
            [19,20,29],[28,29,20],
            [20,21,28],[27,28,21],
            [21,22,27],[26,27,22],
            [22,23,26],[25,26,23],  
            [23,24,25],    



[01,00,49],
	[02,01,50],
	[03,02,51],
	[04,03,52],
	[05,04,53],
	[06,05,54],
	[07,06,55],
	[08,07,56],
	[09,08,57],
	[10,09,58],
	[11,10,59],
	[12,11,60],
	[13,12,61],
	[14,13,62],
	[15,14,63],
	[16,15,64],
	[17,16,65],
	[18,17,66],
	[19,18,67],
	[20,19,68],
	[21,20,69],
	[22,21,70],
	[23,22,71],
	[24,23,72],
	[25,24,73],
	[26,25,74],
	[27,26,75],
	[28,27,76],
	[29,28,77],
	[30,29,78],
	[31,30,79],
	[32,31,80],
	[33,32,81],
	[34,33,82],
	[35,34,83],
	[36,35,84],
	[37,36,85],
	[38,37,86],
	[39,38,87],
	[40,39,88],
	[41,40,89],
	[42,41,90],
	[43,42,91],
	[44,43,92],
	[45,44,93],
	[46,45,94],
	[47,46,95],
	[48,47,96],
	[00,48,97],

    [01,49,50],
	[02,50,51],
	[03,51,52],
	[04,52,53],
	[05,53,54],
	[06,54,55],
	[07,55,56],
	[08,56,57],
	[09,57,58],
	[10,58,59],
	[11,59,60],
	[12,60,61],
	[13,61,62],
	[14,62,63],
	[15,63,64],
	[16,64,65],
	[17,65,66],
	[18,66,67],
	[19,67,68],
	[20,68,69],
	[21,69,70],
	[22,70,71],
	[23,71,72],
	[24,72,73],
	[25,73,74],
	[26,74,75],
	[27,75,76],
	[28,76,77],
	[29,77,78],
	[30,78,79],
	[31,79,80],
	[32,80,81],
	[33,81,82],
	[34,82,83],
	[35,83,84],
	[36,84,85],
	[37,85,86],
	[38,86,87],
	[39,87,88],
	[40,88,89],
	[41,89,90],
	[42,90,91],
	[43,91,92],
	[44,92,93],
	[45,93,94],
	[46,94,95],
	[47,95,96],
	[48,96,97],
	[00,97,49],


    [50,49,97],[97,96,50],
    [51,50,96],[96,95,51],
	[52,51,95],	[95,94,52],
	[53,52,94],[94,93,53],
	[54,53,93],[93,92,54],
	[55,54,92],[92,91,55],
	[56,55,91],[91,90,56],
	[57,56,90],[90,89,57],
	[58,57,89],[89,88,58],
	[59,58,88],[88,87,59],
	[60,59,87],[87,86,60],
	[61,60,86],[86,85,61],
	[62,61,85],[85,84,62],
	[63,62,84],[84,83,63],
	[64,63,83],[83,82,64],
	[65,64,82],[82,81,65],
	[66,65,81],[81,80,66],
	[67,66,80],[80,79,67],
	[68,67,79],[79,78,68],
	[69,68,78],[78,77,69],
	[70,69,77],[77,76,70],
	[71,70,76],[76,75,71],
	[72,71,75],[75,74,72],
	[73,72,74],
    ] ,
    convexity=2); 
}
