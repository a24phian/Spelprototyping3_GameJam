///@Description Movement

//Input
//Forward
if keyboard_check(ord("W")) or keyboard_check(vk_up) {
	currently_moving = true
	
	speed += ACCELERATION
	
	if speed > MAX_SPEED { speed = MAX_SPEED }
}

//Backward
if keyboard_check(ord("S")) or keyboard_check(vk_down) {
	currently_moving = true
	
	speed -= BACKWARDS_ACCELERATION
	
	if speed < -MAX_BACKWARDS_SPEED { speed = -MAX_BACKWARDS_SPEED }
}

//Left
if keyboard_check(ord("A")) && currently_moving or keyboard_check(vk_left) && currently_moving {
	
	turn_speed += TURN_ACCELERATION
	
	if turn_speed > MAX_TURN_SPEED { turn_speed = MAX_TURN_SPEED }
}

//Right
if keyboard_check(ord("A")) && currently_moving or keyboard_check(vk_left) && currently_moving {
	
	turn_speed -= TURN_ACCELERATION
	
	if turn_speed < -MAX_TURN_SPEED { turn_speed = -MAX_TURN_SPEED }
}


//Direction
//Update direction facing in
facing_direction += turn_speed
image_angle = facing_direction

//Find difference between moving direction and facing direction
var _diff = direction - facing_direction
direction_turning = _diff / 5

//Change direction
direction += direction_turning
if direction - facing_direction < 1 { direction = facing_direction }

//Decelleration
if !currently_moving { 
	speed *= DECELLERATION
	turn_speed *= DECELLERATION * 2
}
//Needed next step
else { currently_moving = false }