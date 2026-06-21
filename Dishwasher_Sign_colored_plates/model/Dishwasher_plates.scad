//
// PARAMETRIC DISHWASHER SIGN PLATES
//
// Colored plates for Bergeron720's dishwasher sign https://makerworld.com/en/models/965214-clean-dirty-dishwasher-sign?from=search#profileId-935601
//
// Author: RobotAnna
// https://www.printables.com/@RobotAnna
//
// CC Attribution-NonCommercial-ShareAlike 4.0 International
// http://creativecommons.org/licenses/by-nc-sa/4.0/



// PARAMETERS
text1     =  "Clean";  // text for sign 1
text2     =  "Dirty";  // text for sign 2
fontname  = "Trebuchet MS:style=Bold";
textsize  = 22;
smoothing = 100; // cylinder smoothing: set to 60 while designing, and up to 300 for the final render.

// CONSTANTS
width  = 84;
depth  = 42;
height = 0.4;  // Bergeron720's design allows for max 1mm plates, so I suggest you keep the height to 0.8mm. That is: 2x 0.2mm layers of the color, and 2x 0.2mm layers of the text



// DERIVED



// MODULES
// colors are not necessary, it just helps to debug the code
module greenplate() {
    color("Green")
    translate([0,depth + 25,0])
    cube([width, depth, height]);

    color("White")
    linear_extrude(0.8) {
        translate([width/2, depth + 25 + depth/2, 0])
        text(text1, size=textsize, font=fontname, valign="center", halign="center", $fn=smoothing);
    }
}

module redplate() {
    color("Red")
    cube([width, depth, height]);

    color("White")
    linear_extrude(0.8) {    
        translate([width/2, depth/2, 0])
        text(text2, size=textsize, font=fontname, valign="center", halign="center", $fn=smoothing);
    }
}



// PUT IT ALL TOGETHER
greenplate();
redplate();


