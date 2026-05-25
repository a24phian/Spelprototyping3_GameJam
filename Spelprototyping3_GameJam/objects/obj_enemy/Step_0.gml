switch (state) {
	case "searching":
		// Look around at random points for random amounts of time
		visionDirection += angle_difference(visionDirectionTarget, visionDirection) / 15;
		visionZone.direction = visionDirection;
		
		// Angle vision zone
		if (angle_difference(visionDirectionTarget, visionDirection) <= 1) {
			if (visionLingerTime-- <= 0) {
				visionDirectionTarget = random_range(0, 360);
				visionLingerTime = random_range(visionLingerTimeMin, visionLingerTimeMax);
			}
		}
		
		// Use vision zone for detection
		with (visionZone) {
			if (place_meeting(x, y, obj_boat)) {
				other.detection = min(other.detection + other.detectionSpeed, 1);
			}
			else {
				other.detection = max(other.detection - other.detectionSpeed, 0);
			}
		}
		
		// Change state
		if (detection > 0) {
			state = "alert";
		}
		break;
	case "alert":
		visionDirection += angle_difference(visionDirectionTarget, visionDirection) / 5;
		visionZone.direction = visionDirection;
		
		// Angle vision zone
		if (angle_difference(visionDirectionTarget, visionDirection) <= 1) {
			if (visionLingerTime-- <= 0) {
				visionDirectionTarget += random_range(-visionDirectionRangeAlert, visionDirectionRangeAlert);
				visionLingerTime = random_range(visionLingerTimeMinAlert, visionLingerTimeMaxAlert);
			}
		}
		
		// Use vision zone for detection
		with (visionZone) {
			if (place_meeting(x, y, obj_boat)) {
				other.detection = min(other.detection + other.detectionSpeed, 1);
			}
			else {
				other.detection = max(other.detection - other.detectionSpeed, 0);
			}
		}
		
		// Change state
		if (detection == 0) {
			state = "searching";
		}
		
		if (detection == 1) {
			state = "chasing";
		}
		break;
	case "chasing":
		direction = point_direction(x, y, obj_boat.x, obj_boat.y);
		speed = min(speed + ACCELERATION, maxSpeed);
		
		visionZone.direction = direction;
		
		if (place_meeting(x, y, obj_boat)) {
			game_restart();
		}
}

// Move vision zone
visionZone.x = x;
visionZone.y = y;