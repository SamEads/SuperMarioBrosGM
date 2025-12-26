if (global.frozen) {
	
	event_inherited();
	exit;
	
}

if (!has_wings || dead) {
	
	autogravity = true;
	physics = true;
	
}

// Inherit the parent event
event_inherited();

if (dead || !has_wings) exit;

image_speed = 0.125;

if (direct == 1) {
	
	if (hspd < 1) {
		
		hspd += 0.0125;
		
	}
	
	if (x >= xstart - 32) {
		
		direct = -1;
		
	}
	
}

if (direct == -1) {
	
	if (hspd > -1) {
		
		hspd -= 0.0125;
		
	}
	
	if (x <= xstart - 56) {
		
		direct = 1;
		
	}
	
}

timer ++;
x += hspd;
y += (sin(timer*(0.075)) * 0.5);