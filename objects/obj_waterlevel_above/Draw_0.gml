if (!global.moderneffects) {

	if (surface_exists(_ss))
	
		surface_free(_ss);
		
	exit;
		
}

if (surface_get_width(_ss) != surface_get_width(application_surface) || surface_get_height(_ss) != surface_get_height(application_surface)) {
	
	if (surface_exists(_ss))
	
		surface_free(_ss);
		
}

if (!surface_exists(_ss)) {
    
    _ss = surface_create(surface_get_width(application_surface),surface_get_height(application_surface));
    
} else {

	surface_set_target(_ss);
	
	draw_clear_alpha(c_black,0);
	var _cam = camera_create();
	camera_set_view_size(_cam,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]));
	camera_set_view_pos(_cam,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]));
	camera_apply(_cam);

	for (var i = 0; i < image_xscale; i ++) {
	
		if (dark) {
	
			gpu_set_blendmode_ext(bm_src_color,bm_inv_src_color);
			draw_sprite_ext(sprite_index,image_index,x+(i*16),y,1,1,0,c_blue,0.5);gpu_set_blendmode(bm_normal);
			gpu_set_blendmode(bm_normal);
		
		}
	
		draw_sprite_ext(spr_water_white,image_index,x+(i*16),y,1,1,0,image_blend,1);
	
	}

	if (!dark) {
		
		surface_reset_target();
		exit;
		
	}

	for (var i = 0; i < image_xscale; i ++) {
	
		for (var j = 0; j < image_yscale-1; j ++) {
	
			gpu_set_blendmode_ext(bm_src_color,bm_inv_src_color);
			draw_sprite_ext(blue_index,image_index,x+(i*16),y+(j*16)+16,1,1,0,c_blue,0.5);
			gpu_set_blendmode(bm_normal);
		
		}
	
	}
	
	gpu_set_blendmode(bm_normal);
	
	surface_reset_target();

}