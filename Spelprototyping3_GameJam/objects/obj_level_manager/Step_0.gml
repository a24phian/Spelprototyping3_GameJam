///@description Checks

var _goal = goal
var _go = false
with (obj_cargo_dropoff) {
	if cargo >= _goal {
		_go = true
	}
}

if _go and alarm_get(0) = -1 { alarm_set(0, delay) }