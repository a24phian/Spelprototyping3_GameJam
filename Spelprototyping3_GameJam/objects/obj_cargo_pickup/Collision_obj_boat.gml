repeat (cargoMax - ds_stack_size(other.cargo_stack)) {
	with (other) {
		event_user(0);
	}
}