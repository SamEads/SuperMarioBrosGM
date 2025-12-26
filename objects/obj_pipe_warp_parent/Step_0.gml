var player = (collision_rectangle(bbox_left+4,bbox_top+2,bbox_right-4,bbox_top-2,obj_player,0,1));

if (player) {
	
	if (player.bbox_left > bbox_left+5)
	&& (player.bbox_right < bbox_right-5) {
	
		with (player) {
		
			if (!button_check(left))
			&& (!button_check(right))
			&& (button_check(down))
			&& (grounded)
			&& (!dead)
			&& (!warping) {
			
				warping = true;
				crouching = true;
				other.warper = id;
				audio_play_stop_sound(snd_pipe,0,0);
				other.timer = other.warptime;
				other.warp_y = y+34;
				immune = true;
			
			}
		
		}
	
	}
	
}

if (warper != noone) {
	
	if (instance_exists(warper)) {
		
		if (warper.y < warp_y) {
			
			if (global.moderneffects) {
				
				warper.follow_player = false;
				
				if (warper.x > x) {
					
					warper.x --;
					
					if (warper.x <= x)
					
						warper.x = x;
						
				} else if (warper.x < x) {
					
					warper.x ++;
					
					if (warper.x >= x)
					
						warper.x = x;
						
				} else {
					
					warper.y ++;
					
				}
				
			} else {
		
				warper.y ++;
				
			}
			
		}
			
		warper.depth = 105;
		
	}
	
}