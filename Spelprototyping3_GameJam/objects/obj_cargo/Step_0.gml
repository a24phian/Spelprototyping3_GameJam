///@description Follow target / Float

if follow != noone {
	if point_distance(x, y, follow.x, follow.y) > 32 {
		move_towards_point(follow.x, follow.y, abs(obj_boat.current_speed))
	}
	
	else if point_distance(x, y, follow.x, follow.y) < 24 {
		move_towards_point(follow.x, follow.y, -abs(obj_boat.current_speed))
	}
	
	else { speed = 0 }
}

else {
	//Collisions
	speed = float_speed
	var _collide_x = move_and_collide(hspeed, 0, collision_array, 20)
	var _collide_y = move_and_collide(0, vspeed, collision_array, 20)
	speed = 0
	
	//Slow down after first collision
	var _did_collide = array_length(_collide_x) > 0 or array_length(_collide_y) > 0
	if !collided && _did_collide {
		float_speed *= 0.5
		collided = true
	}
}