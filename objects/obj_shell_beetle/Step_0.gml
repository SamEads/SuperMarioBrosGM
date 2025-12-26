// Inherit the parent event
event_inherited();

if (global.frozen || dead) {
	
	image_speed = 0;
	exit;
	
}

if (!moving)

	image_index = 0;
	
deathsprite = sprite_index;