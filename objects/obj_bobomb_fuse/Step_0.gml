// Inherit the parent event
event_inherited();

if (global.frozen || dead) exit;

if (fusetimer > 0) {
	
	fusetimer --;

	if (fusetimer <= 60) {
		
		image_speed = 0.2;
		
	}

	if (fusetimer <= 0) {
		
		instance_destroy();
		
	}
	
}

if (bouncing) {
	
	hspd = hspd/2;
	
}

if (hspd == 0)

	enemyturn = true;
	
else

	enemyturn = false;

if (vspd == 0 && grounded) {
	
	hspd -= 0.25*sign(hspd);
	
	if (abs(hspd) <= 0.125)
	
		hspd = 0;
	
}