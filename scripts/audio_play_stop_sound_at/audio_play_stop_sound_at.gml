function audio_play_stop_sound_at(sound_index, priority, loops, _xx, _yy) {
	
	var _x = camera_get_view_x(view_camera[0]);
	var _w = camera_get_view_width(view_camera[0]);
	var _y = camera_get_view_y(view_camera[0]);
	var _h = camera_get_view_height(view_camera[0]);

	audio_stop_sound(argument[0]);
	
	switch (global.moderneffects) {
		
		default: audio_play_sound(sound_index, priority, loops); break;
		case (true): audio_play_sound_at(sound_index, _x + _w / 2 - _xx, _y + _h / 2 - _yy, 0, camera_get_view_width(view_camera[0]) * 2, 100, 1,  priority, loops); break;
		
	}

}