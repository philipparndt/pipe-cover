module base(h, width, length, fn) {
    diameter=18;
    distance=52;

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
            cylinder(d=diameter, h=h+.2, center=false, $fn=fn);
            translate([0, distance, 0]) {
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
