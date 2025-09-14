use <./base.scad>
h=6;
width=38;
length=90;
fn=200;
distance = 10;
nutDistance = 5;

a=true; // Part A
b=false;  // Part B

version="";

if (a) {
    union() {
        translate([0, 0, 0]) {
            difference() {
                base(h, width, length, fn);
                translate([-.1, -.1, -.1]) {
                    cube([width / 2, length + .2, h + .2], center = false);
                }
            }
        }

        // Version number
        rotate([0, 0, 90])
            translate([length/2, -width*1/6, h / 2])
                linear_extrude(2)
                    text(version, size=8, halign="center",$fn=fn);

        translate([0.2,0,2])
            translate([width / 2, 0, 0]) {
                translate([0, nutDistance, 0]) {
                    nut(h - 4);
                }
                translate([0, length / 2, 0]) {
                    nut(h - 4);
                }
                translate([0, length - nutDistance, 0]) {
                    nut(h - 4);
                }
            }
    }
}

if (b) {
    translate([-distance, 0, 0])
    difference() {
        union() {
            difference() {
                base(h, width, length, fn);
                translate([width / 2 + .1, -.1, -.1]) {
                    cube([width / 2, length + .2, h + .2], center = false);
                }
            }

            // Version number
            rotate([0, 0, 90])
                translate([length/2, -width*5/6, h / 2])
                    rotate([0, 0, 180])
                        linear_extrude(2)
                            text(version, size=8, halign="center",$fn=fn);
        }

        translate([0.2,0,1.5])
            translate([width / 2 , 0, -.1]) {
                translate([0, nutDistance, 0]) {
                    nut(h - 1.3, extend = .2);
                }
                translate([0, length / 2, 0]) {
                    nut(h - 1.3, extend = .2);
                }
                translate([0, length - nutDistance, 0]) {
                    nut(h - 1.3, extend =  .2);
                }
            }
    }
}
