///@description Next Level

//Next if it exists
if room_exists(room_next(room)) { room_goto_next() }

//restart otherwise
else { room_goto(0) }