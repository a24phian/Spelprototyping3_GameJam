state = "searching";

detection = 0; // Normalized between 0 and 1
detectionSpeed = 1 / 140;

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