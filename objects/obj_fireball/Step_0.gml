if (global.frozen) {
	
	image_speed = 0;
	exit;
	
} else {
	
	image_speed = 0.5;
	
}

// Inherit the parent event
event_inherited();

if (grounded) {

	vspd_cap = 4;
	vspd = -2.2;
	
} else {
	
	if (vspd > 0)
	
		grav = 0.4;
		
	else
	
		grav = 0.25;
	
	if (vspd >= vspd_cap)
	
		vspd = vspd_cap;
	
}

if (hspd == 0) {
	
	instance_destroy();
	audio_play_stop_sound(snd_bump,0,0);
	
}