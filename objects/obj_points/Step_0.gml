if (!global.moderneffects) {

	y -= spd;

	if (y <= ystart-lifespan)

		instance_destroy();
	
} else {
	
	if (vspd < 0) {
	
		vspd += 0.1;
		y += vspd;
		
	} else {
		
		if (image_alpha <= 0.8) {
		
			vspd += 0.05;
			y += vspd;
			
		}
		
		image_alpha -= 0.1;
		
		if (image_alpha <= 0)
		
			instance_destroy();
			
	}
	
}