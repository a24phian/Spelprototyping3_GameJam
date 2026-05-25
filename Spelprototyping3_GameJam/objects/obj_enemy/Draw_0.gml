// Self
draw_self();

// Detection progress bar
var _color = c_white;

if (detection > 0) {
	_color = c_yellow;
	
	if (detection == 1) {
		_color = c_red;
	}
}

var _w = 64,
	_h = 6,
	_x = x - (_w / 2),
	_y = y - 32 - (_h / 2);

draw_set_alpha(0.5);

draw_rectangle(_x, _y, _x + _w, _y + _h, false);
draw_rectangle_color(_x, _y, _x + (_w * detection), _y + _h, _color, _color, _color, _color, false);

draw_set_alpha(1);