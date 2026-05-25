///@description Cargo add

//First follow player
if ds_stack_size(cargo_stack) = 0 {
	//Spawn
	ds_stack_push(cargo_stack, instance_create_layer(x,y, self.layer, obj_cargo))
	
	//Follow
	var _me = self
	with (ds_stack_top(cargo_stack)) {
		follow = _me
	}
}
//Follow previous barrel
else {
	//Spawn
	var _previous = ds_stack_top(cargo_stack)
	ds_stack_push(cargo_stack, instance_create_layer(_previous.x, _previous.y, self.layer, obj_cargo))
	
	//Follow
	with ds_stack_top(cargo_stack) {
		follow = _previous
	}
}