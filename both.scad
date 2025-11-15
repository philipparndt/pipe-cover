use <./base.scad>
use <./_cfg.scad>
use <./cfg.scad>

both(
    h=get_h(),
    width=get_width(),
    length=get_length(),
    diameter=get_diameter(),
    distance=get_distance(),
    nutDistance=get_nutDistance(),
    separation=get_separation(),
    offset_l=get_offset_l(),
    offset_r=get_offset_r(),
    fn=get_fn(),
    draft=get_darft()
);
