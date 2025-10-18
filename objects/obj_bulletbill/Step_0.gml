if (global.frozen) {
	
	event_inherited();
	exit;
	
}

// Inherit the parent event
event_inherited();

if (!dead) {

	x += lengthdir_x(spd,dir);
	y += lengthdir_y(spd,dir);
	
}

if (fixdepth > 0) {
	
	fixdepth --;
	
	if (fixdepth <= 0) {
	
		depth = -1;
		start_depth = -1;
		
	}
		
}

if (global.moderneffects && sprite_index == spr_bulletbill) {
	
	sprite_index = spr_bulletbill_arm;
	image_speed = 0.125;
	
} else if (!global.moderneffects && sprite_index == spr_bulletbill_arm) {
	
	sprite_index = spr_bulletbill;
	
}

if (spawner_parent == noone && !instance_in_view(self,view_camera[0],24)) {
	
	instance_destroy();
	
}

deathsprite = sprite_index;

if (dead)

	ang = 0;