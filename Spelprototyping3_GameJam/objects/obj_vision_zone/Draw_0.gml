var _color = c_white;

if (detection > 0) {
	_color = c_yellow;
	
	if (detection == 1) {
		_color = c_red;
	}
}

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, _color, image_alpha);