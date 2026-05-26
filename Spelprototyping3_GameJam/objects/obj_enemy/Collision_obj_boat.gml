// Collide with boat
var _collidingBoat = instance_place(x, y, obj_boat);
if (_collidingBoat != noone) {
	var _collisionDir = point_direction(x, y, _collidingBoat.x, _collidingBoat.y);
	
	// Collide - push boat back
	while (instance_place(x, y, _collidingBoat)) {
		_collidingBoat.x += lengthdir_x(1, _collisionDir);
		_collidingBoat.y += lengthdir_y(1, _collisionDir);
	}
	
	// Become alert
	detection = max((_collidingBoat.current_speed / MAX_SPEED) * 0.7, detection);
	visionDirection = _collisionDir;
}