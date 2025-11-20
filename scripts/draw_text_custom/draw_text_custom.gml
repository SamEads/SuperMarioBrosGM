function draw_text_custom(_x,_y,_string) {

	pal_swap_set(spr_pal_font,obj_controller.currenttheme);
	draw_text(_x,_y,_string);
	shader_reset();

}