draw_set_font(global.pointfont);

if (value >= 0) {

	draw_set_halign(fa_left);
	draw_set_alpha(image_alpha);
	draw_text_custom((_x+camera_get_view_x(view_camera[0])),y,value);
	
	if (!global.moderneffects) {
		
		if (_x+string_width(value) > camera_get_view_width(view_camera[0]))
	
			draw_text_custom((_x+camera_get_view_x(view_camera[0])-camera_get_view_width(view_camera[0])),y,value);
			
		else if (_x < 0)
		
			draw_text_custom((_x+camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])),y,value);
			
	}
	
	draw_set_alpha(1);
	draw_set_halign(fa_left);
	
} else {
	
	draw_sprite_ext(spr_text_1up,global.smb2_mode,_x+camera_get_view_x(view_camera[0]),y,1,1,0,-1,image_alpha);
	
	if (!global.moderneffects) {
		
		if (_x+sprite_get_width(spr_text_1up) > camera_get_view_width(view_camera[0]))
	
			draw_sprite_ext(spr_text_1up,global.smb2_mode,_x+camera_get_view_x(view_camera[0])-camera_get_view_width(view_camera[0]),y,1,1,0,-1,image_alpha);
			
		else if (_x < 0)
		
			draw_sprite_ext(spr_text_1up,global.smb2_mode,_x+camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]),y,1,1,0,-1,image_alpha);
			
	}
	
}