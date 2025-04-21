module base(h, width, length, fn) {
    diameter=17;
    distance=53;

    corner_radius=10;

    difference() {
//        minkowski() {
            _base_plate_shape(corner_radius, h, width, length, fn);
//            translate([0, 0, corner_radius]) cylinder(r=corner_radius/2, h=0.001, $fn=fn);
//        }
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
    union() {
        translate([corner_radius, 0, 0])
            cube([width - corner_radius * 2, length, h], center=false);

        translate([0, corner_radius, 0])
            cube([width, length - corner_radius * 2, h], center=false);

        for (x = [corner_radius, width - corner_radius])
        for (y = [corner_radius, length - corner_radius])
        translate([x, y, 0])
            cylinder(d = corner_radius * 2, h = h, center = false, $fn = fn);
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