module base(h, width, length, diameter, distance, offset_l=0, offset_r=0, fn) {
    corner_radius=10;

    difference() {
        union() {
            difference() {
                _base_plate_shape(corner_radius, h, width, length, fn);
                translate([3,3,h-2]) {
                    offset=3;
                    _base_plate_shape(corner_radius-offset, h-2, width-offset*2, length-offset*2, fn);
                }
            }
        }

        translate([width/2, length/2-distance/2, -.1]) {
            translate([offset_l, 0, 0])
            cylinder(d=diameter, h=h+.2, center=false, $fn=fn);
            translate([offset_r, distance, 0]) {
                cylinder(d=diameter, h=h+.2, center=false, $fn=fn);
            }
        }
    }
}

module rounded_top_only(corner_radius, h, width, length, fn) {
    minkowski() {
        _base_plate_shape(corner_radius, h - corner_radius, width, length, fn);
        translate([0, 0, corner_radius]) cylinder(r=corner_radius/2, h=0.001, $fn=fn);
    }
}

module _base_plate_shape(corner_radius, h, width, length, fn) {
    hs=h/2;
    hn=h-hs;

    translate([0, 0, hs])

    union() {
        translate([corner_radius, 0, 0])
            cube([width - corner_radius * 2, length, hn], center=false);

        translate([0, corner_radius, 0])
            cube([width, length - corner_radius * 2, hn], center=false);

        for (x = [corner_radius, width - corner_radius])
        for (y = [corner_radius, length - corner_radius])
        translate([x, y, 0])
            cylinder(d = corner_radius * 2, h = hn, center = false, $fn = fn);

        // -------

        hull() {
            for (x = [corner_radius, width - corner_radius])
            for (y = [corner_radius, length - corner_radius])
            translate([x, y, 0])
                translate([0, 0, -hs])
                    cylinder(r1=corner_radius-hs, r2=corner_radius, h = hs, center = false, $fn = fn);
        }
    }
}

module nut(h,extend=0) {
    nut_height=h;
    nut_width=5+extend;
    nut_length=4+extend;
    nut_length_=1+extend;
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

module both(h, width, length, diameter, distance, nutDistance, separation, offset_l=0, offset_r=0, fn, draft=false) {
    difference() {
        union() {
            left(h, width, length, diameter, distance, nutDistance, offset_l, offset_r, fn);

            translate([-separation, 0, 0])
                right(h, width, length, diameter, distance, nutDistance, offset_l, offset_r, fn);
        }

    if (draft) {
        translate([-separation,0,3])
            cube([width+separation,length,10],center=false);

        translate([-separation,0,-8])
            cube([width+separation,length,10],center=false);
    }
    }
}

module left(h, width, length, diameter, distance, nutDistance, offset_l=0, offset_r=0, fn) {
    union() {
        translate([0, 0, 0]) {
            difference() {
                base(h, width, length, diameter, distance, offset_l, offset_r, fn);
                translate([-.1, -.1, -.1]) {
                    cube([width / 2, length + .2, h + .2], center = false);
                }
            }
        }

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

module right(h, width, length, diameter, distance, nutDistance, offset_l=0, offset_r=0, fn) {
    difference() {
        union() {
            difference() {
                base(h, width, length, diameter, distance, offset_l, offset_r, fn);
                translate([width / 2 + .1, -.1, -.1]) {
                    cube([width / 2, length + .2, h + .2], center = false);
                }
            }
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