function music_loops() {

	//Loop start (in seconds & decimals for specifics)
	var loopstart = 0;
	
	//Loop end (in seconds & decimals for specifics)
	var loopend = 0;
	
	var loop = true;
	
	if (bgm == bgm_airship) {
		
		loopstart = 4.497;
		loopend = 36.497;
		
	}

	if (bgm == mus_castle) {
		
		loopstart = 0;
		loopend = 87.813;
		
	}

	//Overworld loop
	if (bgm == mus_overworld) {
		
		loopstart = 2.412;
		loopend = 88.683;
		
	}
	
	//Underground loop
	if (bgm == mus_underground) {
		
		loopstart = 0;
		loopend = 12.585;
		
	}
	
	if (bgm == mus_pipe) {
		
		loopstart = 0;
		loopend = 2.312;
		loop = false;
		
	}
	
	if (bgm == bgm_pipe_forest) {
		
		loopstart = 0;
		loopend = 2.393;
		loop = false;
		
	}
	
	if (bgm == mus_princess) {
		
		loopstart = 1.213;
		loopend = 7.602;
		
	}
	
	if (bgm == mus_athletic) {
		
		loopstart = 2.456;
		loopend = 64.556;
		
	}
	
	if (bgm == bgm_snow) {
		
		loopstart = 5.817;
		loopend = 52.348;
		
	}
	
	if (bgm == mus_water) {
		
		loopstart = 3.973;
		loopend = 29.538;
		
	}
	
	if (bgm == bgm_forest) {
		
		loopstart = 0;
		loopend = 38.399;
		
	}
	
	if (bgm == bgm_desert) {
		
		loopstart = 5.158;
		loopend = 44.885;
		
	}
	
	if (audio_is_playing(mus_invincible)) {
		
		loopstart = 0.18;
		loopend = 3.37;
		
	}
	
	if (loop) {
		
		loop_song = true;
	
	if (audio_sound_get_track_position(bgm_sound) > loopend) {
		
		audio_sound_set_track_position(bgm_sound,audio_sound_get_track_position(bgm_sound)-(loopend-loopstart));
		
	}
		
	} else {
		
		if (audio_sound_get_track_position(bgm_sound) > 0.1) {
			
			loop_song = false;
			
		}
		
	}

}