repeat (ds_stack_size(other.cargo_stack)) {
	cargo++;
	with (other) {
		shipping = true
		event_user(1);
	}
}