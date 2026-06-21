/* [Font and Text Settings] */

// text for sign 1
text1     =  "Clean";
// color of sign 1
sign1_color = "Green";  // [Red, Orange, Yellow, Green, Blue, Indigo, Violet]

// text for sign 2
text2     =  "Dirty";
// color of sign 1
sign2_color = "Red";  // [Red, Orange, Yellow, Green, Blue, Indigo, Violet]

// Font Family
fontname  = "Trebuchet";  // [Trebuchet, Noto Sans, Roboto, Open Sans Condensed, Ubuntu Sans, Montserrat]
// Font Style
fontstyle = "Bold";  // [Regular,Bold,Light,Italic,Bold Italic,Light Italic]
// Font Size
fontsize  = 22;  // .1


/* [Sign Baseplate Dimensions] */

// width of the sign
width  = 84;  // .1

// height of the sign
height  = 42;  // .1

// depth of the sign
depth = 0.4;  // .1
// Bergeron720's design allows for max 1mm plates, so I suggest you keep the height to 0.8mm. 
// That is: 2x 0.2mm layers of the color, and 2x 0.2mm layers of the text



// MODULES
// colors are not necessary, it just helps to debug the code
module greenplate() {
    color(sign1_color)
    translate([0, height + 25,0])
    cube([width, height, depth]);

    color("White")
    linear_extrude(depth*2) {
        translate([width/2, height + 25 + height/2, 0])
        text(text1, size=fontsize, font=str(fontname, ":", fontstyle), valign="center", halign="center");
    }
}

module redplate() {
    color(sign2_color)
    cube([width, height, depth]);

    color("White")
    linear_extrude(depth*2) {    
        translate([width/2, height/2, 0])
        text(text2, size=fontsize, font=str(fontname, ":", fontstyle), valign="center", halign="center");
    }
}


//MAIN CODE
greenplate();
redplate();


// PARAMETRIC DISHWASHER SIGN PLATES
//
// Colored plates for Bergeron720's dishwasher sign https://makerworld.com/en/models/965214-clean-dirty-dishwasher-sign?from=search#profileId-935601
//
// Author: RobotAnna
// https://www.printables.com/@RobotAnna
//
// CC Attribution-NonCommercial-ShareAlike 4.0 International
// http://creativecommons.org/licenses/by-nc-sa/4.0/
