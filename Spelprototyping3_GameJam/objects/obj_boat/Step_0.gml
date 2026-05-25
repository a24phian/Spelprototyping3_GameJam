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
	if turn_speed < -MAX_TURN_SPEED { turn_speed = -MAX_TURN_SPEED }
}

//Right
if keyboard_check(ord("D")) && currently_moving or keyboard_check(vk_right) && currently_moving {
	turn_speed -= TURN_ACCELERATION
	
	if turn_speed > MAX_TURN_SPEED { turn_speed = MAX_TURN_SPEED }
	if turn_speed < -MAX_TURN_SPEED { turn_speed = -MAX_TURN_SPEED }
}

//Update direction
direction += turn_speed

//No overflow
if direction >= 360 { direction = 0 }
if direction <= -360 { direction = 0 }

//Update facing
image_angle = direction

//Decelleration
if !currently_moving { 
	speed *= DECELLERATION
	turn_speed *= DECELLERATION
}

else { currently_moving = false }