if (global.frozen || other.dead) exit;

with (other) {
	
	invincibletimer = 12 * 60;
	
}

audio_play_stop_sound(snd_powerup,0,0);
add_score(1000,x,y,1,60);
instance_destroy();