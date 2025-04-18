module base(h, width, length, fn) {
    diameter=17;
    distance=53;

    corner_radius=10;

    difference() {
        _base_plate(corner_radius, h, width, length, fn);

        translate([width/2, length/2-distance/2, -.1]) {
            cylinder(d=diameter, h=h+.2, center=false, $fn=fn);
            translate([0, distance, 0]) {
                cylinder(d=diameter, h=h+.2, center=false, $fn=fn);
            }
        }
    }
}

module _base_plate(corner_radius, h, width, length, fn) {
    union() {
        translate([corner_radius, 0, 0]) {
            cube([width- corner_radius*2, length, h], center=false);
        }

        translate([0, corner_radius, 0]) {
            cube([width, length- corner_radius*2, h], center=false);
        }

        translate([width - corner_radius, corner_radius, 0]) {
            cylinder(d=corner_radius*2, h=h, center=false, $fn=fn);
        }

        translate([corner_radius, corner_radius, 0]) {
            cylinder(d=corner_radius*2, h=h, center=false, $fn=fn);
        }

        translate([corner_radius, length - corner_radius, 0]) {
            cylinder(d=corner_radius*2, h=h, center=false, $fn=fn);
        }

        translate([width - corner_radius, length - corner_radius, 0]) {
            cylinder(d=corner_radius*2, h=h, center=false, $fn=fn);
        }

    }
}

module nut(h,extend=0) {
    nut_height=h;
    nut_width=5+extend;
    nut_length=4+extend;
    nut_length_=2+extend;
    rotate([0,0,90]) {
        translate([-nut_length/2,0,0]) {
            linear_extrude(height=nut_height)
                polygon(points=[[0,0], [-nut_length_,nut_width], [0,nut_width]]);

            translate([nut_length,0,0]) {
                linear_extrude(height=nut_height)
                    polygon(points=[[0,0], [nut_length_,nut_width], [0,nut_width]]);
            }

            cube([nut_length, nut_width, nut_height], center=false);
        }
    }
}