// Inherit the parent event
event_inherited();

if (dead || global.frozen) exit;

if (throw_timer <= 15) {
	
	if (hspd != 0) {
	
		return_hspd = hspd;
		hspd = 0;
	
	}
	
	image_index = 1;
	
} else if (grounded) {
	
	if (return_hspd != 0) {
		
		hspd = return_hspd;
		return_hspd = 0;
		
	}
	
}

if (!grounded) {

	if (hspd != 0) {
	
		return_hspd = hspd;
		hspd = 0;
	
	}
	
} else if (grounded && throw_timer > 15) {
	
	if (return_hspd != 0) {
		
		hspd = return_hspd;
		return_hspd = 0;
		
	}
	
}
	
if (grounded && throw_timer > 15) {
	
	image_speed = 0.125;
	
}

if (!grounded) {
	
	if (highjump) {

		if (vspd < 0) {
		
			grav = 0.375;
			pause_time = 15;
			
		} else {
			
			pause_time --;
			
			if (pause_time <= 0) {
			
				grav = 0.5;
				
			} else {
			
				vspd = 0;
				grav = 0;
				image_speed = 0;
				
			}
			
		}
			
	} else {
		
		grav = 0.15625;
		
	}
	
} else if (ground_check == true) {
	
	with (obj_player) {
		
		if (grounded) {
		
			controllable = false;
			shaketimer = 60;
			
		}
		
	}
	
	screen_shake(40);
	
	audio_play_stop_sound(snd_explosion,0,0);
	
}
	
if (vspd >= 8)
	
	vspd = 8;
	
if (highjump && !grounded)
	
	ground_check = true;
	
else

	ground_check = false;
	
if (grounded && highjump)

	highjump = false;