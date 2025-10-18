event_inherited();

if (global.frozen) {
	exit;
}

if (dead) {
	autograv = true;
	exit;
}

if (chase_timer > 0) {
	chase_timer --;
	
	if (chase_timer <= 0) {
		chasing = true;
		hspd = sign(xscale) * 0.75;
	}
}

if (post_throw_timer > 0) {
	post_throw_timer --;
}
else {
	if (hammers_left <= 0) {
		post_throw_timer = 60;
		hammers_left = irandom_range(1,7);
	}
	else {
		if (throw_timer > 0) {
			throw_timer --;
			
			if (throw_timer <= 0) {
				var hammer_x = x + (hammer_x_offset * sign(xscale));
				var hammer_y = y + hammer_y_offset;
				
				with (instance_create_depth(hammer_x, hammer_y, depth - 3, obj_hammer)) {
					hspd = abs(hspd) * other.xscale;
					xscale = other.xscale;
				}
				
				sprite_index = walk_sprite;
				hammers_left--;
				throw_timer = 38;
			}
			else if (throw_timer < 15) {
				sprite_index = throw_sprite;
			}
		}
	}
}

var player = instance_nearest(x, y, obj_player);

if (chasing) {
	physics = true;
	hspd = sign(xscale)*0.75;
	
	if (grounded &&
		!collision_line(x+(4*xscale),bbox_bottom+4,x+(4*xscale),bbox_bottom+96,obj_semisolid,0,0)) {
		vspd = -4;
	}
	
	//Chase the player
	if (player && player.x > x) {
		if (sign(hspd) != 1) {
			chasing = false;
			hspd = abs(hspd)*0.25;
			x_middle = x;
			chase_timer = 3600;
		}
	}
	else if (sign(hspd) != -1) {
		chasing = false;
		hspd = -abs(hspd)*0.25;
		chase_timer = 3600;
	}
	
	// jump if there's ground ahead of hammer bro
	var ground_check_x = x + (10 * sign(hspd));
	if (grounded && instance_place(ground_check_x, y, obj_solid)) {
		vspd = -4;
	}

} else {
	// hammer bros don't adhere to physics typically...
	physics = false;
	
	if (grounded) {
		if (jump_timer > 0) {
			jump_timer --;
		}
			
		// time for the hammer bro to perform a jump
		if (jump_timer <= 0) {
			var do_lowjump = false;
			highjump = false;
				
			// if not currently on a block, do a large jump
			if (!collision_rectangle(x,bbox_bottom,x,bbox_bottom+4,obj_blockparent,false,true)) {
				highjump = true;
			}
			// if already on a block, 50 / 50 dice roll on high low jump
			else if (collision_rectangle(x,bbox_top,x,bbox_top-64,obj_blockparent,false,true)) {
				highjump = choose(true, false);
					
				if (!highjump) {
					lowjump_timer = 20;
					do_lowjump = true;
				}
					
			}
			// no set of blocks on top of hammer bro, so jump down a layer
			else if (collision_rectangle(x,bbox_bottom,x,bbox_bottom+4,obj_blockparent,false,true) && !highjump) {
				lowjump_timer = 20;
				do_lowjump = true;
			}
				
			if (highjump) {
				vspd = -highjump_spd;
			} else if (do_lowjump) {
				vspd = -lowjump_spd;
			}
				
			grounded = false;
			jumping = true;
			jump_timer = irandom_range(180,240);
		}
		
		if (x < x_middle - 8) {
	
			if (hspd < 0)
	
				hspd = abs(hspd);
				
			else if (hspd == 0 && throw_sprite != spr_sledgebro_throw)
			
				hspd = 0.25;
		
		} else if (x > x_middle + 8) {
	
			if (hspd > 0)
	
				hspd = -abs(hspd);
				
			else if (hspd == 0 && throw_sprite != spr_sledgebro_throw)
			
				hspd = -0.25;
		
		} else if (hspd == 0 && throw_sprite != spr_sledgebro_throw) {
			
			hspd = sign(xscale)*0.25;
		}
		
	}
	// In air
	else if (calculate_gravity) {
		if (vspd <= 0) {
			grav = 0.15;
		} else {
			grav = 0.15625;
		}
	}
	
	if (!physics) {
			
		var s = (collision_line(bbox_left,bbox_bottom+1+abs(vspd),bbox_right,bbox_bottom+1+abs(vspd),obj_semisolid,0,0));
			
		if (s && vspd >= 0 && lowjump_timer <= 0) {
			
			if (!collision_line(bbox_left,bbox_top,bbox_right,bbox_top,s,0,0)) {
			
				y = (s.bbox_top-(sprite_height-sprite_get_yoffset(sprite_index)));
		
				grounded = true;
				grav = 0;
				vspd = 0;
			
			}
			
		} else grounded = false;
		
		if (grav != 0) {
			
			if (lowjump_timer > 0 && vspd > 0)
			
				lowjump_timer --;
			
			grounded = false;
			
		}
		
		vspd += grav;
		
		if (vspd > vspd_cap)
		
			vspd = vspd_cap;
		
		y += vspd;
		x += hspd;
			
	}
	
}

if (player) {
	if (player.x > x) {
		xscale = 1;
	} else {
		xscale = -1;
	}
}

deathsprite = sprite_index;