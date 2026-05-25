///@description Cargo remove

if ds_stack_size(cargo_stack) > 0 {
	instance_destroy(ds_stack_pop(cargo_stack))
}