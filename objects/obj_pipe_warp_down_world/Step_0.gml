// Inherit the parent event
event_inherited();

if (warper != noone && !global.moderneffects) {

	obj_controller.stopmusic = true;
	
	with (obj_controller) {
	
		audio_stop_sound(bgm_sound);
	
	}

}