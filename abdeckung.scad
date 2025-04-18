use <./base.scad>
h=5;
width=55;
length=110;
fn=200;

a=false; // Part A
b=false;  // Part B

base(h, width, length, fn);

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

        translate([width / 2, 0, 0]) {
            translate([0, 10, 0]) {
                nut(h - 2);
            }
            translate([0, length / 2, 0]) {
                nut(h - 2);
            }
            translate([0, length - 10, 0]) {
                nut(h - 2);
            }
        }
    }
}

if (b) {
    union() {
        translate([-10, 0, 0]) {
            difference() {
                difference() {
                    base(h, width, length, fn);
                    translate([width / 2 + .1, -.1, -.1]) {
                        cube([width / 2, length + .2, h + .2], center = false);
                    }
                }

                translate([width / 2 + .2, 0, -.1]) {
                    translate([0, 10, 0]) {
                        nut(h - 1.5, .2);
                    }
                    translate([0, length / 2, 0]) {
                        nut(h - 1.5, .2);
                    }
                    translate([0, length - 10, 0]) {
                        nut(h - 1.5, .2);
                    }
                }
            }
        }
    }
}