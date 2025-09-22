use <./base.scad>
use <./_cfg.scad>
use <./toilet_ground_floor_config.scad>

right(h=get_h(),
width=get_width(),
length=get_length(),
diameter=get_diameter(),
distance=get_distance(),
nutDistance=get_nutDistance(),
offset_l=get_offset_l(),
offset_r=get_offset_r(),
fn=get_fn()
);
