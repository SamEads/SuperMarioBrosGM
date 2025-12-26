if (global.frozen) {
	
	if (!sprouting) {
	
		image_speed = 0;
		exit;
		
	}
	
}

if (timer <= 0) {

	if (vspd > 0)
	
		grav = 0.075;
		
	else
	
		grav = 0.15;
		
	if (vspd >= vspd_cap)
	
		vspd = vspd_cap;

	// Inherit the parent event
	event_inherited();
	
} else {
	
	if (instance_place(bbox_right+12,y+2,obj_solid))
	
		timer = 0;
	
	grav = 0.2;
	timer --;
	vspd += grav;
	if (vspd > vspd_cap) vspd = vspd_cap;
	y += vspd;
	x += hspd;
	
}
	

if (grounded && vspd == 0) {
	
	vspd = -3.5;
	
}

image_speed = imgspd;