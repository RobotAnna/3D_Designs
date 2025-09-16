//
// PARAMETRIC NAMEPLATES FOR APARTMENT MAILBOXES
//
// A friend asked me to print some name plates for his apartment building's mailboxes. I'm writing these instructions for myself, in case I need to print more later.
//
// Author: RobotAnna
// https://www.printables.com/@RobotAnna
// CC Public Domain


// PREPARATION
// For my usecase I need the font DIN1451. Download and install your desired font, and then copy the font file to the same folder as this openscad file.
use <DINMittelschriftStd.otf>



// PARAMETERS
smoothing = 100; // cylinder smoothing, also for text: set to 60 while designing, and up to 300 for the final render.

// dimensions of the base plate
height       = 19;
width        = 100;
thickness    = 1.6;

// specs of the holes
hole_to_hole = 88;
hole_dia     = 3.5; // original spec was 4mm, can't remember why I changed it to 3.5mm

// text
names     = ["Sophie & Sven", "David Smith", "Family Akkers", "Larissa B.", "N. Browning"];  // text for the nameplate
fontname  = "DIN 1451 Std:style=Mittelschrift";
textsize  =   8;



// CONSTANTS



// DERIVED



// MODULES
// colors are not necessary, it just helps to debug the code
module plate() {
    difference(){
        color("Gray")
        cube([width, height, thickness]);
    
        translate([(width - hole_to_hole)/2, height/2, 0])
        color("LightPink")
        cylinder(h = thickness, d=hole_dia, center=false, $fn=smoothing);

        translate([(width - hole_to_hole)/2 + hole_to_hole, height/2, 0])
        color("Aquamarine")
        cylinder(h = thickness, d=hole_dia, center=false, $fn=smoothing);
    }
}

module words(wordtext) {
    translate([width/2, height/2, 0.6])
    linear_extrude(1) {    
        color("White")
        text(wordtext, size=textsize, font=fontname, valign="center", halign="center", $fn=smoothing);
    }
}



// PUT IT ALL TOGETHER
for(i = [0:len(names)-1]) {
    difference() {
        translate([0, 2*(i*height), 0]) plate();
        translate([0, 2*(i*height), 0]) words(names[i]);
    }
}
