///@description Variables

direction = 90

current_speed = 0
turn_speed = 0

currently_moving = false

collision_array = [ obj_obstacle, layer_tilemap_get_id("Tiles_1") ]

cargo_stack = ds_stack_create()
shipping = false