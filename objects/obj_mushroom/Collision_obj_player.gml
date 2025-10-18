if (global.frozen || other.dead) exit;

with (other) {
	
	if (powerup == itemtype.id_small) {
	
		powerupcheck = true;
		transforming = true;
		transformtimer = round(room_speed * (audio_sound_length(snd_powerup)));
		global.frozen = true;
		powerup = itemtype.id_big;
		jumprelease = true;
		
		if (!global.moderneffects) {
		
			grounded = 2;
			grav = 0;
			jumping = false;
			
		}
		
	}
	
}

if (global.p_health[other.char] < global.p_maxhealth[other.char]) global.p_health[other.char] ++;

audio_play_stop_sound(snd_powerup,0,0);
add_score(1000,x,y,1,60);
instance_destroy();