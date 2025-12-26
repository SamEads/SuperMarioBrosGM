/// @description Main player movement

if (grav == 0 && physics)

	grav = 0.15625;

if (global.debugmode) {

	if keyboard_check(vk_numpad1)

		char = chara.mario;

	if keyboard_check(vk_numpad2)

		char = chara.luigi;

	if keyboard_check(vk_numpad3)

		char = chara.toad;
	
	if keyboard_check(vk_numpad4)

		char = chara.toadette;
		
	if keyboard_check(vk_numpad5)

		char = chara.custom;
		
}
		
if (global.debugmode) {

	if keyboard_check(ord("1"))

		powerup = itemtype.id_small;
	
	if keyboard_check(ord("2"))

		powerup = itemtype.id_big;
	
	if keyboard_check(ord("3"))

		powerup = itemtype.id_flower;
		
	if keyboard_check(ord("4"))

		invincibletimer = 12*60;
		
	if keyboard_check_pressed(ord("5"))
	
		powerup = itemtype.id_subcon;
	
}

if (global.debugmode) {

	if (keyboard_check_pressed(ord("N"))) {
	
		if (!noclip) {
	
			noclip = true;
		
		} else {
		
			noclip = false;
			immune = false;
		
		}
	
	}
	
}

if (controllable && !warping && !global.frozen) {
	
	if (instance_exists(obj_controller))
	
		obj_controller.showtime = true;
		
	global.freezetime = false;
		
}

if (!controllable)

	spintimer = 0;

if (warping)

	controllable = false;

if (noclip) {
	
	hspd = 0;
	vspd = 0;
	grav = 0;
	immune = true;
	image_index = 0;
	
	var spd = 4;
	
	if keyboard_check(ord("Z"))
	
		spd = 12;
	
	if button_check(right) {
		
		x += spd;
		
	} else if button_check(left) {
		
		x -= spd;
		
	}
	
	if button_check(up) {
		
		y -= spd;
		
	} else if button_check(down) {
		
		y += spd;
		
	}
	
}

if (dead) {
	
	deathtimer ++;
	
	if (deathtimer >= 47 && !global.moderneffects || deathtimer >= 30 && global.moderneffects) {
		
		if (grav != 0.2) {
		
			if (bbox_top < obj_controller.set_height)
		
				vspd = -5;
				
			grav = 0.2;
			
		} else {
			
			vspd += grav;
			
			if (vspd > 4)
			
				vspd = 4;
			
			y += vspd;
			
		}
		
	}
	
	if (((deathtimer >= 200 && !altdeath) || (deathtimer >= 150 && altdeath)) && obj_controller.fadetimer <= 0) {
		
		if (global.p_lives[char] <= 0 && global.gameover == false) {
			
			if (deathtimer >= 220) {
			
				global.p_lives[char] = obj_controller.default_lives;
				with (obj_controller) event_user(4);
				obj_controller.fade_dir = -1;
				obj_controller.fade_out = 0.05;
				
			} else if (deathtimer <= 180) {
				
				obj_controller.fade_dir = 1;
				obj_controller.fade_in = 0.05;
				
			}
			
		} else if (global.gameover == false) {
			
			with (obj_controller) event_user(2);
			obj_controller.fadetimer = 15;
			
		}
			
	}
	
}

if (!invincible && !transforming && charge < 50) {
	
	if (powerup == itemtype.id_flower) {

		pal = 1;
	
	} else {

		pal = 0;
		
	}
		
}

if (global.frozen || noclip || warping || dead) exit;

if (cooldown > 0)

	cooldown --;

//Movement speed variables
var _hsp_max = 1.5625;
var _hsp_decel = 0.05078125;
var _hsp_accel = 0.037109375;
var _hsp_decel_skid = 0.1015625;

if (invincibletimer <= 0 || !global.moderneffects)

	var _hsp_max_run = 2.5625;
	
else if (invincibletimer > 0 && global.moderneffects)

	var _hsp_max_run = 3;
	
var _hsp_accel_run = 0.0556640625;
var _hsp_max_walk = _hsp_max;
var _hsp_accel_air = _hsp_accel;
var _hsp_accel_air_run = _hsp_accel_run;
var _skid_turnaround = 0.5625;
var _grav_up_slow = 0.125;
var _grav_up_mid = 0.1171875;
var _grav_up_high = 0.15625;
var _grav_down_slow = 0.4375;
var _grav_down_mid = 0.375;
var _grav_down_high = 0.5625;

var _low_jump = 4.125;
var _high_jump = 5.125;

if (char == chara.luigi && (global.smb2_mode)) {
	
	_hsp_decel = 0.0390625;
	_hsp_accel = 0.025390625;
	_hsp_decel_skid = 0.06;
	_hsp_accel_run = 0.0439453125;
	_hsp_accel_air = 0.025390625;
	_hsp_accel_air_run = 0.0439453125;
	_grav_up_slow = 0.11;
	_grav_up_mid = 0.1;
	_grav_up_high = 0.14;
	_grav_down_slow = 0.265625;
	_grav_down_mid = 0.2421875;
	_grav_down_high = 0.36328125;
	
}

if (powerup == itemtype.id_small || crouching)

	mask_index = spr_mario_small_idle;
	
else

	mask_index = spr_mario_big_idle;

if ((button_check(bbutton) || runcooldown > 0) && (!swimming)) {
	
	if button_check(bbutton)
	
		runcooldown = 10;
		
	else if (runcooldown > 0)
	
		runcooldown --;
		
	if (running || grounded) {
	
		_hsp_max = _hsp_max_run;
		_hsp_accel = _hsp_accel_run;
		
	}
	
	if (((grounded && !global.moderneffects) || (global.moderneffects)) && (abs(hspd) >= 1.5625))
	
		running = true;
	
	if (grounded && abs(hspd) < 1.5625)
	
		running = false;
	
} else if (grounded || swimming) {
	
	running = false;
	
}

if (global.moderneffects) {
	
	_low_jump = 4.125+(abs(hspd)/5);
	_high_jump = _low_jump;
	
}

if (instance_place(x,y,obj_vine) && (!holding)) {
	
	vine = instance_place(x,y,obj_vine);
	
	if (vinecooldown <= 0) {
	
		if ((hspd > 0 || (xscale == 1 && !climbing)) && x < vine.bbox_left)
		|| ((hspd < 0 || (xscale == -1 && !climbing)) && x > vine.bbox_right) {
	
			climbing = true;
			jumping = false;
			vine = instance_place(x,y,obj_vine);
			vinecooldown = 4;
		
		}
		
	}
	
} else if (climbing) {
	
	if (button_check(up)) {
		
		grav = 0.1;
		vspd = -1;
	
	}
	
	vinecooldown = 6;
	vine = noone;
	climbing = false;
		
}

if (climbing) {
	
	hspd = 0;
	grav = 0;
	crouching = false;
	
	if (vinecooldown > 0) {
		
		vinecooldown --;
		
	} else if (controllable) {
		
		if button_check_pressed(right) {
			
			if (xscale > 0) {
				
				xscale = -abs(xscale);
				
			} else {
				
				climbing = false;
				vine = noone;
				hspd = 0;
				x += 4;
				//vinecooldown = 10;
				
			}
			
		} else if button_check_pressed(left) {
			
			if (xscale < 0) {
				
				xscale = abs(xscale);
				
			} else {
				
				climbing = false;
				vine = noone;
				hspd = 0;
				x -= 4;
				
			}
			
		}
		
	}
	
	if (vine != noone) {
	
		if (xscale > 0) {
		
			x = round((vine.bbox_left+vine.bbox_right)/2) - 6;
		
		} else if (xscale < 0) {
		
			x = round((vine.bbox_left+vine.bbox_right)/2) + 7;
		
		}
	
		vspd = vine.vspd;
		
	}
	
	if (controllable) {

		if button_check(up) {
			
			vspd = -0.875;
		
			if !instance_place(x,y,obj_vine) {
		
				climbing = false;
				
			}
		
		} else if button_check(down) {
		
			vspd += 2;
		
		}
		
	}
	
	if (vine != noone) {
	
		if (vine.vspd == 0) {
	
			if (collision_rectangle(bbox_left,bbox_top-24,bbox_right,bbox_bottom,obj_vine_warp,0,0)) {
		
				controllable = false;
				vspd = -1;
		
			}
		
		}
		
	}
	
} else {
	
	if (vinecooldown > 0)
	
		vinecooldown --;
		
	if (mount == noone) {
	
		if (instance_number(obj_fireball) < 2) {

			if (button_check_pressed(bbutton) && shooting == 0 && !crouching && powerup == itemtype.id_flower) {
	
				shooting = 1;
				audio_play_stop_sound(snd_fireball,0,0);
	
				with instance_create_depth(x+(sign(xscale)*2),y-8,depth+1,obj_fireball) {
		
					hspd = 4*sign(other.xscale);
					grav = other.grav;
					vspd = 3;
					vspd_cap = 2.5;
					shooter = other.id;
		
				}
	
			}

		}
		
	}

	if (shooting > 0) {
	
		shooting ++;
	
		if (shooting >= 8)
	
			shooting = 0;
		
	}

	if (grounded) {
		
		combo = 0;
	
		if ((button_check(down) && shooting == 0) && ((!button_check(right) && !button_check(left) && (powerup != itemtype.id_small)) || (global.moderneffects))) {
		
			crouching = true;
		
		} else {
		
			crouching = false;
		
		}
	
	}

	if (spintimer > 0)
	
		spintimer --;

	if (button_check(right) && (grounded && !button_check(down) || !grounded)) {
	
		if (grounded || swimming || powerup == itemtype.id_subcon)
	
			xscale = abs(xscale);
	
		if (grounded) {
		
			//Accelerate
			if (hspd >= 0) {
			
				if (hspd < _hsp_max && !swimming) || (hspd < 1.0625 && swimming)
	
					hspd += _hsp_accel;
				
			} else {
			
				running = false;
				hspd += _hsp_decel_skid;
				
				if (hspd > -_skid_turnaround)
				
					hspd = 0;
			
			}
			
			//Decelerate over max height
			if ((hspd > _hsp_max+_hsp_decel) && !swimming) || ((hspd > 1.0625+_hsp_decel) && swimming)
		
				hspd -= _hsp_decel;
			
		} else if (!global.moderneffects) {
		
			if (hspd < 0 || xscale == -1) {
		
				if (hspd < _hsp_max)
				
					hspd += _hsp_accel_air_run;
				
			} else if (!running && (jumping || vspd < 0)) {
	
				hspd += _hsp_accel_air;
			
				if (hspd >= _hsp_max_walk)
			
					hspd = _hsp_max_walk;
			
			} else {
		
				hspd += _hsp_accel_air_run;
				
				if (hspd >= _hsp_max_walk && !running)
			
					hspd = _hsp_max_walk;
			
				else if (hspd >= _hsp_max_run)
			
					hspd = _hsp_max_run;
			
			}
		
		} else {
			
			if (button_check(bbutton)) {
			
				if (hspd < _hsp_max) {
			
					hspd += _hsp_accel_air_run;
					
					if (hspd >= _hsp_max)
				
						hspd = _hsp_max;
					
				}
				
			} else {
				
				if (hspd < _hsp_max) {
			
					hspd += _hsp_accel_air;
					
					if (hspd >= _hsp_max)
					
						hspd = _hsp_max;
				
				}
					
			}
		
		}
	
	} else if (button_check(left) && (grounded && !button_check(down) || !grounded)) {
	
		if (grounded || swimming || powerup == itemtype.id_subcon)
	
			xscale = -abs(xscale);
	
		if (grounded) {
	
			//Accelerate
			if (hspd <= 0) {
		
				if ((hspd > -_hsp_max && !swimming) || (hspd > -1.0625 && swimming))
	
					hspd -= _hsp_accel;
				
			} else {
			
				hspd -= _hsp_decel_skid;
				
				if (hspd < _skid_turnaround)
				
					hspd = 0;
			
			}
			
			//Decelerate over max height
			if ((hspd < -_hsp_max-_hsp_decel && !swimming) || (hspd < -1.0625-_hsp_decel && swimming))
		
				hspd += _hsp_decel;
		
		} else if (!global.moderneffects) {
		
			if (hspd > 0 || xscale = 1) {
		
				if (hspd > -_hsp_max)
		
					hspd -= _hsp_accel_air_run;
		
			} else if (!running && (jumping || vspd < 0)) {
	
				hspd -= _hsp_accel_air;
			
				if (hspd <= -_hsp_max_walk)
			
					hspd = -_hsp_max_walk;
			
			} else {
		
				hspd -= _hsp_accel_air_run;
				
				if (hspd <= -_hsp_max_walk && !running)
			
					hspd = -_hsp_max_walk;
					
				else if (hspd <= -_hsp_max_run)
			
					hspd = -_hsp_max_run;
			
			}
		
		} else {
			
			if (button_check(bbutton)) {
			
				if (hspd > -_hsp_max) {
			
					hspd -= _hsp_accel_air_run;
					
					if (hspd <= -_hsp_max)
				
						hspd = -_hsp_max;
					
				}
				
			} else {
				
				if (hspd > -_hsp_max) {
				
					hspd -= _hsp_accel_air;
					
					if (hspd <= -_hsp_max)
					
						hspd = -_hsp_max;
					
				}
				
			}
			
		}
	
	} else if (controllable) {
	
		//Handle deceleration based on if you're on the ground or not
		if (grounded) {
		
			if (sign(xscale) == sign(hspd)) {
	
				hspd -= (sign(hspd)*_hsp_decel);
	
			    if (abs(hspd) <= _hsp_decel) {
        
			        hspd = 0;
            
			    }
			
			} else {
			
				hspd -= (sign(hspd)*_hsp_decel_skid);
	
			    if (abs(hspd) <= _hsp_decel_skid) {
        
			        hspd = 0;
            
			    }
			
			}
		
		}
	
	}

	#region Jumping and gravity

	if (grounded && !swimming && canjump) {

		if (button_check_pressed(abutton)) {
			
			grav = 0;
			
			if (global.moderneffects)
			
				calculate_new_gravity = true;
		
			if (powerup == itemtype.id_small)
		
				audio_play_stop_sound(snd_jump_small,0,0);
			
			else if (powerup == itemtype.id_subcon)
			
				audio_play_stop_sound(snd_jump_subcon,0,0);
			
			else
		
				audio_play_stop_sound(snd_jump,0,0);
	
			jumprelease = false;
			
			if (charge >= 50) {
			
				vspd = -5;
				charge = 0;
				crouching = false;
	
			} else if (abs(hspd) <= _hsp_max_walk)
	
				vspd = -_low_jump;
			
			else
		
				vspd = -_high_jump;
			
			grounded = false;
	
			jumping = true;
	
		}
	
	}
	
	if (swimming) {
		
		if (!grounded)
		
			crouching = false;
		
		if (button_check_pressed(abutton)) {
			
			swimsleft = 2;
			
			jumping = true;
			
			grounded = false;
			
			jumprelease = false;
			
			grav = 0;
			
			if (!global.moderneffects) {
				
				if (instance_place(x,bbox_top-24,obj_liquid)) {
			
					vspd = -1.5;
					audio_play_stop_sound(snd_stomp,0,0);
					
				}
				
				if (instance_place(x,y,obj_whirlpool))
				
					vspd *= 1;
				
			} else {
				
				audio_play_stop_sound(snd_stomp,0,0);
				
				if (!instance_place(x,y,obj_whirlpool))
				
					vspd -= 1.5;
					
				else
				
					vspd = -1.5;
				
				if (button_check(down)) {
					
					vspd += 0.5;
					
				}
				
			}
			
		}
		
	}

	if (vspd >= 0 && grounded)

		jumping = false;

	if (!button_check(abutton))

		jumprelease = true;
		
	if (jumptimer > 0) {
		
		jumptimer --;
		jumprelease = false;
		
		if (jumptimer == 0) {
			
			jumptimer = -1;
			jumprelease = true;
			calculate_new_gravity = true;
			
		}
		
	}
		
	if (swimming && !grounded) {
		
		if (!jumprelease && vspd <= 0) {
			
			grav = 0.05078125;
			
		} else {
			
			grav = 0.0390625;
			
		}

	} else if (!grounded) {
		
		if (!global.moderneffects) {
		
			if (!jumprelease && vspd <= 0) {
		
				if (grav == 0) {
		
					if (abs(hspd) <= 1) {
					
						grav = _grav_up_slow;
					
					} else if (abs(hspd) <= _hsp_max_walk) {
					
						grav = _grav_up_mid;
			
					} else {
			
						grav = _grav_up_high;
			
					}
				
					calculate_new_gravity = true;
			
				}
		
			} else if (calculate_new_gravity) {
		
				if (grav < _grav_down_mid) {
		
					if (abs(hspd) <= 1) {
					
						grav = _grav_down_slow;
			
						if (vspd < -4)
					
							vspd = -4;
			
					} else if (abs(hspd) <= _hsp_max_walk) {
					
						grav = _grav_down_mid;
			
						if (vspd < -4)
					
							vspd = -4;
			
					} else {
					
						grav = _grav_down_high;
			
					}
			
				}
		
			}
		
		} else {
		
			if (!jumprelease && vspd < -1) {
			
				grav = 0.1171875;
			
			} else {

				grav = 0.375;

			}
			
		}
		
	}

	#endregion

}

#region Camera catch

if (hspd < 0) {

	if (x-8 < camera_get_view_x(view_camera[0])) {

		hspd = 0;
	
	}
	
}

if (hspd > 0) {

	if (x+8 > (camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]))) {

		hspd = 0;
	
	}
	
}

#endregion

if (swimming && global.moderneffects) {
	
	if (button_check(down)) {
		
		if (vspd < -1) {
			
			vspd = -1;
			
		}
		
	} else {
		
		if (vspd < -1.5) {
			
			vspd = -1.5;
			
		}
		
	}
	
}

if (instance_place(x,y,obj_liquid)) {
	
	if (!swimming) {
	
		swimming = true;
		hspd /= 2;
		vspd /= 2;
		
	}
	
	if (vspd < 0) {
	
		if (!collision_rectangle(x,bbox_top,x,bbox_top,obj_liquid,false,false)) {
			
			if (instance_place(x,y,obj_liquid))
			&& (!instance_place(x,y,obj_liquid_stick)) {
			
				if (!button_check(up)) {
			
					vspd = 0;
				
				} else {
				
					vspd = -4;
				
				}
				
			} else if (instance_place(x,y,obj_liquid_stick)) {
				
				if (global.moderneffects || powerup == itemtype.id_small) {
				
					while (!collision_rectangle(x,bbox_top,x,bbox_top,obj_liquid,false,false))
				
						y ++;
				
					vspd = 0;
					
				} else {
					
					var clearspd = false;
					
					while (!collision_rectangle(x,y-abs(vspd),x,y-abs(vspd),obj_liquid,false,false)) {
				
						y ++;
						clearspd = true;
						
					}
					
					if (clearspd)
					
						vspd = 0;
						
				}
				
			}
			
		}
		
	}
	
} else if (swimming) {
	
	swimming = false;
	grav = 0;
	
}

if (!warping && physics) {
	
	var current_vspd = vspd;
	
	if (global.moderneffects && grounded)
			
		calculate_new_gravity = true;

	physics_collision(false,false,extra_y,true);
	
	var platform = collision_rectangle(bbox_left-1,bbox_top-4,bbox_right+1,bbox_bottom+4+abs(vspd),obj_movingplatform,0,0);

	with (platform) {

		rider = (collision_rectangle(bbox_left-1, bbox_top-1-abs(vspd), bbox_right+1, bbox_bottom+abs(vspd)+4, other.id, 0, 0));

		if (rider) {
	
			if (!global.moderneffects) {
		
				if ((rider.vspd < 0) && (rider.bbox_top > bbox_top)) {
			
					rider.vspd = 0;
					audio_play_stop_sound(snd_bump,0,0);
			
					while (rider.bbox_top < bbox_bottom) {
				
						rider.y ++;
				
					}
			
				}
		
				if (rider.hspd > 0 && !rider.grounded) {
		
					if (rider.bbox_right-abs(rider.hspd) <= bbox_left) {
				
						rider.hspd = 0;
			
						while (rider.bbox_right >= bbox_left) {
				
							rider.x --;
				
						}
			
					}
			
				} else if (rider.hspd < 0 && !rider.grounded) {
		
					if (rider.bbox_left+abs(rider.hspd) >= bbox_right) {
				
						rider.hspd = 0;
			
						while (rider.bbox_left <= bbox_right) {
				
							rider.x ++;
				
						}
			
					}
			
				}
		
			}
			
			if (rider.vspd >= 0)
			&& (rider.bbox_right >= bbox_left)
			&& (rider.bbox_left <= bbox_right)
			&& (rider.bbox_bottom < bbox_top+4)
			&& (!rider.dead) {
				
				if (global.moderneffects)
				
					rider.y = y-16;
					
				else
				
					rider.y = bbox_top-16;
			
				if (rider.x > camera_get_view_x(view_camera[0])+8)
				&& (rider.x < room_width-8) {
			
					rider.x += x-xprevious;
				
				}
				
				rider.grounded = true;
				rider.vspd = 0;
				rider.grav = 0;
					
			}
			
		}

	}
	
	if (jumping && global.moderneffects) {
		
		if (current_vspd < 0 && vspd >= 0) {
		
			if (crouching) {
				
				if (!collision_rectangle(bbox_left-abs(hspd),bbox_top-8,bbox_right+abs(hspd),bbox_top,obj_solid,0,0)) {
			
					if (!keyboard_check(down)) {
				
						crouching = false;
						jumping = false;
						image_index = 1;
					
					}
				
				}
				
			}
			
		}
		
	}
	
} else if (!physics) {

	vspd += grav;
	x += hspd;
	y += vspd;
	
}

if (physics) {

	if (grounded && collision_line(bbox_left+1,bbox_top+3,bbox_right-1,bbox_top+3,obj_solid,0,0)) {
	
		x ++;
		
		if (!wall_walking)
		
			inwall = true;
			
		else
		
			inwall = false;
	
	} else inwall = false;
	
}

if (shaketimer > 0) {
	
	shaketimer --;
	hspd = 0;
	crouching = false;
	stunned = true;
	
	if (shaketimer <= 0) {
	
		controllable = true;
		stunned = false;
		
	}
	
}

if (instance_exists(obj_controller)) {

	if (y-18 > obj_controller.set_height) {
	
		if (distance_to_object(obj_touch_warp) > 32)
	
			event_user(2);
	
	}
	
}

if (vspd > 4)

	vspd = 4;