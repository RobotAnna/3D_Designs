//
// PARAMETRIC NAMEPLATES FOR APARTMENT MAILBOXES
//
// A friend asked me to print some name plates for his apartment building's mailboxes. I'm writing these instructions 
// for myself, in case I need to print more later.
//
// Author: RobotAnna
// https://www.printables.com/@RobotAnna
//
// CC Attribution-NonCommercial-ShareAlike 4.0 International
// http://creativecommons.org/licenses/by-nc-sa/4.0/

// 20251102 v2 add 2x parameters: custom depth of the text, and disable holes.

// PREPARATION
// Do you want a custom font?
//  - Download and install the font
//  - Copy the font file to the same folder as this openscad file.
//  - Uncomment this line.
//  - Add the font name to the "fontname" parameter.
//use <name_of_font_file.otf>



// PARAMETERS
smoothing = 60; // cylinder smoothing, also for text: set to 60 while designing, and up to 300 for the final render.

// dimensions of the base plate
height       = 19;
width        = 100;
thickness    = 1.6;

// specs of the holes
enable_holes = 1;   // set to 1 if you want holes, 0 if you don't
hole_to_hole = 88;  // distance between the holes, in mm
hole_dia     = 3.5; // diameter of the hole, in mm

// text
names          = ["Sophie & Sven", "David Smith", "Family Akkers", "Larissa B.", "N. Browning"];  // a list of names
fontname       = "DejaVu Sans:style=Book"; // Help --> Font List --> select font --> copy to clipboard 
textsize       = 8;
text_thickness = 0.6; // set to 100 if you want the text to be cut through to the back
                      // set to any other number to be the height in mm that the text should start at
                      // Eg. 0.6 starts at 0.6mm, 3 layers of 0.2mm printing



// CONSTANTS



// DERIVED
text_height = text_thickness==100 ? 0 : (text_thickness>=thickness ? 0: thickness-text_thickness);



// MODULES
// colors are not necessary, it just helps to debug the code

module plate() {
    difference(){
        color("Gray")
        cube([width, height, thickness]);
    
        if(enable_holes == 1) {
            translate([(width - hole_to_hole)/2, height/2, 0])
            color("LightPink")
            cylinder(h = thickness, d=hole_dia, center=false, $fn=smoothing);

            translate([(width - hole_to_hole)/2 + hole_to_hole, height/2, 0])
            color("Aquamarine")
            cylinder(h = thickness, d=hole_dia, center=false, $fn=smoothing);
        }
    }
}

module words(wordtext) {
    translate([width/2, height/2, text_height])
    linear_extrude(50) {    
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
