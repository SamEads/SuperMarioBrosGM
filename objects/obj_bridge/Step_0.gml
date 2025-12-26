// Inherit the parent event
event_inherited();

if (destroying && grav == 0) {
	
	destroytimer ++;
	
	if (destroytimer >= 4) {
		
		if (instance_place(x-8,y,obj_bridge)) {
				
			with (instance_place(x-8,y,obj_bridge))
			
				destroying = true;
			
		} else {
			
			if (instance_exists(obj_bowser)) {
				
				with (obj_bowser) {
					
					if (dying_animation) {
						
						if (!falling_out) {
						
							falling_out = true;
							vspd = 0;
							audio_play_stop_sound(snd_fall,0,0);
							
							if (instance_exists(obj_axe))
							
								obj_axe.moderntimer = 40;
							
						}
						
					}
					
				}
				
			}
			
		}
			
		audio_play_stop_sound(snd_bump,0,0);
		audio_play_stop_sound(snd_break,0,0);
			
		if (!global.moderneffects)
			
			instance_destroy();
			
		else
		
			grav = 0.2;
		
	}
	
}

vspd += grav;
	
if (instance_place(x,y,obj_lava)) {
	
	if (vspd >= 1)
	
		vspd = 1;
		
} else {
	
	if (vspd >= 4)

		vspd = 4;
	
}

y += vspd;