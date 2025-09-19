use <./base.scad>

fn=50;

// Washing Room
both(h=6, width=55, length=110, diameter=18, distance = 52, nutDistance = 10, separation=10, fn=fn);

// Dining Room
translate([100,0,0])
both(h=6, width=38, length=90, diameter=17, distance = 52, nutDistance = 6, separation=10, fn=fn);

// Kitchen
translate([200,0,0])
both(h=6, width=38, length=90, diameter=17, distance = 49, nutDistance = 6, separation=10, fn=fn);
