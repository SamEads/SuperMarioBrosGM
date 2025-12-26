if (!global.moderneffects) {

	event_user(0);
	add_score(alternatescore);
	audio_play_stop_sound(snd_kick,0,0);
	instance_destroy();

} else {
	
	event_inherited();
	
}