if (global.frozen || other.dead) exit;

with (other) {
	
	powerupcheck = true;
	transforming = true;
	transformtimer = round(room_speed * (audio_sound_length(snd_powerup)));
	global.frozen = true;
	powerup = itemtype.id_subcon;
	jumprelease = true;
		
	if (!global.moderneffects) {
		
		grounded = true;
		grav = 0;
		jumping = false;
			
	}
	
}

audio_play_stop_sound(snd_powerup,0,0);
add_score(1000);
instance_destroy();