if (captor != noone) {

	var extra = 0;
	
	if (captor.powerup != itemtype.id_small)
	
		extra = 16;

	if (collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom+extra,captor,0,1)) {
		
		captor.warping = true;
		
		if (warptimer <= 0) {
			
			captor.y ++;
			captor.grounded = true;
			
		} else {
			
			warptimer --;
		
			if (warptimer == 0 && global.moderneffects)
			
				audio_play_stop_sound(snd_pipe,0,0);
		
		}
		
	} else {
		
		layer_add_instance("Player",captor);
		captor.warping = false;
		captor.controllable = true;
		captor = noone;
		obj_controller.showtime = true;
		
	}
	
}