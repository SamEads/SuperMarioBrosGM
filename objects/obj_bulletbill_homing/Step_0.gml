// Inherit the parent event
event_inherited();

if (global.frozen || dead) exit;

bullet_timer ++;

if (bullet_timer > 30 && bullet_timer < 360) {
	
	var player = instance_nearest(x,y,obj_player);
	
	if (player) {
	
		var pd = point_direction(x,y,player.x,player.y);
		var dd = angle_difference(dir, pd);
		dir -= min(abs(dd), rot_spd) * sign(dd);
		
	}
	
}

if (sprite_index == spr_bulletbill || sprite_index == spr_bulletbill_arm) {

	spd = 1.5;
	image_speed = 0.125;
	
}

if (xscale == 1)

	ang = dir;
	
if (xscale == -1)

	ang = dir-180;
	
deathsprite = sprite_index;