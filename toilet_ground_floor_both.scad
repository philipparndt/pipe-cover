use <./base.scad>
use <./_cfg.scad>
use <./toilet_ground_floor_config.scad>

both(get_h(), get_width(), get_length(), get_diameter(), get_distance(), get_nutDistance(), get_separation(), get_fn());
