/**************************************************************************
 * File: visibonecolors.scad - a VisiBone-based color library for OpenSCAD
 * Date: 2011-02-24
 * Version: 0.1
 * Author: Miles Lightwood <m@teamteamusa.com>
 * Copyright (C): 2011
 *
 * Color nomenclature by Bob Stein <stein@visibone.com>
 *
 * All measurements in millimeters
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the Creative Commons - LGPL License (cc-lgpl) as
 * published by the Creative Commons Corporation.
 *  
 * See http://creativecommons.org/licenses/LGPL/2.1/ for details.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 **************************************************************************/

/* Visibone Colors http://www.visibone.com/colorlab/ */
PPR = [255/255,   0/255, 102/255]; /* Pink Pink Red */
PPM = [255/255,   0/255, 153/255]; /* Pink Pink Magenta */
RRP = [255/255,   0/255,  51/255]; /* Red Red Pink */
MMP = [255/255,   0/255, 204/255]; /* Magenta Magenta Pink */
DRP = [204/255,   0/255,  51/255]; /* Dark Red Pink */
DMP = [204/255,   0/255, 153/255]; /* Dark Magenta Pink */
LRP = [255/255,  51/255, 102/255]; /* Light Red Pink */
LMP = [255/255,  51/255, 204/255]; /* Light Magenta Pink */
DPR = [153/255,   0/255,  51/255]; /* Dark Pink Red */
DPM = [153/255,   0/255, 102/255]; /* Dark Pink Magenta */
LPR = [255/255, 102/255, 153/255]; /* Light Pink Red */
LPM = [255/255, 102/255, 204/255]; /* Light Pink Magenta */
MPR = [204/255,  51/255, 102/255]; /* Medium Pink Red */
MPM = [204/255,  51/255, 153/255]; /* Medium Pink Magenta */
OOY = [255/255, 153/255,   0/255]; /* Orange Orange Yellow */
OOR = [255/255, 102/255,   0/255]; /* Orange Orange Red */
YYO = [255/255, 204/255,   0/255]; /* Yellow Yellow Orange */
RRO = [255/255,  51/255,   0/255]; /* Red Red Orange */
DYO = [204/255, 153/255,   0/255]; /* Dark Yellow Orange */
DRO = [204/255,  51/255,   0/255]; /* Dark Red Orange */
LYO = [255/255, 204/255,  51/255]; /* Light Yellow Orange */
LRO = [255/255, 102/255,  51/255]; /* Light Red Orange */
DOY = [153/255, 102/255,   0/255]; /* Dark Orange Yellow */
DOR = [153/255,  51/255,   0/255]; /* Dark Orange Red */
LOY = [255/255, 204/255, 102/255]; /* Light Orange Yellow */
LOR = [255/255, 153/255, 102/255]; /* Light Orange Red */
MOY = [204/255, 153/255,  51/255]; /* Medium Orange Yellow */
MOR = [204/255, 102/255,  51/255]; /* Medium Orange Red */
SSG = [102/255, 255/255,   0/255]; /* Spring Spring Green */
SSY = [153/255, 255/255,   0/255]; /* Spring Spring Yellow */
GGS = [ 51/255, 255/255,   0/255]; /* Green Green Spring */
YYS = [204/255, 255/255,   0/255]; /* Yellow Yellow Spring */
DGS = [ 51/255, 204/255,   0/255]; /* Dark Green Spring */
DYS = [153/255, 204/255,   0/255]; /* Dark Yellow Spring */
LGS = [102/255, 255/255,  51/255]; /* Light Green Spring */
LYS = [204/255, 255/255,  51/255]; /* Light Yellow Spring */
DSG = [ 51/255, 153/255,   0/255]; /* Dark Spring Green */
DSY = [102/255, 153/255,   0/255]; /* Dark Spring Yellow */
LSG = [153/255, 255/255, 102/255]; /* Light Spring Green */
LSY = [204/255, 255/255, 102/255]; /* Light Spring Yellow */
MSG = [102/255, 204/255,  51/255]; /* Medium Spring Green */
MSY = [153/255, 204/255,  51/255]; /* Medium Spring Yellow */
TTC = [  0/255, 255/255, 153/255]; /* Teal Teal Cyan */
TTG = [  0/255, 255/255, 102/255]; /* Teal Teal Green */
CCT = [  0/255, 255/255, 204/255]; /* Cyan Cyan Teal */
GGT = [  0/255, 255/255,  51/255]; /* Green Green Teal */
DCT = [  0/255, 204/255, 153/255]; /* Dark Cyan Teal */
DGT = [  0/255, 204/255,  51/255]; /* Dark Green Teal */
LCT = [ 51/255, 255/255, 204/255]; /* Light Cyan Teal */
LGT = [ 51/255, 255/255, 102/255]; /* Light Green Teal */
DTC = [  0/255, 153/255, 102/255]; /* Dark Teal Cyan */
DTG = [  0/255, 153/255,  51/255]; /* Dark Teal Green */
LTC = [102/255, 255/255, 204/255]; /* Light Teal Cyan */
LTG = [102/255, 255/255, 153/255]; /* Light Teal Green */
MTC = [ 51/255, 204/255, 153/255]; /* Medium Teal Cyan */
MTG = [ 51/255, 204/255, 102/255]; /* Medium Teal Green */
AAB = [  0/255, 102/255, 255/255]; /* Azure Azure Blue */
AAC = [  0/255, 153/255, 255/255]; /* Azure Azure Cyan */
BBA = [  0/255,  51/255, 255/255]; /* Blue Blue Azure */
CCA = [  0/255, 204/255, 255/255]; /* Cyan Cyan Azure */
DBA = [  0/255,  51/255, 204/255]; /* Dark Blue Azure */
DCA = [  0/255, 153/255, 204/255]; /* Dark Cyan Azure */
LBA = [ 51/255, 102/255, 255/255]; /* Light Blue Azure */
LCA = [ 51/255, 204/255, 255/255]; /* Light Cyan Azure */
DAB = [  0/255,  51/255, 153/255]; /* Dark Azure Blue */
DAC = [  0/255, 102/255, 153/255]; /* Dark Azure Cyan */
LAB = [102/255, 153/255, 255/255]; /* Light Azure Blue */
LAC = [102/255, 204/255, 255/255]; /* Light Azure Cyan */
MAB = [ 51/255, 102/255, 204/255]; /* Medium Azure Blue */
MAC = [ 51/255, 153/255, 204/255]; /* Medium Azure Cyan */
VVM = [153/255,   0/255, 255/255]; /* Violet Violet Magenta */
VVB = [102/255,   0/255, 255/255]; /* Violet Violet Blue */
MMV = [204/255,   0/255, 255/255]; /* Magenta Magenta Violet */
BBV = [ 51/255,   0/255, 255/255]; /* Blue Blue Violet */
DMV = [153/255,   0/255, 204/255]; /* Dark Magenta Violet */
DBV = [ 51/255,   0/255, 204/255]; /* Dark Blue Violet */
LMV = [204/255,  51/255, 255/255]; /* Light Magenta Violet */
LBV = [102/255,  51/255, 255/255]; /* Light Blue Violet */
DVM = [102/255,   0/255, 153/255]; /* Dark Violet Magenta */
DVB = [ 51/255,   0/255, 153/255]; /* Dark Violet Blue */
LVM = [204/255, 102/255, 255/255]; /* Light Violet Magenta */
LVB = [153/255, 102/255, 255/255]; /* Light Violet Blue */
MVM = [153/255,  51/255, 204/255]; /* Medium Violet Magenta */
MVB = [102/255,  51/255, 204/255]; /* Medium Violet Blue */
OWM = [ 51/255,   0/255,  51/255]; /* Obscure Weak Magenta */
ODM = [102/255,   0/255, 102/255]; /* Obscure Dull Magenta */
DFM = [153/255,   0/255, 153/255]; /* Dark Faded Magenta */
DHM = [204/255,   0/255, 204/255]; /* Dark Hard Magenta */
M   = [255/255,   0/255, 255/255]; /* Magenta */
DWM = [102/255,  51/255, 102/255]; /* Dark Weak Magenta */
DDM = [153/255,  51/255, 153/255]; /* Dark Dull Magenta */
MFM = [204/255,  51/255, 204/255]; /* Medium Faded Magenta */
LHM = [255/255,  51/255, 255/255]; /* Light Hard Magenta */
MWM = [153/255, 102/255, 153/255]; /* Medium Weak Magenta */
LDM = [204/255, 102/255, 204/255]; /* Light Dull Magenta */
LFM = [255/255, 102/255, 255/255]; /* Light Faded Magenta */
LWM = [204/255, 153/255, 204/255]; /* Light Weak Magenta */
PDM = [255/255, 153/255, 255/255]; /* Pale Dull Magenta */
PWM = [255/255, 204/255, 255/255]; /* Pale Weak Magenta */
OWR = [ 51/255,   0/255,   0/255]; /* Obscure Weak Red */
ODR = [102/255,   0/255,   0/255]; /* Obscure Dull Red */
DFR = [153/255,   0/255,   0/255]; /* Dark Faded Red */
DHR = [204/255,   0/255,   0/255]; /* Dark Hard Red */
R   = [255/255,   0/255,   0/255]; /* Red */
DWR = [102/255,  51/255,  51/255]; /* Dark Weak Red */
DDR = [153/255,  51/255,  51/255]; /* Dark Dull Red */
MFR = [204/255,  51/255,  51/255]; /* Medium Faded Red */
LHR = [255/255,  51/255,  51/255]; /* Light Hard Red */
MWR = [153/255, 102/255, 102/255]; /* Medium Weak Red */
LDR = [204/255, 102/255, 102/255]; /* Light Dull Red */
LFR = [255/255, 102/255, 102/255]; /* Light Faded Red */
LWR = [204/255, 153/255, 153/255]; /* Light Weak Red */
PDR = [255/255, 153/255, 153/255]; /* Pale Dull Red */
PWR = [255/255, 204/255, 204/255]; /* Pale Weak Red */
OWY = [ 51/255,  51/255,   0/255]; /* Obscure Weak Yellow */
ODY = [102/255, 102/255,   0/255]; /* Obscure Dull Yellow */
DFY = [153/255, 153/255,   0/255]; /* Dark Faded Yellow */
DHY = [204/255, 204/255,   0/255]; /* Dark Hard Yellow */
Y   = [255/255, 255/255,   0/255]; /* Yellow */
DWY = [102/255, 102/255,  51/255]; /* Dark Weak Yellow */
DDY = [153/255, 153/255,  51/255]; /* Dark Dull Yellow */
MFY = [204/255, 204/255,  51/255]; /* Medium Faded Yellow */
LHY = [255/255, 255/255,  51/255]; /* Light Hard Yellow */
MWY = [153/255, 153/255, 102/255]; /* Medium Weak Yellow */
LDY = [204/255, 204/255, 102/255]; /* Light Dull Yellow */
LFY = [255/255, 255/255, 102/255]; /* Light Faded Yellow */
LWY = [204/255, 204/255, 153/255]; /* Light Weak Yellow */
PDY = [255/255, 255/255, 153/255]; /* Pale Dull Yellow */
PWY = [255/255, 255/255, 204/255]; /* Pale Weak Yellow */
OWG = [  0/255,  51/255,   0/255]; /* Obscure Weak Green */
ODG = [  0/255, 102/255,   0/255]; /* Obscure Dull Green */
DFG = [  0/255, 153/255,   0/255]; /* Dark Faded Green */
DHG = [  0/255, 204/255,   0/255]; /* Dark Hard Green */
G   = [  0/255, 255/255,   0/255]; /* Green */
DWG = [ 51/255, 102/255,  51/255]; /* Dark Weak Green */
DDG = [ 51/255, 153/255,  51/255]; /* Dark Dull Green */
MFG = [ 51/255, 204/255,  51/255]; /* Medium Faded Green */
LHG = [ 51/255, 255/255,  51/255]; /* Light Hard Green */
MWG = [102/255, 153/255, 102/255]; /* Medium Weak Green */
LDG = [102/255, 204/255, 102/255]; /* Light Dull Green */
LFG = [102/255, 255/255, 102/255]; /* Light Faded Green */
LWG = [153/255, 204/255, 153/255]; /* Light Weak Green */
PDG = [153/255, 255/255, 153/255]; /* Pale Dull Green */
PWG = [204/255, 255/255, 204/255]; /* Pale Weak Green */
OWC = [  0/255,  51/255,  51/255]; /* Obscure Weak Cyan */
ODC = [  0/255, 102/255, 102/255]; /* Obscure Dull Cyan */
DFC = [  0/255, 153/255, 153/255]; /* Dark Faded Cyan */
DHC = [  0/255, 204/255, 204/255]; /* Dark Hard Cyan */
C   = [  0/255, 255/255, 255/255]; /* Cyan */
DWC = [ 51/255, 102/255, 102/255]; /* Dark Weak Cyan */
DDC = [ 51/255, 153/255, 153/255]; /* Dark Dull Cyan */
MFC = [ 51/255, 204/255, 204/255]; /* Medium Faded Cyan */
LHC = [ 51/255, 255/255, 255/255]; /* Light Hard Cyan */
MWC = [102/255, 153/255, 153/255]; /* Medium Weak Cyan */
LDC = [102/255, 204/255, 204/255]; /* Light Dull Cyan */
LFC = [102/255, 255/255, 255/255]; /* Light Faded Cyan */
LWC = [153/255, 204/255, 204/255]; /* Light Weak Cyan */
PDC = [153/255, 255/255, 255/255]; /* Pale Dull Cyan */
PWC = [204/255, 255/255, 255/255]; /* Pale Weak Cyan */
OWB = [  0/255,   0/255,  51/255]; /* Obscure Weak Blue */
ODB = [  0/255,   0/255, 102/255]; /* Obscure Dull Blue */
DFB = [  0/255,   0/255, 153/255]; /* Dark Faded Blue */
DHB = [  0/255,   0/255, 204/255]; /* Dark Hard Blue */
B   = [  0/255,   0/255, 255/255]; /* Blue */
DWB = [ 51/255,  51/255, 102/255]; /* Dark Weak Blue */
DDB = [ 51/255,  51/255, 153/255]; /* Dark Dull Blue */
MFB = [ 51/255,  51/255, 204/255]; /* Medium Faded Blue */
LHB = [ 51/255,  51/255, 255/255]; /* Light Hard Blue */
MWB = [102/255, 102/255, 153/255]; /* Medium Weak Blue */
LDB = [102/255, 102/255, 204/255]; /* Light Dull Blue */
LFB = [102/255, 102/255, 255/255]; /* Light Faded Blue */
LWB = [153/255, 153/255, 204/255]; /* Light Weak Blue */
PDB = [153/255, 153/255, 255/255]; /* Pale Dull Blue */
PWB = [204/255, 204/255, 255/255]; /* Pale Weak Blue */
ODP = [102/255,   0/255,  51/255]; /* Obscure Dull Pink */
DDP = [153/255,  51/255, 102/255]; /* Dark Dull Pink */
LDP = [204/255, 102/255, 153/255]; /* Light Dull Pink */
PDP = [255/255, 153/255, 204/255]; /* Pale Dull Pink */
DHP = [204/255,   0/255, 102/255]; /* Dark Hard Pink */
LHP = [255/255,  51/255, 153/255]; /* Light Hard Pink */
ODO = [102/255,  51/255,   0/255]; /* Obscure Dull Orange */
DDO = [153/255, 102/255,  51/255]; /* Dark Dull Orange */
LDO = [204/255, 153/255, 102/255]; /* Light Dull Orange */
PDO = [255/255, 204/255, 153/255]; /* Pale Dull Orange */
DHO = [204/255, 102/255,   0/255]; /* Dark Hard Orange */
LHO = [255/255, 153/255,  51/255]; /* Light Hard Orange */
ODS = [ 51/255, 102/255,   0/255]; /* Obscure Dull Spring */
DDS = [102/255, 153/255,  51/255]; /* Dark Dull Spring */
LDS = [153/255, 204/255, 102/255]; /* Light Dull Spring */
PDS = [204/255, 255/255, 153/255]; /* Pale Dull Spring */
DHS = [102/255, 204/255,   0/255]; /* Dark Hard Spring */
LHS = [153/255, 255/255,  51/255]; /* Light Hard Spring */
ODT = [  0/255, 102/255,  51/255]; /* Obscure Dull Teal */
DDT = [ 51/255, 153/255, 102/255]; /* Dark Dull Teal */
LDT = [102/255, 204/255, 153/255]; /* Light Dull Teal */
PDT = [153/255, 255/255, 204/255]; /* Pale Dull Teal */
DHT = [  0/255, 204/255, 102/255]; /* Dark Hard Teal */
LHT = [ 51/255, 255/255, 153/255]; /* Light Hard Teal */
ODA = [  0/255,  51/255, 102/255]; /* Obscure Dull Azure */
DDA = [ 51/255, 102/255, 153/255]; /* Dark Dull Azure */
LDA = [102/255, 153/255, 204/255]; /* Light Dull Azure */
PDA = [153/255, 204/255, 255/255]; /* Pale Dull Azure */
DHA = [  0/255, 102/255, 204/255]; /* Dark Hard Azure */
LHA = [ 51/255, 153/255, 255/255]; /* Light Hard Azure */
ODV = [ 51/255,   0/255, 102/255]; /* Obscure Dull Violet */
DDV = [102/255,  51/255, 153/255]; /* Dark Dull Violet */
LDV = [153/255, 102/255, 204/255]; /* Light Dull Violet */
PDV = [204/255, 153/255, 255/255]; /* Pale Dull Violet */
DHV = [102/255,   0/255, 204/255]; /* Dark Hard Violet */
LHV = [153/255,  51/255, 255/255]; /* Light Hard Violet */
K   = [  0/255,   0/255,   0/255]; /* Black */
OG  = [ 51/255,  51/255,  51/255]; /* Obscure Gray */
DG  = [102/255, 102/255, 102/255]; /* Dark Gray */
LG  = [153/255, 153/255, 153/255]; /* Light Gray */
PG  = [204/255, 204/255, 204/255]; /* Pale Gray */
W   = [255/255, 255/255, 255/255]; /* White */

module colorshelp()
{
   echo("--- visibonecolorshelp ---");
   echo("color(PPR); /* Pink Pink Red */");
   echo("color(PPM); /* Pink Pink Magenta */");
   echo("color(RRP); /* Red Red Pink */");
   echo("color(MMP); /* Magenta Magenta Pink */");
   echo("color(DRP); /* Dark Red Pink */");
   echo("color(DMP); /* Dark Magenta Pink */");
   echo("color(LRP); /* Light Red Pink */");
   echo("color(LMP); /* Light Magenta Pink */");
   echo("color(DPR); /* Dark Pink Red */");
   echo("color(DPM); /* Dark Pink Magenta */");
   echo("color(LPR); /* Light Pink Red */");
   echo("color(LPM); /* Light Pink Magenta */");
   echo("color(MPR); /* Medium Pink Red */");
   echo("color(MPM); /* Medium Pink Magenta */");
   echo("color(OOY); /* Orange Orange Yellow */");
   echo("color(OOR); /* Orange Orange Red */");
   echo("color(YYO); /* Yellow Yellow Orange */");
   echo("color(RRO); /* Red Red Orange */");
   echo("color(DYO); /* Dark Yellow Orange */");
   echo("color(DRO); /* Dark Red Orange */");
   echo("color(LYO); /* Light Yellow Orange */");
   echo("color(LRO); /* Light Red Orange */");
   echo("color(DOY); /* Dark Orange Yellow */");
   echo("color(DOR); /* Dark Orange Red */");
   echo("color(LOY); /* Light Orange Yellow */");
   echo("color(LOR); /* Light Orange Red */");
   echo("color(MOY); /* Medium Orange Yellow */");
   echo("color(MOR); /* Medium Orange Red */");
   echo("color(SSG); /* Spring Spring Green */");
   echo("color(SSY); /* Spring Spring Yellow */");
   echo("color(GGS); /* Green Green Spring */");
   echo("color(YYS); /* Yellow Yellow Spring */");
   echo("color(DGS); /* Dark Green Spring */");
   echo("color(DYS); /* Dark Yellow Spring */");
   echo("color(LGS); /* Light Green Spring */");
   echo("color(LYS); /* Light Yellow Spring */");
   echo("color(DSG); /* Dark Spring Green */");
   echo("color(DSY); /* Dark Spring Yellow */");
   echo("color(LSG); /* Light Spring Green */");
   echo("color(LSY); /* Light Spring Yellow */");
   echo("color(MSG); /* Medium Spring Green */");
   echo("color(MSY); /* Medium Spring Yellow */");
   echo("color(TTC); /* Teal Teal Cyan */");
   echo("color(TTG); /* Teal Teal Green */");
   echo("color(CCT); /* Cyan Cyan Teal */");
   echo("color(GGT); /* Green Green Teal */");
   echo("color(DCT); /* Dark Cyan Teal */");
   echo("color(DGT); /* Dark Green Teal */");
   echo("color(LCT); /* Light Cyan Teal */");
   echo("color(LGT); /* Light Green Teal */");
   echo("color(DTC); /* Dark Teal Cyan */");
   echo("color(DTG); /* Dark Teal Green */");
   echo("color(LTC); /* Light Teal Cyan */");
   echo("color(LTG); /* Light Teal Green */");
   echo("color(MTC); /* Medium Teal Cyan */");
   echo("color(MTG); /* Medium Teal Green */");
   echo("color(AAB); /* Azure Azure Blue */");
   echo("color(AAC); /* Azure Azure Cyan */");
   echo("color(BBA); /* Blue Blue Azure */");
   echo("color(CCA); /* Cyan Cyan Azure */");
   echo("color(DBA); /* Dark Blue Azure */");
   echo("color(DCA); /* Dark Cyan Azure */");
   echo("color(LBA); /* Light Blue Azure */");
   echo("color(LCA); /* Light Cyan Azure */");
   echo("color(DAB); /* Dark Azure Blue */");
   echo("color(DAC); /* Dark Azure Cyan */");
   echo("color(LAB); /* Light Azure Blue */");
   echo("color(LAC); /* Light Azure Cyan */");
   echo("color(MAB); /* Medium Azure Blue */");
   echo("color(MAC); /* Medium Azure Cyan */");
   echo("color(VVM); /* Violet Violet Magenta */");
   echo("color(VVB); /* Violet Violet Blue */");
   echo("color(MMV); /* Magenta Magenta Violet */");
   echo("color(BBV); /* Blue Blue Violet */");
   echo("color(DMV); /* Dark Magenta Violet */");
   echo("color(DBV); /* Dark Blue Violet */");
   echo("color(LMV); /* Light Magenta Violet */");
   echo("color(LBV); /* Light Blue Violet */");
   echo("color(DVM); /* Dark Violet Magenta */");
   echo("color(DVB); /* Dark Violet Blue */");
   echo("color(LVM); /* Light Violet Magenta */");
   echo("color(LVB); /* Light Violet Blue */");
   echo("color(MVM); /* Medium Violet Magenta */");
   echo("color(MVB); /* Medium Violet Blue */");
   echo("color(OWM); /* Obscure Weak Magenta */");
   echo("color(ODM); /* Obscure Dull Magenta */");
   echo("color(DFM); /* Dark Faded Magenta */");
   echo("color(DHM); /* Dark Hard Magenta */");
   echo("color(M);   /* Magenta */");
   echo("color(DWM); /* Dark Weak Magenta */");
   echo("color(DDM); /* Dark Dull Magenta */");
   echo("color(MFM); /* Medium Faded Magenta */");
   echo("color(LHM); /* Light Hard Magenta */");
   echo("color(MWM); /* Medium Weak Magenta */");
   echo("color(LDM); /* Light Dull Magenta */");
   echo("color(LFM); /* Light Faded Magenta */");
   echo("color(LWM); /* Light Weak Magenta */");
   echo("color(PDM); /* Pale Dull Magenta */");
   echo("color(PWM); /* Pale Weak Magenta */");
   echo("color(OWR); /* Obscure Weak Red */");
   echo("color(ODR); /* Obscure Dull Red */");
   echo("color(DFR); /* Dark Faded Red */");
   echo("color(DHR); /* Dark Hard Red */");
   echo("color(R);   /* Red */");
   echo("color(DWR); /* Dark Weak Red */");
   echo("color(DDR); /* Dark Dull Red */");
   echo("color(MFR); /* Medium Faded Red */");
   echo("color(LHR); /* Light Hard Red */");
   echo("color(MWR); /* Medium Weak Red */");
   echo("color(LDR); /* Light Dull Red */");
   echo("color(LFR); /* Light Faded Red */");
   echo("color(LWR); /* Light Weak Red */");
   echo("color(PDR); /* Pale Dull Red */");
   echo("color(PWR); /* Pale Weak Red */");
   echo("color(OWY); /* Obscure Weak Yellow */");
   echo("color(ODY); /* Obscure Dull Yellow */");
   echo("color(DFY); /* Dark Faded Yellow */");
   echo("color(DHY); /* Dark Hard Yellow */");
   echo("color(Y);   /* Yellow */");
   echo("color(DWY); /* Dark Weak Yellow */");
   echo("color(DDY); /* Dark Dull Yellow */");
   echo("color(MFY); /* Medium Faded Yellow */");
   echo("color(LHY); /* Light Hard Yellow */");
   echo("color(MWY); /* Medium Weak Yellow */");
   echo("color(LDY); /* Light Dull Yellow */");
   echo("color(LFY); /* Light Faded Yellow */");
   echo("color(LWY); /* Light Weak Yellow */");
   echo("color(PDY); /* Pale Dull Yellow */");
   echo("color(PWY); /* Pale Weak Yellow */");
   echo("color(OWG); /* Obscure Weak Green */");
   echo("color(ODG); /* Obscure Dull Green */");
   echo("color(DFG); /* Dark Faded Green */");
   echo("color(DHG); /* Dark Hard Green */");
   echo("color(G);   /* Green */");
   echo("color(DWG); /* Dark Weak Green */");
   echo("color(DDG); /* Dark Dull Green */");
   echo("color(MFG); /* Medium Faded Green */");
   echo("color(LHG); /* Light Hard Green */");
   echo("color(MWG); /* Medium Weak Green */");
   echo("color(LDG); /* Light Dull Green */");
   echo("color(LFG); /* Light Faded Green */");
   echo("color(LWG); /* Light Weak Green */");
   echo("color(PDG); /* Pale Dull Green */");
   echo("color(PWG); /* Pale Weak Green */");
   echo("color(OWC); /* Obscure Weak Cyan */");
   echo("color(ODC); /* Obscure Dull Cyan */");
   echo("color(DFC); /* Dark Faded Cyan */");
   echo("color(DHC); /* Dark Hard Cyan */");
   echo("color(C);   /* Cyan */");
   echo("color(DWC); /* Dark Weak Cyan */");
   echo("color(DDC); /* Dark Dull Cyan */");
   echo("color(MFC); /* Medium Faded Cyan */");
   echo("color(LHC); /* Light Hard Cyan */");
   echo("color(MWC); /* Medium Weak Cyan */");
   echo("color(LDC); /* Light Dull Cyan */");
   echo("color(LFC); /* Light Faded Cyan */");
   echo("color(LWC); /* Light Weak Cyan */");
   echo("color(PDC); /* Pale Dull Cyan */");
   echo("color(PWC); /* Pale Weak Cyan */");
   echo("color(OWB); /* Obscure Weak Blue */");
   echo("color(ODB); /* Obscure Dull Blue */");
   echo("color(DFB); /* Dark Faded Blue */");
   echo("color(DHB); /* Dark Hard Blue */");
   echo("color(B);   /* Blue */");
   echo("color(DWB); /* Dark Weak Blue */");
   echo("color(DDB); /* Dark Dull Blue */");
   echo("color(MFB); /* Medium Faded Blue */");
   echo("color(LHB); /* Light Hard Blue */");
   echo("color(MWB); /* Medium Weak Blue */");
   echo("color(LDB); /* Light Dull Blue */");
   echo("color(LFB); /* Light Faded Blue */");
   echo("color(LWB); /* Light Weak Blue */");
   echo("color(PDB); /* Pale Dull Blue */");
   echo("color(PWB); /* Pale Weak Blue */");
   echo("color(ODP); /* Obscure Dull Pink */");
   echo("color(DDP); /* Dark Dull Pink */");
   echo("color(LDP); /* Light Dull Pink */");
   echo("color(PDP); /* Pale Dull Pink */");
   echo("color(DHP); /* Dark Hard Pink */");
   echo("color(LHP); /* Light Hard Pink */");
   echo("color(ODO); /* Obscure Dull Orange */");
   echo("color(DDO); /* Dark Dull Orange */");
   echo("color(LDO); /* Light Dull Orange */");
   echo("color(PDO); /* Pale Dull Orange */");
   echo("color(DHO); /* Dark Hard Orange */");
   echo("color(LHO); /* Light Hard Orange */");
   echo("color(ODS); /* Obscure Dull Spring */");
   echo("color(DDS); /* Dark Dull Spring */");
   echo("color(LDS); /* Light Dull Spring */");
   echo("color(PDS); /* Pale Dull Spring */");
   echo("color(DHS); /* Dark Hard Spring */");
   echo("color(LHS); /* Light Hard Spring */");
   echo("color(ODT); /* Obscure Dull Teal */");
   echo("color(DDT); /* Dark Dull Teal */");
   echo("color(LDT); /* Light Dull Teal */");
   echo("color(PDT); /* Pale Dull Teal */");
   echo("color(DHT); /* Dark Hard Teal */");
   echo("color(LHT); /* Light Hard Teal */");
   echo("color(ODA); /* Obscure Dull Azure */");
   echo("color(DDA); /* Dark Dull Azure */");
   echo("color(LDA); /* Light Dull Azure */");
   echo("color(PDA); /* Pale Dull Azure */");
   echo("color(DHA); /* Dark Hard Azure */");
   echo("color(LHA); /* Light Hard Azure */");
   echo("color(ODV); /* Obscure Dull Violet */");
   echo("color(DDV); /* Dark Dull Violet */");
   echo("color(LDV); /* Light Dull Violet */");
   echo("color(PDV); /* Pale Dull Violet */");
   echo("color(DHV); /* Dark Hard Violet */");
   echo("color(LHV); /* Light Hard Violet */");
   echo("color(K);   /* Black */");
   echo("color(OG);  /* Obscure Gray */");
   echo("color(DG);  /* Dark Gray */");
   echo("color(LG);  /* Light Gray */");
   echo("color(PG);  /* Pale Gray */");
   echo("color(W);   /* White */");
}
