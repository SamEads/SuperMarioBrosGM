var player = (collision_rectangle(bbox_right,bbox_top+2,bbox_right+2,bbox_bottom,obj_player,0,1));

if (player) {
	
	if (player.bbox_bottom > bbox_top)
	&& (player.bbox_bottom <= bbox_bottom) {
	
		with (player) {
		
			if (button_check(left))
			&& (grounded)
			&& (!dead)
			&& (!warping) {
			
				warping = true;
				other.warper = id;
				audio_play_stop_sound(snd_pipe,0,0);
				other.timer = other.warptime;
			
			}
		
		}
	
	}
	
}

if (warper != noone) {
	
	if (instance_exists(warper)) {
		
		warper.x -= 0.5;
		warper.depth = 175;
		warper.hspd = -1;
		warper.xscale = -1;
		warper.crouching = false;
		
		if (warper.bbox_left <= bbox_left) {
			
			warper.visible = false;
			
		}
		
	}
	
}