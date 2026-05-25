///@description Follow target

if follow != noone {
	if point_distance(x, y, follow.x, follow.y) > 32 {
		move_towards_point(follow.x, follow.y, abs(obj_boat.current_speed))
	}
	
	else if point_distance(x, y, follow.x, follow.y) < 24 {
		move_towards_point(follow.x, follow.y, -abs(obj_boat.current_speed))
	}
	
	else { speed = 0 }
}