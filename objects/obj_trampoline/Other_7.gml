if (image_speed > 0) {
	
	image_speed = -0.375;
	image_index = 2;
	
	if (captor != noone) {
		
		if (captor.dead)
		
			exit;
	
		if (captor.vspd >= 0) {
			
			captor.canjump = true;
			captor.hspd = 0;
			
			var highjump = false;
			
			with (captor)
			
				if (button_check(abutton) && can_highjump)
				
					highjump = true;
					
			if (!highjump)
			
				captor.vspd = -lowjump_height;
				
			else
			
				captor.vspd = -highjump_height;
			
			if (abs(captor.stored_hspd) > 0.675) {
			
				captor.hspd = captor.stored_hspd;
				
				if (abs(captor.hspd) >= 1.5625)
				
					captor.running = true;
					
				with (captor) {
					
					if (hspd > 0) {
						
						if (bbox_right > other.bbox_right)
						
							if (instance_place(bbox_right+hspd,y,obj_solid))
						
								hspd = 0;
							
					} else if (hspd < 0) {
						
						if (bbox_left < other.bbox_left)
						
							if (instance_place(bbox_left-hspd,y,obj_solid))
						
								hspd = 0;
							
					}
					
				}
				
			}
			
			if (highjump) {
				
				captor.jumptimer = highjump_timer;
				
			} else {
				
				captor.jumptimer = lowjump_timer;
				
			}
				
			captor.grav = set_grav;
			captor.grounded = false;
			captor.jumprelease = false;
			
			if (global.moderneffects) audio_play_stop_sound(snd_bump,0,0);
			
		}
		
	}
	
} else {
	
	image_speed = 0;
	image_index = 0;
	
}