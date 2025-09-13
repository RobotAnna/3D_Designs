//
// VENETIAN BLIND -- HANDLE CAPS
//
// Replace the handle of your venetian blinds.
//
// Author: RobotAnna
// https://www.printables.com/@RobotAnna
// CC Public Domain



// PARAMETERS
dia_rod   =   8;  // diameter of the rod that you will use as a handle
smoothing =  60;  // cylinder smoothing: set to 60 while designing, and up to 300 for the final render.



// CONSTANTS
base_height = 10;  // Height of the part that connects to the rod. I reccommend to keep it at 10mm.



// DERIVED



// MODULES
// colors are not necessary, this just helps to debug the code

module base() {
    difference() {

        color("LightGreen")
        cylinder(h=base_height, d=dia_rod+3, center=false, $fn=smoothing);
    
        color("Wheat")
        linear_extrude(base_height) circle(d=dia_rod, $fn=6);

    }
}


module cap() {
    color("LightPink")
    translate([0,0,base_height])
    sphere(d=dia_rod+3, $fn=smoothing); 
}


module hook() {
    translate([0,0,base_height])
    color("Bisque")
    cylinder(h=(dia_rod+3)/2 + dia_rod/4, d1=dia_rod+3, d2=dia_rod/4, center=false, $fn=smoothing);

    translate([0, -dia_rod/8, base_height + (dia_rod+3)])
    rotate([270,0,0])

    difference() {
        color("LightSalmon")
        cylinder(h=dia_rod/3, d=dia_rod+3,     center=false, $fn=smoothing);

        color("CornflowerBlue")
        cylinder(h=dia_rod/3, d=(dia_rod+3)/2, center=false, $fn=smoothing);

        cube((dia_rod+3)/2);
    }

}



// PUT IT ALL TOGETHER
translate([dia_rod*3,0,0]) cap();
translate([dia_rod*3,0,0]) base();


hook();
base();

