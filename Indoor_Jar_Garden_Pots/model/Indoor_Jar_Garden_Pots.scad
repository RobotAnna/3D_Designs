/* [Planter Design] */
// The design of the planter, from boxed to smooth
planter_design = "facets"; // ["box","hex","facets","smooth"]


/* [Measurements] */
// Inner diameter of the jar, in mm
jar_dia = 80;  // .1
// How deep into the jar should the pot extend
jar_depth = 20; //.1
// Height of the planter pot, in mm
pot_height = 100; //.1
// Diameter of the planter pot at its top, in mm
pot_dia = 120; //.1
// How thick is your wick, string or rope? in mm
wick_dia = 6; //.1
// Drainage hole diameter, in mm
hole_dia = 4; //.1

/* [Hidden] */
// Hidden code, used to derive settings
c_rounding = 75; // lower value during dev/test, set to 60-100 for render
c_wall_thickness = 1.8; // equal to 4 walls of .45 extrusion thickness


// MODULES
module holes() {
    // drainage holes
    translate([ 0,         jar_dia/4, 0]) cylinder(h=25, d=hole_dia, center=false, $fn=c_rounding);
    translate([-jar_dia/4, jar_dia/4, 0]) cylinder(h=25, d=hole_dia, center=false, $fn=c_rounding);
    translate([ jar_dia/4, jar_dia/4, 0]) cylinder(h=25, d=hole_dia, center=false, $fn=c_rounding);
    translate([ 0,        -jar_dia/4, 0]) cylinder(h=25, d=hole_dia, center=false, $fn=c_rounding);
    translate([-jar_dia/4,-jar_dia/4, 0]) cylinder(h=25, d=hole_dia, center=false, $fn=c_rounding);
    translate([ jar_dia/4,-jar_dia/4, 0]) cylinder(h=25, d=hole_dia, center=false, $fn=c_rounding);
    translate([ jar_dia/4, 0,         0]) cylinder(h=25, d=hole_dia, center=false, $fn=c_rounding);
    translate([-jar_dia/4, 0,         0]) cylinder(h=25, d=hole_dia, center=false, $fn=c_rounding);
    // center hole, for the wick
    cylinder(h=25, d=wick_dia+2, center=false, $fn=c_rounding);
}


module base_ring() {
    difference() {
        cylinder(h=jar_depth, d=jar_dia + 2*c_wall_thickness, center=false, $fn=c_rounding);
        cylinder(h=jar_depth, d=jar_dia,                      center=false, $fn=c_rounding);
    }
}


module main_pot(c_sides) {
    difference() { 
        translate([0, 0, jar_depth]) 
        cylinder(h=pot_height, d1=jar_dia + jar_depth + 2*c_wall_thickness, d2=pot_dia, center=false, $fn=c_sides);

        translate([0, 0, jar_depth + 2*c_wall_thickness])
        cylinder(h=pot_height - 2*c_wall_thickness, d1=jar_dia + jar_depth, d2=pot_dia - 2*c_wall_thickness, center=false, $fn=c_sides);
    }
}



// MAIN CODE
base_ring();
difference() {
    if (planter_design == "box") {
        main_pot(4);
    } else if (planter_design == "hex") {
        main_pot(6);
    } else if (planter_design == "facets") {
        main_pot(20);
    } else if (planter_design == "smooth") {
        main_pot(c_rounding);
    }
    holes();
}



// INDOOR JAR GARDEN POTS
//
// Customizable pots to fit into recycled household jars.
//
// Author: RobotAnna
// https://www.printables.com/@RobotAnna
//
// CC Public Domain
// http://creativecommons.org/publicdomain/zero/1.0/
