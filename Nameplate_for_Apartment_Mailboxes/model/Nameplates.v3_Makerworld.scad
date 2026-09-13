
/* [Base Plate] */
// height in mm
height       = 19; // .1
// widtn in mm
width        = 100; // .1
// thickness of the sign, in mm
thickness    = 1.6; // .1


/* [Holes] */
// Do you want holes for screws?
enable_holes = true;
// diameter of the hole, in mm
hole_dia = 3.5; // .1
// distance between the holes, in mm
hole_to_hole = 88; // .1


/* [Text] */
// First line of text
text_line = "Sophie and Sven";
// Text alignment
text_align = "center"; // ["left","center","right"]
// Font size
text_size = 8;  // .1
// How deep is the text inset?
text_depth = 0.6; // .2
//Font name
fontname = "Open Sans"; // [Open Sans, Open Sans Condensed, Ubuntu, Montserrat]


/* [Hidden`] */
text_height = text_thickness==100 ? 0 : (text_thickness>=thickness ? 0: thickness-text_thickness);

// module: base plate
module plate() {
    difference(){
        cube([width, height, thickness]);
    
        if(enable_holes == 1) {
            translate([(width - hole_to_hole)/2, height/2, 0])
            cylinder(h = thickness, d=hole_dia, center=false, $fn=60);

            translate([(width - hole_to_hole)/2 + hole_to_hole, height/2, 0])
            cylinder(h = thickness, d=hole_dia, center=false, $fn=60);
        }
    }
}

// module: text
module words(wordtext) {
    translate([width/2, height/2, text_height])
    linear_extrude(50) {    
        text(wordtext, size=textsize, font=fontname, valign="center", halign="center");
    }
}



// main program
for(i = [0:len(names)-1]) {
    difference() {
        translate([0, 2*(i*height), 0]) plate();
        translate([0, 2*(i*height), 0]) words(names[i]);
    }
}


// PARAMETRIC NAMEPLATES FOR APARTMENT MAILBOXES
//
// A friend asked me to print some name plates for his apartment building's mailboxes. I'm writing these instructions 
// for myself, in case I need to print more later.
//
// Author: RobotAnna
// https://www.printables.com/@RobotAnna
//
// CC Public Domain
// http://creativecommons.org/publicdomain/zero/1.0/

// 20251102 v2 add 2x parameters: custom depth of the text, and disable holes.


// PREPARATION
// Do you want a custom font?
//  - Download and install the font
//  - Copy the font file to the same folder as this openscad file.
//  - Uncomment this line.
//  - Add the font name to the "fontname" parameter.
//use <name_of_font_file.otf>