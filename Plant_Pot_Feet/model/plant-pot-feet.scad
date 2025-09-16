//
// PARAMETRIC POT FEET
//
// For outdoor potted plants:
// Raise your pot off the ground or balcony, to allow for better drainage.
//
// Author: RobotAnna
// https://www.printables.com/@RobotAnna
// CC Public Domain



// PARAMETERS
length    = 70; // length of the semi-circle (front to back of foot)
width     = 30; // width of the foot; 25mm for large pots, 10mm for small pots
thickness = 15; // thickness of the circle; 15mm for large pots, 8mm for small pots
smoothing = 100; // cylinder smoothing: set to 60 while designing, and up to 300 for the final render.

// CONSTANTS

// DERIVED

// MODULES

module foot() {
difference() {

    // colors are not necessary, this just helps to debug the code

    color("Wheat")
    translate([0,0,0])
    cylinder(h=width, d=length, center=false, $fn=smoothing);

    color("LightGreen")
    translate([0,0,0])
    cylinder(h=width, d=length - 2*thickness, center=false, $fn=smoothing);

    color("LightPink")
    translate([-length/2, -length/2, 0])
    cube([length, length/2 + thickness/4, width], center=false);    
}

color("Thistle")
translate([-length/2 + thickness, length/2 - thickness, 0])
cube([length - thickness, thickness, width], center=false); 

color("LightSalmon")
translate([-length/2 + thickness, length/2 - thickness/2, 0])
cylinder(h=width, d=thickness*1.5, center=false, $fn=smoothing); 
}



// PUT IT ALL TOGETHER
foot();

// you can also resize the foot to a specific size, instead of modifying parameters
//resize(newsize=[15, 50, 20]) foot();

