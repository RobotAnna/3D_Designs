//
// PARAMETRIC SHUNNEL: SHAMPOO FUNNEL
//
// For decanting shampoo from one bottle to another.
//
// Author: RobotAnna
// https://www.printables.com/@RobotAnna
// 
// CC Attribution-NonCommercial-ShareAlike 4.0 International
// http://creativecommons.org/licenses/by-nc-sa/4.0/



// PARAMETERS
dia_outer =  26; // outer diameter of the shampoo bottle, give 2mm tolerance
dia_inner =  17; // inner diameter of the shampoo bottle, give 2mm tolerance
smoothing =  60; // cylinder smoothing: set to 60 while designing, and up to 300 for the final render.



// CONSTANTS
transition = 10; // you need approx 10mm to transition from large to small
height     = 25; // height of each side. 25mm keeps the bottles balancing without support.



// DERIVED



// MODULES



// PUT IT ALL TOGETHER
// colors are not necessary, this just helps to debug the code

color("LightGreen")
translate([0,0,0])
cylinder(h=height, d=dia_inner, center=false, $fn=smoothing);

color("LightPink")
translate([0,0,height])
cylinder(h=transition, d1=dia_inner, d2=dia_outer, center=false, $fn=smoothing); 

color("Wheat")
translate([0,0,transition+height])
cylinder(h=height, d=dia_outer, center=false, $fn=smoothing);
