///@description Cargo lose

if shipping and ds_stack_size(cargo_stack) > 0 {
	instance_destroy(ds_stack_pop(cargo_stack))
	shipping = false
}

else if ds_stack_size(cargo_stack) > 0 {
	
	with (ds_stack_pop(cargo_stack)) {
		follow = noone
		
		direction = point_direction(x, y, other.x, other.y) + random_range(20, -20) - 180
		
		float_speed = random_range(0.3, 0.5)
	}
}