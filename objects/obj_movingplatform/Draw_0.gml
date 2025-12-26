for (var i = 0; i < floor(image_xscale); i += 1) {
	
	pal_swap_set(spr_pal_main,0);

	draw_sprite_ext(sprite_index,image_index,x+(i*16),y,1,image_yscale,image_angle,image_blend,image_alpha);
		
	if ((floor(image_xscale) != image_xscale) && (i == floor(image_xscale)-1))
		
		draw_sprite_part_ext(sprite_index,image_index,0,0,8,sprite_height,x+(i*16)+16,y,1,image_yscale,image_blend,image_alpha);
	
	shader_reset();
	
}