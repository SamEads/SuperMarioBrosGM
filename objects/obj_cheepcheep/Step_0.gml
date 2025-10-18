if (global.frozen) {
	
	event_inherited();
	exit;
	
}

// Inherit the parent event
event_inherited();

if (!dead)

	x += hspd;
	
else

	physics = true;
	
if ((x-sprite_get_xoffset(sprite_index)+sprite_get_width(sprite_index)) < camera_get_view_x(view_camera[0]))

	instance_destroy();
	
if (bobbing) {
	
	if (bobdirection == -1) {
	
		y -= 0.125;
	
		if (y <= ystart-16)
	
			bobdirection = 1;
	
	} else if (bobdirection == 1) {
	
		y += 0.125;
	
		if (y >= ystart+16)
	
			bobdirection = -1;
	
	}

}

deathsprite = sprite_index;