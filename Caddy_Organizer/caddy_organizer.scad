//
// PARAMETRIC CADDY
//

// For storing oil and salt in the kitchen, or jars of paint on the crafts desk.

// Author: RobotAnna
// https://www.printables.com/@RobotAnna
// CC Public Domain



// Parameters
bottle_diameter = 52;
tray_height     = 30;
spacing         =  8;
chamfer         =  2;
nr_bottles      =  4;
smoothing       = 60; // cylinder smoothing: set to 60 for experiments, and up to 300 for final render.

// Derived
tray_width     = bottle_diameter   + (2*spacing);
tray_halfwidth = bottle_diameter/2 + spacing;
tray_length    = ((nr_bottles-2) * bottle_diameter) + ((nr_bottles-1)*spacing) + bottle_diameter;



module hole(){
    union() {
        color("LightSalmon") cylinder(h=tray_height-spacing-chamfer, d=bottle_diameter, center=false, $fn=smoothing);
        color("LightSalmon") translate([0, 0, tray_height-spacing-chamfer]) cylinder(h=chamfer, d1=bottle_diameter, d2=bottle_diameter+2*chamfer, $fn=smoothing);
    }
}



module base(){
    union(){
        translate([tray_halfwidth,0,0]) cylinder(h=tray_height, d=bottle_diameter + 2*spacing, center=false, $fn=smoothing);
        translate([tray_halfwidth,tray_halfwidth * -1,0]) cube([tray_length,tray_width,tray_height]);
        translate([tray_length + tray_halfwidth,0,0]) cylinder(h=tray_height, d=bottle_diameter + 2*spacing, center=false, $fn=smoothing);
    }
}



module foothole(){
    color("LemonChiffon")cylinder(h=spacing/2, d=spacing+1, center=false, $fn=smoothing);
}
module foot(){
    union(){
        cylinder(h=spacing/4, d=spacing, center=false, $fn=smoothing);
        translate([0,0,spacing/4]) cylinder(h=spacing/4, d1=spacing, d2=spacing-1,center=false, $fn=smoothing);
    }
}



// PUT IT TOGETHER

difference() {
    base();

    translate([tray_halfwidth,             tray_halfwidth-spacing,-1]) foothole();
    translate([tray_halfwidth,            -tray_halfwidth+spacing,-1]) foothole();
    translate([tray_length+tray_halfwidth, tray_halfwidth-spacing,-1]) foothole();
    translate([tray_length+tray_halfwidth,-tray_halfwidth+spacing,-1]) foothole();

    for(i = [0:1:nr_bottles-1]){
        translate([bottle_diameter/2 + spacing + i*(bottle_diameter+spacing), 0,spacing]) hole();
    }
}
for(i = [1:1:4]){
    translate([i*spacing*2,-tray_width,0]) foot();
}
