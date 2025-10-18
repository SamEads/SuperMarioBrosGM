shader_reset();

if (swap_palette == true) {
	
	_theme = obj_controller.currenttheme;
	
	if ((obj_controller.currenttheme == themetype.castle) && (castle_alt_palette == true))
	
		_theme = themetype.cave;

	pal_swap_set(spr_pal_main,_theme);
	
} else {
	
	pal_swap_set(spr_pal_main,0);
	
}

draw_sprite_custom_origin(sprite_index,image_index,x,y+1+extra_y,sprite_width/2,sprite_height/2,xscale,yscale,ang,image_blend,image_alpha,0,0,0,8,round_in_retro);

shader_reset();