// Inherit the parent event
event_inherited();

if (!falling) {

	if (my_buddy == noone) exit;

	player = instance_place(x,bbox_top-8,obj_player);

	if (player) {
	
		if (player.vspd >= 0 && !player.dead && player.grounded && !player.dead) {
		
			has_player = true;
		
			vspd += 0.01875;
		
			if (vspd > 1.5)
		
				vspd = 1.5;
		
		} else {
		
			has_player = false;
			
		}
	
	} else {
	
		has_player = false;
		player = noone;
			
	}

	if (!has_player && !my_buddy.has_player) {
	
		if (vspd > 0) {
		
			vspd -= 0.01875;
		
			if (vspd <= 0)
		
				vspd = 0;
		
		}
		
		if (vspd < 0) {
		
			vspd += 0.01875;
		
			if (vspd >= 0)
		
				vspd = 0;
		
		}
		
	}
	
	if (y < anchor.top+16) {
		
		falling = true;
		vspd = 0;
		
		if (my_buddy.player != noone)
		
			add_score(1000,my_buddy.player.x,my_buddy.player.y);
			
		else
		
			add_score(1000);
			
		my_buddy.falling = true;
		my_buddy.vspd = 0;
		
	}

	if (my_buddy != noone)
	
		if (my_buddy.has_player || has_player)

			my_buddy.vspd = -vspd;
	
} else {
		
	vspd += 0.15625;
	
	if (vspd >= 4)
	
		vspd = 4;
		
}