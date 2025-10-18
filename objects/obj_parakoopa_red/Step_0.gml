if (global.frozen) {
	
	event_inherited();
	exit;
	
}

// Inherit the parent event
event_inherited();

if (dead) exit;

if (direct == 1) {
	
	if (vspd < 1) {
		
		vspd += 0.0125;
		
	}
	
	if (y >= ystart + 56) {
		
		direct = -1;
		
	}
	
}

if (direct == -1) {
	
	if (vspd > -1) {
		
		vspd -= 0.0125;
		
	}
	
	if (y <= ystart + 32) {
		
		direct = 1;
		
	}
	
}

y += vspd;