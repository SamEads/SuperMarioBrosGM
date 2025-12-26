/// @description Make the player bounce

if (!swimming) {
	
	if (!global.moderneffects) {

		if (abs(hspd) < 2.3125)

			vspd = -4.5;
	
		else

			vspd = -5;
		
	} else {
		
		vspd = -4.375;
		
	}
		
} else vspd = -1;

y --;

if (global.smb2_mode && !global.moderneffects) {

	vspd = -6;
	jumptimer = 5;
	
}

if (global.moderneffects) {

	jumprelease = false;
	jumping = true;
	calculate_new_gravity = true;
	
} else

	jumprelease = true;

grav = 0;