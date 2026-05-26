///@description Title

//draw_set_halign(fa_center)
//draw_set_valign(fa_middle)
//draw_set_font(fnt_menu)

//draw_text(room_width/2, 200, "Vårt Supercoola Spel")

if count >= 180 && !stopped {
	image_speed = 0
	
	stopped = true
}
else if !stopped{
	count++
}


draw_self()