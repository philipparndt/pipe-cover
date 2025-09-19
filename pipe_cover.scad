use <./base.scad>

fn=200;

// Dining Room
both(h=6, width=38, length=90, diameter=17, distance = 52, nutDistance = 6, separation=10, fn=fn);

// Kitchen
translate([100,0,0])
both(h=6, width=38, length=90, diameter=17, distance = 49, nutDistance = 6, separation=10, fn=fn);
