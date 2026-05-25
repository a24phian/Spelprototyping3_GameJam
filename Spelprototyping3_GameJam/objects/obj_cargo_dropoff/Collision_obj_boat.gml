repeat (ds_stack_size(other.cargo_stack)) {
	cargo++;
	with (other) {
		event_user(1);
	}
}