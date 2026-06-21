/* [General Settings] */

// diameter of the rod that you will use as a handle
dia_rod   =  8;  // .1

// Height of the part that connects to the rod. I reccommend to keep it at 10mm.
base_height = 10;  // .1


// Base unit
module base() {
    difference() {
        cylinder(h=base_height, d=dia_rod+3, center=false, $fn=100);
        linear_extrude(base_height) circle(d=dia_rod, $fn=6);
    }
}


// Cap
module cap() {
    translate([0,0,base_height])
    sphere(d=dia_rod+3, $fn=100); 
}


// Hook
module hook() {
    translate([0,0,base_height])
    cylinder(h=(dia_rod+3)/2 + dia_rod/4, d1=dia_rod+3, d2=dia_rod/4, center=false, $fn=100);

    translate([0, -dia_rod/6, base_height + (dia_rod+2)])
    rotate([270,0,0])

    difference() {
        cylinder(h=dia_rod/3, d=dia_rod+3,     center=false, $fn=100);
        cylinder(h=dia_rod/3, d=(dia_rod+3)/2, center=false, $fn=100);
        cube((dia_rod+3)/2);
    }
}


// MAIN CODE
translate([dia_rod*3,0,0]) cap();
translate([dia_rod*3,0,0]) base();
hook();
base();


// VENETIAN BLIND -- HANDLE CAPS
//
// Replace the handle of your venetian blinds.
//
// Author: RobotAnna
// https://www.printables.com/@RobotAnna
//
// CC Attribution-NonCommercial-ShareAlike 4.0 International
// http://creativecommons.org/licenses/by-nc-sa/4.0/
