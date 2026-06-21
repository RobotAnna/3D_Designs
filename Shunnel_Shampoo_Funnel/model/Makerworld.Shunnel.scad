/* [General Settings] */

// Outer diameter of the top bottle, give 2mm tolerance
dia_outer =  26.0;  // .1

// Inner diameter of the bottom bottle, give 2mm tolerance
dia_inner =  17.0;  // .1

/* [Advanced] */

// You need approx 10mm to transition from large to small
transition = 10.0;  // .1

// Height of each side: 25mm keeps the bottles balancing without support
height     = 25.0;  // .1


// MAIN CODE
module main_code() {
    translate([0,0,0])
    cylinder(h=height, d=dia_inner, center=false, $fa=1);

    translate([0,0,height])
    cylinder(h=transition, d1=dia_inner, d2=dia_outer, center=false, $fa=1);

    translate([0,0,transition+height])
    cylinder(h=height, d=dia_outer, center=false, $fa=1);
}
main_code();



// PARAMETRIC SHUNNEL: SHAMPOO FUNNEL
//
// For decanting shampoo from one bottle to another.
//
// Author: RobotAnna
// https://www.printables.com/@RobotAnna
// 
// CC Attribution-NonCommercial-ShareAlike 4.0 International
// http://creativecommons.org/licenses/by-nc-sa/4.0/

