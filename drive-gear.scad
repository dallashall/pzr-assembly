include<libraries/meshing-gears.scad>

module DrivaShaft(thickness = 30){
  motorShaftDiameter = 5;
  difference(){
    $fn = 30;
    cylinder(h = thickness + 1, d = motorShaftDiameter, center = true);
    translate([5 + motorShaftDiameter / 2 - 0.5, 0, 0]){
      cube(size = [10, 10, thickness + 2], center = true);
    }
  }
}

module DriveGear(outerDiameter = 30, innerDiameter = 0, thickness = 20, helixAngle = 45, pitch = 1){
  difference() {
    herringbone_gear(outerDiameter, innerDiameter, helixAngle, thickness, pitch);
    DrivaShaft(thickness);
  }
}

DriveGear();