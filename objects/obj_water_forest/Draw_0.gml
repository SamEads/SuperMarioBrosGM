depth = -20;

for (var i = 0; i < image_xscale; i ++) {
	
	if ((i+1)*16 >= camera_get_view_x(view_camera[0])
	&& (i-2)*16 < camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])) {
	
		gpu_set_blendmode_ext(bm_src_alpha,bm_inv_src_color);
	
		draw_sprite_ext(sprite_index,image_index,x+(i*16),y,1,1,0,-1,0.5);
	
		gpu_set_blendmode(bm_normal);
	
		draw_sprite_ext(spr_water_white,image_index,x+(i*16),y,1,1,0,-1,1);
		
	}
	
}

for (var i = 0; i < image_xscale; i ++) {
	
	if ((i+1)*16 >= camera_get_view_x(view_camera[0])
	&& (i-2)*16 < camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])) {
	
		for (var j = 0; j < image_yscale-1; j ++) {
		
			gpu_set_blendmode_ext(bm_src_alpha,bm_inv_src_color);
	
			draw_sprite_ext(spr_water_blue,0,x+(i*16),y+(j*16)+16,1,1,0,-1,0.5);
		
			gpu_set_blendmode(bm_normal);
		
		}
	
	}
	
}