//
// PARAMETRIC EURORACK BLANK PANELS
//
// Blank panels for eurorack modular synth, based on intellijel specifications. Modular design: export custom sized panels.
//
// My boyfriend spends a lot of his hard-earned cash on modular synth accessories. I made him some blank panels in matt black PLA+. After receiving the first panel he asked for a different size, and then one more… so I made a parametric design, to generate every possible size.
// Feel free to use, share, remix, and give them to your modular friends. Spread some good vibes. Don't sell for a profit – modulars are already pricey enough.
//
// Author: RobotAnna
// https://www.printables.com/@RobotAnna
//
// CC Attribution-NonCommercial-ShareAlike 4.0 International
// http://creativecommons.org/licenses/by-nc-sa/4.0/
//
// References
// IJ specifications: https://intellijel.com/support/1u-technical-specifications/
// Doepfer A-100 Construction Details: https://www.doepfer.de/a100_man/a100m_e.htm


// PARAMETERS
p_u         =  1;   // Height Units (U), 1 or 3. 1U = 39.65 mm tall, 3U = 128.5 mm tall.
p_hp        = 16;   // Width Horizontal Pitch (HP), 2 - 32
p_ribs      =  0;   // Do you want ribs? 1=yes, 0=no
p_label     =  1;   // Do you want a label? 1=yes, 0=no

p_tolerance =  0.2;  // Do you want wiggle-room, or a tight fit? 0 mm for a tight fit.
p_smoothing = 60;    // cylinder smoothing, also for text: set to 60 while designing, and up to 300 for the final render.


// CONSTANTS
c_height       = 2;    // Thickness of the plate in mm; I recommend to keep this at 2 mm.
c_bevel_radius = 2;    // Size of the rounded corner. 2 mm looks ok to me; if you make it too large, it will overlap the hole.
c_hole_dia     = 3.2;  // hole diameter = 3.2 mm
c_hole_to_side = 7.5;  // distance from center of hole to side edge = 7.5 mm
c_hole_to_top  = 3;    // distance from center of hole to top edge = 3 mm


// DERIVED
d_width = p_hp * 5.08; // Width is measured in HP, 1 HP = 5.08 mm
d_depth = (p_u == 1) ? 39.65 : 128.5;



// MODULES
// colors are not necessary, it just helps to debug the code
// Purple -- Thistle, MediumPurple
// Pinks  -- MistyRose, Violet, LightPink
// Blues  -- PowderBlue, DeepSkyBlue
// Browns -- Cornsilk, Wheat, Tan
// Greens -- PaleGreen, LightSeaGreen
// Reds   -- LightCoral, IndianRed
// Orange -- LightSalmon, Orange
// Yellow -- LemonChiffon, Khaki
// Whites -- White, Ivory
// Grays  -- Gainsboro, Silver

module baseplate() {
    color("LightSeaGreen")
    translate([c_bevel_radius, c_bevel_radius, 0])
    minkowski() {
        cube([d_width, d_depth, c_height/2], center=false);
        cylinder(c_height/2, d=2*c_bevel_radius, center=false, $fn=p_smoothing);
    }
}

module platehole() {
    color("Wheat")
    hull() {
        color("LemonChiffon")
        translate([1.6, c_hole_dia/2, 0])
        cylinder(h=c_height*2, d=c_hole_dia, center=false, $fn=p_smoothing);
        color("LightSalmon")
        translate([4.9, c_hole_dia/2, 0])
        cylinder(h=c_height*2, d=c_hole_dia, center=false, $fn=p_smoothing);
    }
}


// PUT IT ALL TOGETHER
baseplate();

translate([3,0,0]) platehole();
