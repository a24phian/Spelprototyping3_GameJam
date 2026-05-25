///@description Movement

//Input
//Forward
if keyboard_check(ord("W")) or keyboard_check(vk_up) {
	currently_moving = true
	
	current_speed += ACCELERATION
	
	if current_speed > MAX_SPEED { current_speed = MAX_SPEED }
}

//Backward
if keyboard_check(ord("S")) or keyboard_check(vk_down) {
	currently_moving = true
	
	current_speed -= BACKWARDS_ACCELERATION
	
	if current_speed < -MAX_BACKWARDS_SPEED { current_speed = -MAX_BACKWARDS_SPEED }
}

//Left
if keyboard_check(ord("A")) && currently_moving or keyboard_check(vk_left) && currently_moving {
	turn_speed += TURN_ACCELERATION
	
	if turn_speed > MAX_TURN_SPEED { turn_speed = MAX_TURN_SPEED }
	if turn_speed < -MAX_TURN_SPEED { turn_speed = -MAX_TURN_SPEED }
}

//Right
if keyboard_check(ord("D")) && currently_moving or keyboard_check(vk_right) && currently_moving {
	turn_speed -= TURN_ACCELERATION
	
	if turn_speed > MAX_TURN_SPEED { turn_speed = MAX_TURN_SPEED }
	if turn_speed < -MAX_TURN_SPEED { turn_speed = -MAX_TURN_SPEED }
}

speed = current_speed
var _dx = hspeed
var _dy = vspeed
speed = 0

//Update direction
direction += turn_speed

//No overflow
if direction >= 360 { direction = 0 }
if direction <= -360 { direction = 0 }

//Update facing
image_angle = direction

if place_meeting(x, y, collision_array) {
	direction -= turn_speed
	image_angle = direction
}

var _collided = move_and_collide(_dx, _dy, collision_array, 20)
if array_length(_collided) > 0 && current_speed > MAX_SPEED - DROP_THRESHOLD { event_user(1) }
if array_length(_collided) > 0 { current_speed *= 0.85 }

//Decelleration
if !currently_moving { 
	current_speed *= DECELLERATION
	turn_speed *= DECELLERATION
}

else { currently_moving = false }

//Temporary edge collisions
if x < 12 { 
	x = 12
	current_speed *= 0.85
}
if x > room_width - 12 { 
	x = room_width - 12
	current_speed *= 0.85
}

if y < 12 { 
	y = 12
	current_speed *= 0.85
}
if y > room_height - 12 { 
	y = room_height - 12 
	current_speed *= 0.85
}