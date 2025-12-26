if (global.moderneffects) {
	
	if (instance_place(x,y,obj_player))
	
		depth = depthstart;
		
	else if (!global.frozen)
	
		depth = -20;
		
}

if (global.frozen) {
	
	event_inherited();
	exit;
	
}

// Inherit the parent event
event_inherited();

if (!dead) {

	grav = 0.075;
	vspd += grav;

	x += hspd;
	y += vspd;
	
	if (global.moderneffects)
	
		ang = (vspd*10)*-xscale;
		
	else
	
		ang = 0;
	
}

if (!instance_in_view(self,view_camera[0],48))

	instance_destroy();