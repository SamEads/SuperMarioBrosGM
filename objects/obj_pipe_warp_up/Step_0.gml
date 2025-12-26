var player = (collision_rectangle(bbox_left+4,bbox_bottom-2,bbox_right-4,bbox_bottom+2,obj_player,0,1));

if (player) {
	
	if (player.bbox_left > bbox_left+4)
	&& (player.bbox_right < bbox_right-4) {
	
		with (player) {
		
			if (!button_check(left))
			&& (!button_check(right))
			&& (button_check(up))
			&& (!dead)
			&& (!warping) {
			
				warping = true;
				grounded = true;
				hspd = 0;
				other.warper = id;
				audio_play_stop_sound(snd_pipe,0,0);
				other.timer = other.warptime;
			
			}
		
		}
	
	}
	
}

if (warper != noone) {
	
	if (instance_exists(warper)) {
		
		if (warper.bbox_bottom > bbox_bottom-4) {
			
			warper.y --;
			warper.depth = 105;
			
		}
		
	}
	
}