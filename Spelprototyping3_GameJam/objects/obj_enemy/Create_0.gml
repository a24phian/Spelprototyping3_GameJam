state = "searching";

maxSpeed = MAX_SPEED * 1.15
currentSpeed = 0;

// Detecion progress
detection = 0; // Normalized between 0 and 1
detectionGainSpeed = 1 / 140;
detectionLossSpeed = 1 / 240;

// Wandering randomly while searching
wanderRadius = 48;
wanderTargetX = x;
wanderTargetY = y;
SetRandomWanderTargetPoint();

wanderLingerTimeMin = 60;
wanderLingerTimeMax = 300;
wanderLingerTime = irandom_range(wanderLingerTimeMin, wanderLingerTimeMax);

// Vision Zone
visionZone = instance_create_layer(x, y, layer, obj_vision_zone);
visionZone.owner = id;
visionZone.direction = direction;

visionDirection = direction;
visionDirectionTarget = random_range(0, 360);

visionLingerTimeMin = 30;
visionLingerTimeMax = 150;
visionLingerTime = random_range(visionLingerTimeMin, visionLingerTimeMax);

visionDirectionRangeAlert = 15;

visionLingerTimeMinAlert = 10;
visionLingerTimeMaxAlert = 45;

/// Functions
function SetRandomWanderTargetPoint() {
	var _dir = random_range(0, 360)
		_len = random(wanderRadius);
	
	wanderTargetX = xstart + lengthdir_x(_len, _dir);
	wanderTargetY = ystart + lengthdir_y(_len, _dir);
}

function MoveToTargetPoint(_x, _y)
{
	var _dir = point_direction(x, y, _x, _y),
		_dist = point_distance(x, y, _x, _y),
		_targetSpeed = min( min(sqrt(2 * ACCELERATION * _dist), maxSpeed), _dist );
	
	currentSpeed += (_targetSpeed - currentSpeed);
	
	move_and_collide()
	
	// Animation
	if (currentSpeed > 0)
	{
		direction = _dir;
		image_angle = direction;
	}
}

function VisionZoneDetection() {
	if (PlayerInVisionZone()) {
		detection = min(detection + detectionGainSpeed, 1);
	}
	else {
		detection = max(detection - detectionLossSpeed, 0);
	}
}

function PlayerInVisionZone() {
	var _playerInVisionZone = false;
	
	mask_index = spr_vision_zone;
	image_angle = visionDirection;
	if (place_meeting(x, y, obj_boat)) {
		_playerInVisionZone = true;
	}
	mask_index = sprite_index;
	image_angle = direction;
	
	return _playerInVisionZone;
}