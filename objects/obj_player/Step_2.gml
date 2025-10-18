/// @description After-movement actions
if (char == chara.custom && (sign(health_based) == 1) && powerup == itemtype.id_small) {
	
	powerup = itemtype.id_big;
	
}

if (!holding)

	extra_y = 0;

if (!dead && !global.frozen && powerup == itemtype.id_subcon) {
	
	var top_pos;
	
	switch (char) {
	
		default: top_pos = 16; break;
		case (chara.luigi): top_pos = 20; break;
	
	}
	
	if (holding == 1) {
		
		pull_object.x = x;
		pull_object.y = y-(sprite_get_bbox_bottom(mask_index)-sprite_get_bbox_top(mask_index))+floor(image_index)+sprite_get_height(pull_object.sprite_index)-top_pos;
		pull_object.round_in_retro = false;
		extra_y = 8;
		
		if (button_check_pressed(bbutton)) {
			
			pull_object.thrown = true;
			pull_object.depth = pull_object_depth;
			pull_object.hspd = 3*xscale;
			pull_object.thrower = id;
			throw_timer = 10;
			pull_object = noone;
			audio_play_stop_sound(snd_throw,0,0);
			holding = false;
			
		}
		
	}
	
	if (pulling_up) {
		
		if (pull_object != noone) {
			
			var pull_rate = 2;
			
			pull_object.y -= pull_rate;
			pull_object.x = x;
			pull_y_goal += pull_rate;
			pull_object.depth = depth-1;
			
			if (pull_y_goal >= top_pos) {
				
				controllable = true;
				controllable_check = true;
				pulling_up = false;
				physics = true;
				holding = 1;
				pull_object.yscale = -1;
				pull_y_goal = 0;
				
			}
			
		}
		
	}

	var enemy = collision_rectangle(bbox_left-1,bbox_bottom-4,bbox_right+1,bbox_bottom+4+abs(vspd),obj_enemyparent,0,0);
	var on_enemy = false;
		
	if (enemy) {
		
		if (bbox_bottom <= enemy.bbox_top+1+abs(enemy.y-enemy.yprevious)) {
	
			if (!enemy.dead && enemy.pickup) {
	
				if (vspd >= 0)
				&& (bbox_right >= enemy.bbox_left)
				&& (bbox_left <= enemy.bbox_right)
				&& (!dead) {
				
					y = (enemy.bbox_top-(sprite_get_height(sprite_index)-sprite_get_yoffset(sprite_index)));
				
					if (x > camera_get_view_x(view_camera[0])+8)
					&& (x < room_width-8) {
						
						var move = true;
						var amount = enemy.x-enemy.xprevious;
						
						if (enemy.x > enemy.xprevious) {
						
							if collision_rectangle(bbox_right,bbox_top,bbox_right+amount+1,bbox_bottom,obj_solid,0,0)
							
								move = false;
								
						} else if (enemy.x < enemy.xprevious)
						
							if collision_rectangle(bbox_left,bbox_top,bbox_left-amount-1,bbox_bottom,obj_solid,0,0)
							
								move = false;
						
						if (move)
				
							x += amount;
								
					}
				
					grounded = true;
					vspd = 0;
					grav = 0;
					on_enemy = true;
					
				}

			}
		
		}
		
	}
	
	if (on_enemy && throw_timer <= 0) {
		
		if (button_check_pressed(bbutton)) {
			
			controllable = false;
			physics = false;
			hspd = 0;
			vspd = 0;
			grav = 0;
			audio_play_stop_sound(snd_pickup,0,0);
			pull_timer = 10;
			pull_object_depth = enemy.depth;
			
			with (enemy) {
				
				var ret_obj = instance_create_depth(x,y,depth,obj_enemy_held_subcon);
				with (ret_obj) event_perform_object(obj_enemyparent,ev_create,0);
				with (ret_obj) event_perform_object(other.object_index,ev_create,0);
				ret_obj.return_object = object_index;
				ret_obj.color = color;
				ret_obj.quick_throw = quick_throw;
				ret_obj.return_object_alt = thrown_object;
				ret_obj.sprite_index = deathsprite;
				ret_obj.swap_palette = swap_palette;
				ret_obj.vspd = 0;
				ret_obj.image_speed = 0;
				instance_destroy();
				
			}
			
			pull_object = ret_obj;
			
		}
		
	}
	
	if (crouching && grounded) {
		
		if (charge < 50)
		
			charge ++;
		
	}
	
	if (charge >= 50)
	
		pal += 0.5;
	
	if ((hspd != 0 || !grounded || swimming) || (!crouching && charge < 50))
	
		charge = 0;
	
}

if (vspd > 0)

	hit_block = false;

if (immunetimer > 0) {
	
	if ((global.moderneffects && !transforming) || (!global.moderneffects))
	
		image_alpha = choose(0,1);
	
	if (!global.frozen)
	
		immunetimer --;
	
	if (immunetimer <= 0) {
	
		image_alpha = 1;
		immunetimer = 0;
		immune = false;
		
	}
	
}

if (transformtimer > 0) {
	
	//If powering up...
	if (!poweringdown) {
	
		//And you were just small,
		if (lastpowerup == itemtype.id_small) {
			
			//Set the transform sprite animation
			if (!global.moderneffects) {
	
				sprite_index = player_anim("_transform");
				transform_index += 0.2;
				
			//Otherwise, if in modern mode, scale the player up
			} else {
				//If the animation just started, yoink the scale up by default
				if (powerupcheck)
				
					yscale = 0.8;
					
				//Stop animating the player
				image_speed = 0;
				
				//If you're below the full y-scale, scale up
				if (yscale < 1) {
					
					if (round(transformtimer%15) == 1) {
						
							yscale += 0.125;
							
					} else if (round(transformtimer%10) == 1) {
						
							yscale -= 0.05;
							
					}
					
					//Make sure it doesn't go above 1
					if (yscale >= 1)
					
						yscale = 1;
				
				}
		
			}
			
		}
			
		if (powerup == itemtype.id_flower) {
		
			image_speed = 0;
			pal += 0.5;
		
			if (pal > 5)
		
				pal = 0;
		
		}
		
	} else {
		
		if (lastpowerup == itemtype.id_subcon
		&& global.moderneffects) {
			
			image_speed = 0;
			
			if (!powerupcheck) {
			
				if (round(transformtimer%20) == 1) {
				
					sprite_index = lastsprite;
				
				} else if (round(transformtimer%10) == 1) {
				
					sprite_index = newsprite;
				
				}
				
			}
			
		} else if (powerup != itemtype.id_small) {
			
			image_speed = 0;
			
			if (round(transformtimer%20) == 1) {
				
				pal = returnpal;
				
			} else if (round(transformtimer%10) == 1) {
				
				pal = 0;
				
			}
			
		} else {
		
			if (transformtimer <= 40) {
		
				pal = 0;
		
			}
		
			if (!global.moderneffects) {
		
				if (transformtimer > 50) {
		
					//Store powerup for a quick powerup swap for animation
					var tmp = powerup;
					powerup = lastpowerup;
					
					//Set sprite
					sprite_index = player_anim("_"+item_name(powerup)+"_jump");
					
					//Reset powerup from temporary
					powerup = tmp;
					
				} else if (round(transformtimer%20) == 1) {
					
					//Store powerup for a quick powerup swap for animation
					var tmp = powerup;
					powerup = lastpowerup;
					
					//Set sprite
					sprite_index = player_anim("_"+item_name(powerup)+"_swim");
					
					//Reset powerup from temporary
					powerup = tmp;
					
				} else if (round(transformtimer%10) == 1) {
					//Set sprite
					sprite_index = player_anim("_small_swim");
				}
				
				image_index = 0;
		
			} else {
		
				if (powerupcheck)
				
					yscale = 1;
					
				image_speed = 0;
				
				if (yscale > 0.5) {
					
					if (round(transformtimer%15) == 1) {
						
						yscale -= 0.2;
							
					} else if (round(transformtimer%10) == 1) {
						
						yscale += 0.05;
							
					}
				
				} else yscale = 1;
			
			}
		
			if (image_index <= 0) {
			
				image_index = 0;
			
			}
		
		}
		
	}
	
	transformtimer --;
	
	if (transformtimer <= 0) {
		
		transform_index = 0;
		transformtimer = 0;
		transforming = false;
		poweringdown = false;
		global.frozen = false;
		
	}
	
} else yscale = 1;

if (dead) {

	xscale = abs(xscale);
	sprite_index = player_anim("_dead");
	
}

global.p_powerup[0] = powerup;
global.p_char[0] = char;

if (invincibletimer > 0) {
	
	invincibletimer --;
	
	if (invincible == false) {
		
		invincible = true;
		
	}
	
	if (invincibletimer <= 60) {
		
		invincibility_alpha -= 1/45;
		
	}
	
	if (invincibletimer <= 0) {
		
		invincible = false;
		
	} else if (invincibletimer <= 90) {
		
		pal += 0.1;
		
	} else {
		
		pal += 0.375;
		invincibility_alpha = 1;
		
	}
	
	if (pal >= sprite_get_width(asset_get_index("spr_pal_mario")))
	
		pal = 0;
	
} else {
	
	invincible_combo = 0;
	
}

if ((invincibletimer > 0)
|| (charge >= 50)
|| (powerup == itemtype.id_flower && !poweringdown && transformtimer > 0)) {
		
	var bottom_offset = 0;
			
	switch (obj_controller.currenttheme) {
				
		default:
			
			bottom_offset = 2;
			break;
			
		case (themetype.cave):
			
			bottom_offset = 5;
			break;
				
		case (themetype.castle):
			
			bottom_offset = 8;
			break;
				
		case (themetype.water):
			bottom_offset = 11;
			break;
				
	}
			
	if ((pal < bottom_offset) && ((pal >= 1 && powerup != itemtype.id_flower) || (pal >= 2 && powerup != itemtype.id_flower))) pal = bottom_offset;
		
	if (pal >= bottom_offset+3) {
			
		if (powerup != itemtype.id_flower)
			
			pal = 0;
				
		else
			
			pal = 1;
				
	}
	
	if (powerup != itemtype.id_flower && pal >= 1 && pal < bottom_offset) {
	
		pal = bottom_offset;
		
	}
		
}

if ((global.frozen || dead) && (powerupcheck == false || !global.moderneffects)) {
	
	if (!transforming)
	
		image_speed = 0;
		
	exit;
	
}

if (swimming) {

	if (bubbletimer > 0) {
	
		bubbletimer --;
	
		if (bubbletimer <= 0) {
		
			instance_create_depth(x+(sign(xscale)*6),bbox_top+2,depth,obj_bubble);
			bubblesleft --;
		
			if (bubblesleft == 0) {
			
				bubbletimer = 150;
				bubblesleft = 3;
			
			} else {
			
				bubbletimer = 50;
			
			}
		
		}
	
	}
	
}

if (!global.frozen) {
	
	returnpal = pal;
	lastpowerup = powerup;
	
}

if (!audio_is_playing(snd_pause)) && (!instance_exists(obj_pause)) {

	if (button_check_pressed(start)) {

		instance_create_depth(0,0,0,obj_pause);
	
	}
	
}

if (throw_timer > 0) {
	
	sprite_index = player_anim("_subcon_throw");
	throw_timer --;

} else if (pulling_up > 0) {
	
	sprite_index = player_anim("_subcon_hold_crouch");

} else if (pull_timer > 0) {

	pull_timer --;
	sprite_index = player_anim("_subcon_pull");
	
	if (pull_timer <= 0) {
		
		pulling_up = true;
		
	}

} else if (stunned > 0) {

	sprite_index = player_anim("_"+item_name(powerup)+"_idle");
	image_speed = 0.5;

} else if (swimming && !grounded) {
	
	if (shooting > 0)
	
		sprite_index = player_anim("_shoot");
		
	else {
	
		swim_index += 0.25;

		sprite_index = player_anim("_"+item_name(powerup)+"_swim");
	
		if (!button_check(abutton)) {
		
			if (swim_index >= sprite_get_number(sprite_index))
			&& (swimsleft > 0) {
			
				swimsleft --;
				swim_index = 0;
			
			} else if (swimsleft == 0 && swim_index >= 2) {
				
				swim_index = 0;
				
			}
		
		} else {
		
			if (swim_index >= 6) {
			
				swim_index = 0;
			
			}
		
		}
	
		image_index = swim_index;
	
	}

} else if (climbing) {
	
	sprite_index = player_anim("_"+item_name(powerup)+"_climb");
	
	if (y != yprevious) {
		
		if (button_check(up))
		|| (keyboard_check(down))
		|| (!controllable)
		
			image_speed = abs(vspd)/10;
			
		else {
			
			image_speed = 0;
			image_index = 0;
			
		}
		
	} else {
		
		image_speed = 0;
		image_index = 0;
		
	}

} else if (shooting > 0) {
	
	sprite_index = player_anim("_shoot");

} else if ((crouching && (global.moderneffects || (grounded || jumping))) && (powerup != itemtype.id_small || global.moderneffects)) {

	sprite_index = player_anim("_"+item_name(powerup)+"_crouch");
	image_index = 0;

} else if (grounded) {
	
	if (hspd == 0 && ((!button_check(right) && !button_check(left)) || button_check(down))) {
		
		sprite_index = player_anim("_"+item_name(powerup)+"_idle");
		wall_walking = false;
		
	} else {
		
		sprite_index = player_anim("_"+item_name(powerup)+"_walk");
		
		if (hspd != 0) {
		
			wall_walking = false;
			
			if (powerup != itemtype.id_subcon)
		
				image_speed = abs(hspd) / 6;
				
			else
			
				image_speed = abs(hspd) / 8;
			
			if (image_speed < 0.125)
			
				image_speed = 0.125;
			
		} else if (!global.moderneffects) {
		
			image_speed = 0.125;
			wall_walking = true;
			
		}
			
		else {
		
			sprite_index = player_anim("_"+item_name(powerup)+"_idle");
			image_speed = 0;
			
		}
	
	}
	
	if (powerup != itemtype.id_subcon) {
	
		if (((xscale > 0 && hspd < 0) || (xscale < 0 && hspd > 0))) {
		
			sprite_index = player_anim("_"+item_name(powerup)+"_skid");
		
			//if (global.smb2_mode)
		
				if (!audio_is_playing(snd_skid))
		
					audio_play_sound(snd_skid,0,0);
		
		}
		
	}
	
} else {
	
	if (jumping) {
			
		image_speed = 0;
		sprite_index = player_anim("_"+item_name(powerup)+"_jump");
		
		if (vspd > 1)
		
			image_index = 1;
			
		else
		
			image_index = 0;
		
	} else {
	
		sprite_index = player_anim("_"+item_name(powerup)+"_walk");
		image_speed = 0;
		
		if (crouching) {
		
			if (vspd > 1)
		
				image_index = 1;
			
			else
		
				image_index = 0;
		
			image_index = 0;
			
			if (powerup == itemtype.id_subcon) {
				
				sprite_index = player_anim("_"+item_name(powerup)+"_crouch");
				
			}
			
		}
		
	}
	
}

if ((climbing) || (swimming && !grounded)) {
	
	tail_index = 2;
	tail_y_offset = -3;
	tail_x_offset = 2;
		
	if (powerup == itemtype.id_small && climbing) {
		
		tail_x_offset = 0;
		tail_y_offset = 1;
		
	}

} else if (!grounded) {
	
	if (vspd < 0) {
		
		if (tail_index < 3) {
			
			if (tail_index < 1)
			
				tail_index = 3;
			
			else tail_index += 0.25;
			
		} else
	
			tail_index = 3;
		
	} else if (tail_index == 3) {
		
		tail_index = 1;
		
	} else if (tail_index < 2) {
		
		tail_index += 0.25;
		
		if (tail_index >= 2) {
			
			tail_index = 2;
			
		}
		
	}
	
	if (jumping) {
	
		tail_x_offset = -1;
		tail_y_offset = 3;
		
	} else {
		
		if (tail_index >= 0 && tail_index <= 1) {
		
			tail_y_offset = -3;
		
		} else {
		
			tail_y_offset = 0;
		
		}
	
		tail_x_offset = 0;
	
	}
	
} else if ((grounded) && (abs(hspd) > 0.25 || wall_walking) && (x != xprevious || wall_walking)) {
	
	if (((xscale > 0 && hspd < 0) || (xscale < 0 && hspd > 0)) && !wall_walking) {
	
		tail_index += clamp(abs(hspd)/6,0.5,abs(hspd)/6);
	
	} else if (!wall_walking) {
		
		tail_index += abs(hspd)/6;
		
	} else {
		
		tail_index += 0.125;
		
	}
	
	if (tail_index >= 3) {
		
		tail_index = 0;
		
	}
	
	if (tail_index >= 0 && tail_index <= 1) {
		
		tail_y_offset = -3;
		
	} else {
		
		tail_y_offset = 0;
		
	}
	
	tail_x_offset = 0;
	
} else {
	
	if (tail_index > 2) { tail_index = 2; }
	
	else if (tail_index > 0) { tail_index -= 0.125; }
	
	else tail_index = 0;
	
	tail_x_offset = 0;
	tail_y_offset = 0;
	
}

if (powerupcheck)

	newsprite = sprite_index;

powerupcheck = false;

if (cooldown > 0)

	cooldown --;