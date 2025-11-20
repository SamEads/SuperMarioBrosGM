event_user(15);

if ((sprite_index == spr_block_hit 
|| sprite_index == spr_block_hit_alt
|| sprite_index == spr_block_hit_modern)
&& (hitsequence == 0)) {

	if (solid_start && global.pswitch > 0)
	|| (!solid_start && global.pswitch <= 0) {
		
		var permcoin = false;
		
		if (!solid_start && global.pswitch <= 0)
		
			permcoin = true;
	
		with instance_create_depth(x,y,depth,obj_coin) {
		
			hitspr = spr_block_hit;
			returnspr = other.sprite_index;
			
			if (permcoin)
			
				coin_start = true;
		
		}
	
		instance_destroy();
	
	}

}

y_disp += (y-yprevious);