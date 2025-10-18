if (dead) exit;

if (hits_left > 0) {

	if (global.moderneffects) {
	
		hurttimer = 30;
		audio_play_stop_sound(snd_kick,0,0);
		
	}

	hits_left --;
	
} else {
	
	image_index = 0;
	
	image_speed = 0;
	
	sprite_index = deathsprite;
	
	yscale = -1*abs(yscale);
	
	audio_play_stop_sound(snd_fall,0,0);
	
	dead = true;
	
	add_score(5000);
		
	hspd = 0;
		
	vspd = -2;
	
}