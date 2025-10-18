if (!global.moderneffects) {
	
	sprite_index = spr_water_static;
	blue_index = spr_water_blue;
	
} else {

	if (!dark) {

		sprite_index = spr_water;
		blue_index = spr_water_blue;
		
	} else {
		
		sprite_index = spr_water_dark;
		blue_index = spr_water_blue_dark;
		
	}

}

for (var i = floor((camera_get_view_x(view_camera[0])-16)/16); i < floor((camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])+16)/16); i ++) {
	
	var draw_it = true;
	
	if (global.moderneffects || !per_block)
		
		draw_it = true;
	
	else if (per_block)
		
		if (tilemap_pos[i,round(y/16)] == true)
	
			draw_it = false;
	
	if (draw_it)
	
		draw_sprite(sprite_index,image_index,x+(i*16),y);
	
	for (var j = 0; j < image_yscale-1; j ++) {
		
		var draw_it = true;
		
		if (global.moderneffects || !per_block)
		
			draw_it = true;
		
		else if ((i+1)*16 < camera_get_view_x(view_camera[0]))
		
			draw_it = false;
		
		else if (i*16 > camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])) {
	
			draw_it = false;
	
		} else if (per_block)
		
			if (tilemap_pos[i,clamp(j+(round(y)/16)+1,0,round(image_yscale)-1)] == true)
	
				draw_it = false;
	
		if (draw_it)
	
			draw_sprite(blue_index,global.moderneffects,x+(i*16),y+(j*16)+16);
		
	}
	
}