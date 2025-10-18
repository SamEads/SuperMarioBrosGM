// Inherit the parent event
event_inherited();

//Has wings
has_wings = true;

//Invincible score
alternatescore = 200;

//Different scoring
differentscoring = true;

castle_alt_palette = true;

if (global.smb2_mode) {

	hspd = sign(hspd)*0.675;
	vspd = -1;
	
}
	
physics = false;