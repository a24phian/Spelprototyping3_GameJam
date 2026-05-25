if (place_meeting(x, y, obj_boat)) {
	detection = min(detection + detectionSpeed, 1);
}
else {
	detection = max(detection - detectionSpeed, 0);
}