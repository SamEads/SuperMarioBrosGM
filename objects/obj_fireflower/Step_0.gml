if (global.frozen && !sprouting) {
	
	image_speed = 0;
	exit;
		
} else {
	
	image_speed = 0.5;
	
}

if (sprouting) {
	
	y -= 0.25;
	
	if (y <= ystart-15) {
	
		sprouting = false;
		depth = 1;
		
	}
	
} else {

	if (!grounded) grav = 0.375;
	event_inherited();
	
}