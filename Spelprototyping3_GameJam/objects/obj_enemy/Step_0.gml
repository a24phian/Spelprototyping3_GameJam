switch (state) {
	case "searching":
		// Wander around starting position
		MoveToTargetPoint(wanderTargetX, wanderTargetY);
		
		if (distance_to_point(wanderTargetX, wanderTargetY) <= 0) {
			if (wanderLingerTime-- <= 0) {
				SetRandomWanderTargetPoint();
				wanderLingerTime = irandom_range(wanderLingerTimeMin, wanderLingerTimeMax);
			}
		}
		
		// Look around at random points for random amounts of time
		if (angle_difference(visionDirectionTarget, visionDirection) <= 1) {
			if (visionLingerTime-- <= 0) {
				visionDirectionTarget = random_range(0, 360);
				visionLingerTime = irandom_range(visionLingerTimeMin, visionLingerTimeMax);
			}
		}
		
		visionDirection += angle_difference(visionDirectionTarget, visionDirection) / 15;
		visionZone.direction = visionDirection;
		
		VisionZoneDetection();
		
		// Change state
		if (detection > 0) {
			state = "alert";
		}
		break;
	case "alert":
		// Track the player
		if (PlayerInVisionZone()) {
			var _dir = point_direction(xstart, ystart, obj_boat.x, obj_boat.y);
			MoveToTargetPoint(xstart + lengthdir_x(wanderRadius, _dir), ystart + lengthdir_y(wanderRadius, _dir));
			
			visionDirection += angle_difference(point_direction(x, y, obj_boat.x, obj_boat.y), visionDirection) / 15;
			visionZone.direction = visionDirection;
			
			visionDirectionTarget = visionDirection;
			visionLingerTime = irandom_range(visionLingerTimeMinAlert, visionLingerTimeMaxAlert);
		}
		// Look after the player around the direction in which they dissappeared
		else {
			if (angle_difference(visionDirectionTarget, visionDirection) <= 1) {
				if (visionLingerTime-- <= 0) {
					visionDirectionTarget += random_range(-visionDirectionRangeAlert, visionDirectionRangeAlert);
					visionLingerTime = random_range(visionLingerTimeMinAlert, visionLingerTimeMaxAlert);
				}
			}
			
			visionDirection += angle_difference(visionDirectionTarget, visionDirection) / 5;
			visionZone.direction = visionDirection;
		}
		
		VisionZoneDetection();
		
		// Change state
		if (detection == 0) {
			state = "searching";
		}
		
		if (detection == 1) {
			state = "chasing";
		}
		break;
	case "chasing":
		MoveToTargetPoint(obj_boat.x, obj_boat.y);
		
		visionZone.direction = direction;
		
		var _col = instance_place(x, y, obj_boat);
		if (_col != noone) {
			with (_col) {
				// Lose a barrel...
				event_user(1);
				
				// ...and eespawn...
				x = xstart;
				y = ystart;
				
				speed = 0;
				direction = 90;
				image_angle = direction;
				
				// ...with cargo
				with (obj_cargo) {
					x = obj_boat.x;
					y = obj_boat.y;
				}
			}
			
			state = "searching";
		}
}

/// Move Vision zone
visionZone.x = x;
visionZone.y = y;

