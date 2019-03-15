include <MCAD/materials/visibonecolors.scad>;

module visibonecolorstest()
{
	/*
	216 colors: 12 x 18 matrix
	Not all colors are tested because OpenSCAD has limited support
	for variable re-assignment :(
	'nuff said!
	*/
	colors =
	[PPR, PPM, RRP, MMP, DRP, DMP, LRP, LMP, DPR, DPM, LPR, LPM, 
	MPR, MPM, OOY, OOR, YYO, RRO, DYO, DRO, LYO, LRO, DOY, DOR, 
	LOY, LOR, MOY, MOR, SSG, SSY, GGS, YYS, DGS, DYS, LGS, LYS, 
	DSG, DSY, LSG, LSY, MSG, MSY, TTC, TTG, CCT, GGT, DCT, DGT, 
	LCT, LGT, DTC, DTG, LTC, LTG, MTC, MTG, AAB, AAC, BBA, CCA, 
	DBA, DCA, LBA, LCA, DAB, DAC, LAB, LAC, MAB, MAC, VVM, VVB, 
	MMV, BBV, DMV, DBV, LMV, LBV, DVM, DVB, LVM, LVB, MVM, MVB, 
	OWM, ODM, DFM, DHM, M, DWM, DDM, MFM, LHM, MWM, LDM, LFM, 
	LWM, PDM, PWM, OWR, ODR, DFR, DHR, R, DWR, DDR, MFR, LHR, 
	MWR, LDR, LFR, LWR, PDR, PWR, OWY, ODY, DFY, DHY, Y, DWY, 
	DDY, MFY, LHY, MWY, LDY, LFY, LWY, PDY, PWY, OWG, ODG, DFG, 
	DHG, G, DWG, DDG, MFG, LHG, MWG, LDG, LFG, LWG, PDG, PWG, 
	OWC, ODC, DFC, DHC, C, DWC, DDC, MFC, LHC, MWC, LDC, LFC, 
	LWC, PDC, PWC, OWB, ODB, DFB, DHB, B, DWB, DDB, MFB, LHB, 
	MWB, LDB, LFB, LWB, PDB, PWB, ODP, DDP, LDP, PDP, DHP, LHP, 
	ODO, DDO, LDO, PDO, DHO, LHO, ODS, DDS, LDS, PDS, DHS, LHS, 
	ODT, DDT, LDT, PDT, DHT, LHT, ODA, DDA, LDA, PDA, DHA, LHA, 
	ODV, DDV, LDV, PDV, DHV, LHV, K, OG, DG, LG, PG, W];

	for (i=[1:12])
	{
		for (j=[1:18])
		{
			color(colors[i*j]) translate([(i-1)*4,(j-1)*4,0]) sphere(2);
		}
	}
}

visibonecolorstest();
