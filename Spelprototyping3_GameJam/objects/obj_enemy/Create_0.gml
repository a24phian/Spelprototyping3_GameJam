state = "searching";

detection = 0; // Normalized between 0 and 1
detectionGainSpeed = 1 / 140;
detectionLossSpeed = 1 / 240;

visionDirection = direction;
visionDirectionTarget = random_range(0, 360);

visionLingerTimeMin = 30;
visionLingerTimeMax = 150;
visionLingerTime = random_range(visionLingerTimeMin, visionLingerTimeMax);

visionDirectionRangeAlert = 15;

visionLingerTimeMinAlert = 10;
visionLingerTimeMaxAlert = 45;

visionZone = instance_create_layer(x, y, layer, obj_vision_zone);
visionZone.owner = id;
visionZone.direction = direction;

maxSpeed = MAX_SPEED * 1.15;

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