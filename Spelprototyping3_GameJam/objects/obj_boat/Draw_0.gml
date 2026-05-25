draw_self();

// Draw locator arrow
var _locate = instance_nearest(x, y, obj_cargo_pickup);
if (ds_stack_size(cargo_stack) > 0) _locate = instance_nearest(x, y, obj_cargo_dropoff);

with (_locate)
{
	var _x = camera_get_view_x(view_camera[0]),
		_y = camera_get_view_y(view_camera[0]),
		_x2 = _x + camera_get_view_width(view_camera[0]),
		_y2 = _y + camera_get_view_height(view_camera[0]),
		_cx = _x + camera_get_view_width(view_camera[0]) / 2,
		_cy = _y + camera_get_view_height(view_camera[0]) / 2,
		_margin = 100,
		_arrowWidth = 20,
		_arrowLength = 60;
	
	if (!point_in_rectangle(x, y, _x, _y, _x2, _y2))
	{
		var _xx = clamp(x, _x + _margin, _x2 - _margin),
			_yy = clamp(y, _y + _margin, _y2 - _margin),
			_dir = point_direction(_cx, _cy, x, y),
			_dist = point_distance(_cx, _cy, x, y);
	
		draw_triangle_color(
						_xx + lengthdir_x(_arrowWidth, _dir + 90), _yy + lengthdir_y(_arrowWidth, _dir + 90),
						_xx + lengthdir_x(_arrowWidth, _dir - 90), _yy + lengthdir_y(_arrowWidth, _dir - 90),
						_xx + lengthdir_x(_arrowLength, _dir), _yy + lengthdir_y(_arrowLength, _dir),
						c_orange, c_orange, c_yellow, false);
	
		//draw_sprite(sprite_index, image_index, _xx, _yy);
	}
}