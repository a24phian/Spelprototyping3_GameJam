///@description Cargo lose

if ds_stack_size(cargo_stack) > 0 {
	with (ds_stack_pop(cargo_stack)) {
		follow = noone
		
		direction = random_range(-10, 10)
		
		speed = random_range(0.1, 0.3)
	}
}