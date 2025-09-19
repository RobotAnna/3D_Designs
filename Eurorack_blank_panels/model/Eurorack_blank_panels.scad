//
// PARAMETRIC EURORACK BLANK PANELS
//
// Blank panels for eurorack modular synth, based on intellijel specifications. Modular design: export custom sized panels.
//
// My boyfriend spends a lot of his hard-earned cash on modular synth accessories. I made him some blank panels in matt black PLA+, so he didn't have to purchase them. After receiving the first panel he asked for a different size, and then one more… so I made a parametric design, to generate every possible size.
//
// Feel free to use, share, remix, and give them to your modular friends. Spread some good vibes. Don't sell for a profit – modulars are already pricey enough.
//
// Author: RobotAnna
// https://www.printables.com/@RobotAnna
//
// CC Attribution-NonCommercial-ShareAlike 4.0 International
// http://creativecommons.org/licenses/by-nc-sa/4.0/
//
// References:
// (1) IJ specifications https://intellijel.com/support/1u-technical-specifications/
// (2) Doepfer A-100 Construction Details https://www.doepfer.de/a100_man/a100m_e.htm



// PARAMETERS
p_u         =  1;  // Height Units (U), 1 or 3. *Ref(1): 1U = 39.65mm tall, 3U = 128.5mm tall.
p_hp        = 12;  // Width Horizontal Pitch (HP), 2 - 32
p_label     =  1;  // Do you want a label? 1=yes, 0=no
p_tolerance =  0.5;  // Do you want wiggle-room, or a tight fit? 0mm for a tight fit, 0.2 - 0.5mm for wigglin'.
p_smoothing = 100;  // cylinder smoothing, also for text: set to 60 while designing, and up to 300 for the final render.



// CONSTANTS
c_height       = 2;    // Thickness of the plate in mm; I recommend to keep this at 2 mm.
c_bevel_radius = 2;    // Size of the rounded corner. 2 mm looks ok to me; if you make it too large, it will overlap the hole.
c_hole_dia     = 3.2;  // *Ref(1): hole diameter = 3.2 mm
c_hole_to_side = 7.5;  // *Ref(1): distance from center of hole to side edge = 7.5 mm
c_hole_to_top  = 3;    // *Ref(1): distance from center of hole to top edge = 3 mm
c_fontname     = "Arial:style=Bold";
c_textsize     = 6;
c_textdepth    = c_height/2;  // How deep should the text cutout be. I prefer half the panel thickness.



// DERIVED
d_width = p_hp * 5.08; // *Ref(2): width is measured in HP, 1 HP = 5.08 mm
d_depth = (p_u == 1) ? 39.65-p_tolerance : 128.5-p_tolerance; // *Ref(1): an IJ case has a 2mm rim, so the sizes of the panels are 39.65 and 128.5. If you are using a different brand case, then you may need to increase the heights, to anything up to *Ref(2) 44.45mm and 133.4mm



// MODULES
// colors are not necessary, it just helps to debug the code

module baseplate() {
    color("LightSeaGreen")
    translate([c_bevel_radius, c_bevel_radius, 0])
    minkowski() {
        cube([d_width - 2*c_bevel_radius, d_depth - 2*c_bevel_radius, c_height/2], center=false);
        cylinder(c_height/2, d=2*c_bevel_radius, center=false, $fn=p_smoothing);
    }
}

module platehole() {
    color("Wheat")
    hull() {
        translate([0, 0, 0])
        cylinder(h=c_height, d=c_hole_dia, center=false, $fn=p_smoothing);
        translate([c_hole_dia, 0, 0])
        cylinder(h=c_height, d=c_hole_dia, center=false, $fn=p_smoothing);
    }
}

module label() {
    wordtext = "hi";
    translate([d_width/2, d_depth/2, 2-c_textdepth])
    linear_extrude(c_textdepth) {    
        color("White")
        text(str(p_hp), size=c_textsize, font=c_fontname, valign="center", halign="center", $fn=p_smoothing);
    }
}

module holed_baseplate() {
difference() {
    baseplate();

    if (p_hp < 6) { // HP is 5 or less: only one hole top and bottom

        color("MistyRose")
        translate([d_width/2 - c_hole_dia/2, c_hole_to_top, 0])
        platehole();

        color("Thistle")
        translate([d_width/2 - c_hole_dia/2, d_depth-c_hole_to_top, 0])
        platehole();

    } else { // HP is 6 or more: two holes top and bottom

        color("LightCoral")
        translate([c_hole_to_side - c_hole_dia/2, c_hole_to_top, 0])
        platehole();

        color("MistyRose")
        translate([c_hole_to_side - c_hole_dia/2, d_depth - c_hole_to_top, 0])
        platehole();

        color("Thistle")
        translate([d_width - c_hole_to_side - c_hole_dia/2, c_hole_to_top, 0])
        platehole();

        color("White")
        translate([d_width - c_hole_to_side - c_hole_dia/2, d_depth - c_hole_to_top, 0])
        platehole();
    }
    if (p_label == 1) {
        label();
    }
    }
}

// PUT IT ALL TOGETHER
holed_baseplate();
