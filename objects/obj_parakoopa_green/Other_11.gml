if (has_wings) {
	
	has_wings = false;
	differentscoring = false;
	
	sprite_index = spr_koopa;
	
	vspd = 0;

	audio_play_stop_sound(snd_stomp,0,0);
	
	other.combo += (global.moderneffects) ? 1 : 0;
			
	hit_combo(3,other.combo,false,other.char);
	
	exit;
	
} else {
	
	event_inherited();
	
}