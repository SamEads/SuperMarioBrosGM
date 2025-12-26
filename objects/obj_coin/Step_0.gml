image_index = global.tick;

if (collision_rectangle(x,bbox_bottom+2,x,bbox_bottom+2,obj_block_parent,0,1)) {
	
	if (collision_rectangle(x,bbox_bottom+2,x,bbox_bottom+2,obj_block_parent,0,1).hitsequence != 0) {
		
		instance_destroy();
		instance_create_depth(x,y,-1,obj_coin_collected);
		audio_play_stop_sound(snd_coin,0,0);
		
	}
	
}

switch (global.moderneffects) {
	default:
		switch (obj_controller.currenttheme) {
			default: sprite_index = spr_coin; break;
			case (themetype.cave): sprite_index = spr_coin_cave; break;
			case (themetype.castle): sprite_index = spr_coin_castle; break;
			case (themetype.water): sprite_index = spr_coin_water; break;
			case (themetype.desert): sprite_index = spr_coin_desert; break;
		}
		break;
	case (true):
		switch (obj_controller.currenttheme) {
			default: sprite_index = spr_coin_modern; break;
			case (themetype.cave): sprite_index = spr_coin_cave_modern; break;
			case (themetype.castle): sprite_index = spr_coin_castle_modern; break;
			case (themetype.desert): sprite_index = spr_coin_desert_modern; break;
		}
		break;
}

if (coin_start && global.pswitch > 0)
|| (!coin_start && global.pswitch <= 0) {
	
	var perm_block = false;
	
	if (!coin_start && global.pswitch <= 0)
	
		perm_block = true;
	
	with instance_create_depth(x,y,depth,obj_block_parent) {
		
		sprite_index = spr_block_hit;
		hitspr = spr_block_hit;
		alarm[0] = -1;
		can_hit = false;
		
		if (perm_block)
		
			solid_start = true;
		
		if (other.returnspr != -1)
		
			sprite_index = other.returnspr;
		
	}
	
	instance_destroy();
	
}