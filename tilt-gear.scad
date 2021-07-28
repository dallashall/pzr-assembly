include<libraries/meshing-gears.scad>
// $fn = 50;

module TiltGear(outerDiameter = 130, innerDiameter = 100, thickness = 20, helixAngle = 45, pitch = 1){
  herringbone_gear(outerDiameter, innerDiameter, helixAngle, thickness, 20, pitch);
}

module RotationSupport(outerDiameter = 150, gearThickness = 20, cameraHeight = 100, innerDiameter = 120){
  union(){
    difference(){
      cylinder(r = outerDiameter / 2 - 5, h = gearThickness / 2, center = true);
      translate([outerDiameter / 20, 0, 0]){

        cylinder(r = outerDiameter / 2.5, h = gearThickness / 2 + 2, center = true);
      }
    }
    supportWidth = 20;
    translate([0, 0, -gearThickness / 4]){
      linear_extrude(gearThickness / 2){
        polygon(points = [
            [supportWidth / 1.2, -innerDiameter / 2],
            [-supportWidth / 1.2, -innerDiameter / 2],
            [-supportWidth / 2, -innerDiameter / 2 + cameraHeight / 2],
            [supportWidth / 2, -innerDiameter / 2 + cameraHeight / 2],
          ]);
      }
    }
  }
}

module Triangle(outerDiameter = 150, cameraHeight = 100, thickness = 20){
  translate([10, 0, -thickness / 2 - 1]){
    linear_extrude(thickness + 2){
      polygon(points = [[0, 0], [outerDiameter / 2 + 10, cameraHeight * 0.6], [outerDiameter / 2 + 10, -cameraHeight * 0.6]]);
    }
  }
}

module WedgeGear(cameraHeight=100, cameraDepth=80, thickness=20){
  innerDiameter = cameraDepth / 2 + cameraHeight;
  outerDiameter = innerDiameter + 30;

  difference(){
    union(){
      difference(){
        TiltGear(outerDiameter, innerDiameter, thickness);
        RailGuide(outerDiameter, thickness);
      }
      RotationSupport(outerDiameter, thickness, cameraHeight, innerDiameter);
    }

    Triangle(outerDiameter, cameraHeight, thickness);
  }
}

module RailGuide(gearOuterDiameter = 150, gearThickness = 20){
  insetDiameter = gearOuterDiameter / 2 - 5;
  union(){
    mirror([0, 0, 1]){
      translate([0, 0, insetDiameter / 2 - gearThickness / 2 - 1]){
        cylinder(insetDiameter, insetDiameter, 0, center = true);
      }
    }
    translate([0, 0, insetDiameter / 2 - gearThickness / 2 - 1]){

      cylinder(insetDiameter, insetDiameter, 0, center = true);
    }
  }
}

WedgeGear();

// Rail