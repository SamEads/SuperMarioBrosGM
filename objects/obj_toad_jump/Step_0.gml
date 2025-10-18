if (!created_buddy) {
	
	uptimer += 0.1;
	startdepth = depth;
	
	if (uptimer >= 1) {
	
		y -= 8;
		uptimer = 0;
		visible = true;
	
	}
	
	if (y < ystart-12)
	
		y = ystart-12;
	
}

if ((y <= ystart-12) && (!created_buddy)) {
	
	depth = linepos;

	if (buddies_left > 0) {
		
		jumptoad = instance_create_depth(x,y,depth+1,obj_toad_jump);
		audio_play_stop_sound(snd_powerup_reveal,0,0);

		with (jumptoad) {
								
			buddies_left = other.buddies_left-1;
			linepos = other.linepos-1;
			grounded = false;
								
		}
	
	}
	
	created_buddy = true;
	
}

if (jumptoad != noone) {
	
	if (sprite_index == spr_toad
	|| sprite_index == spr_toad_peace) {
		
		jumptoad.sprite_index = sprite_index;
		jumptoad.image_index = 0;
		jumptoad.image_speed = 0;
		
	}
	
}

if (sprite_index == spr_toad_peace) {
	
	xscale = 1;
	
}

if (jumping) {
	
	if (!jump_initiated) {
		
		if (jumptoad != noone) {
		
			jumptoad.jumping = true;
		
			switch (buddies_left) {
			
				default: jumptoad.vspd = -3; jumptoad.hspd = random_range(-1,1); break;
				case (2): jumptoad.vspd = -2; jumptoad.hspd = 1.275; break;
				case (1): jumptoad.vspd = -1.625; jumptoad.hspd = -1.3; break;
			
			}
			
		}
		
		jump_initiated = true;
		
	}
	
	if (vspd > 3)
	
		vspd = 3;
	
	depth = startdepth;
	sprite_index = spr_toad_jump_side;
	
	if (hspd != 0)
	
		xscale = (sign(hspd));
		
	event_inherited();
	
	if (grounded) {
	
		jumping = false;
		sprite_index = spr_toad_side;
		image_index = 1;
		image_speed = 0;
		
	}
	
}