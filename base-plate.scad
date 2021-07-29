

module BearingHoles(gearWidth = 20, depth = 61){
  translate([gearWidth, 22, depth / 2]){
    rotate([0, -45, 0]){
      cylinder(d = 8, h = 10, center = true, $fn = 30);
    }
  }

  translate([-gearWidth, 22, depth / 2]){
    rotate([0, 45, 0]){
      cylinder(d = 8, h = 10, center = true, $fn = 30);
    }
  }
  translate([gearWidth, -22, depth / 2]){
    rotate([0, -45, 0]){
      cylinder(d = 8, h = 10, center = true, $fn = 30);
    }
  }

  translate([-gearWidth, -22, depth / 2]){
    rotate([0, 45, 0]){
      cylinder(d = 8, h = 10, center = true, $fn = 30);
    }
  }
}

module BasePlate(gearOuterDiameter = 150, gearWidth = 20){
  gearRidge = 5;
  motorHeight = 41;
  height = motorHeight + gearRidge;
  innerWidth = gearWidth + 2;
  depth = motorHeight + 20;

  difference(){
    rotate([90, 0, 0]){
      translate([0, 0, -depth / 2]){
        linear_extrude(depth){
          polygon(points = [
              [-innerWidth / 2, -height / 2],
              [-innerWidth / 2, height / 2],
              // inner left side
              [-innerWidth / 2 - 15, height / 2 + 15],
              // 45 deg out
              [-innerWidth / 2 - 15, height / 2 + 10],
              // 5 down
              [-innerWidth / 2 - 5, height / 2],
              // 45 deg in
              [-innerWidth / 2 - 5, -height / 2 - 5],
              // outer left side
              [innerWidth / 2 + 5, -height / 2 - 5],
              // outer bottom
              [innerWidth / 2 + 5, height / 2],
              // outer bottom
              [innerWidth / 2 + 15, height / 2 + 10],
              // 5 down
              [innerWidth / 2 + 15, height / 2 + 15],
              // 45 deg out
              [innerWidth / 2, height / 2],
              [innerWidth / 2, -height / 2]
            ]);
        }
      }
    }
    BearingHoles();
  }
}

BasePlate();