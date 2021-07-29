include<MCAD/stepper.scad>
use<tilt-gear.scad>
use<base-plate.scad>
use<drive-gear.scad>

module Motor(gearWidth = 20){
  translate([gearWidth, 0, 0]){
    rotate([0, 90, 0]){
      motor(Nema17);
    }
  }
}

BasePlate();
translate([0, 0, 75 + 41 / 2 + 5]){
  rotate([90, 0, 90]){
    WedgeGear();
  }
}
rotate([90, 0, 90]){
  DriveGear();
}
Motor();