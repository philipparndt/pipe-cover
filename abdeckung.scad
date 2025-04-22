use <./base.scad>
h=6;
width=55;
length=110;
fn=200;

//base(h, width, length, fn);

a=true; // Part A
b=true;  // Part B

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

        translate([0,0,2])
            translate([width / 2, 0, 0]) {
                translate([0, 10, 0]) {
                    nut(h - 4);
                }
                translate([0, length / 2, 0]) {
                    nut(h - 4);
                }
                translate([0, length - 10, 0]) {
                    nut(h - 4);
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

                translate([0,0,1.5])
                    translate([width / 2 + .2, 0, -.1]) {
                        translate([0, 10, 0]) {
                            nut(h - 1.3, .2);
                        }
                        translate([0, length / 2, 0]) {
                            nut(h - 1.3, .2);
                        }
                        translate([0, length - 10, 0]) {
                            nut(h - 1.3, .2);
                        }
                    }
            }
        }
    }
}