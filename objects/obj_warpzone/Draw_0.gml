if (activated) {
	
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	
	if (global.moderneffects) {
	
		for (var i = 0; i < array_length_1d(warpzone); i ++) {
	
			draw_text_custom(x-96+(i*8),camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])-144+(sin((timer+(i*3))*0.075)*4),warpzone[i]);
	
		}
	
	} else {
		
		draw_text_custom(x-96,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])-144,"WELCOME TO WARP ZONE!");
		
	}
	
	with (obj_pipe_warp_down_world)
		
		draw_text_custom(x-8,y-24,my_world);
	
}