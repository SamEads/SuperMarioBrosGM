if (done) exit;

if (flag_color == -1) {
	
	flag_color = image_index;
	
} else {
	
	if (obj_controller.currenttheme == themetype.snow) {
		
		image_index = 1;
		
	} else if (obj_controller.currenttheme == themetype.desert) {
		
		image_index = 2;
		
	} else {
		
		image_index = flag_color;
		
	}
	
}

if (player) {
	
	player.immune = true;
	player.holding = false;
	
	if (!instance_exists(player)) {
		
		player = noone;
		exit;
		
	}
	
	if (player.climbing) {
		
		global.levelcleared = true;
		
		if (global.current_file != -1) {
	
			var _extra = "";
	
			if (global.hardmode)
	
				_extra = "h";
	
			ds_map_replace(global.unlocked_worldlevel,"w"+string(global.world)+_extra,1);
			ds_map_replace(global.unlocked_worldlevel,"w"+string(global.world)+"l"+string(global.level)+_extra,1);
	
		}
	
		obj_controller.stopmusic = true;
	
		if (fireworkscalculated == false) {
		
			playeryhit = (round((y-player.y-16)/10))*10;
		
			if (playeryhit < 10) {
			
				global.points += 100;
				pointdisp = 100;
			
			} else if (playeryhit < 60) {
			
				global.points += 400;
				pointdisp = 400;
			
			} else if (playeryhit < 90) {
			
				global.points += 800;
				pointdisp = 800;
			
			} else if (playeryhit <= 120) {
			
				global.points += 2000;
				pointdisp = 2000;
			
			} else {
				
				if (global.moderneffects) {
					
					audio_play_stop_sound(snd_1up,0,0);
					global.p_lives[player.char] ++;
					pointdisp = -1;
					
				} else {
				
					global.points += 5000;
					pointdisp = 5000;
			
				}
			
			}
		
			with instance_create_depth(x,y,depth,obj_points_flag) myflag = other.id;
		
			var num = string_char_at(string(global.time),string_length(string(global.time)-1));
		
			if (num == 1 || num == 3 || num == 6) {
			
				fireworksleft = num;
			
			}
		
			fireworkscalculated = true;
			
			if (!global.moderneffects) {
			
				with (obj_bulletbill)
			
					if (cannon_bill)
				
						instance_destroy();
						
				with (obj_enemy_held_subcon) {
				
					instance_destroy();
					effect_create(spr_smoke_large,0.25,x,y);
					
				}
					
			} else {
				
				combo = 0;
				
				with (obj_enemy_parent) {
					
					instance_destroy();
					other.combo ++;
					effect_create(spr_smoke_large,0.25,x,y);
					hit_combo(other.combo,other.combo,false,other.player.char);
					
				}
				
				with (obj_enemy_held_subcon) {
					
					instance_destroy();
					other.combo ++;
					effect_create(spr_smoke_large,0.25,x,y);
					hit_combo(other.combo,other.combo,false,other.player.char);
					
				}
				
			}
			
		}
		
	}
	
	if (endsequence == 2) {
		
		if (timer > 0) {
			
			timer --;
			
			if (timer == 0) {
				
				if (player.powerup != itemtype.id_subcon)
				
					audio_play_stop_sound(mus_courseclear,0,0);
					
				else {
				
					audio_play_stop_sound(bgm_courseclear_subcon,0,0);
					alt_jingle = true;
					
				}
					
				startendcountdown = true;
				
			}
			
		}
	
		player.climbing = false;
		
		var early_exit = false;
		
		with (player) {
			
			if collision_rectangle(x-8,y,x-8,y,obj_early_castle_exit,0,0) {
				
				early_exit = true;
				
			}
			
		}
		
		if ((((player.x >= x + 105) || (player.hspd == 0)) && (create_exit)) || (early_exit)) {
			
			if (early_exit)
			
				flag_x = instance_nearest(x,y,obj_early_castle_exit).x;
			
			with (player) {
				
				if (!global.moderneffects) {
					
					visible = false;
					
				} else {
					
					depth = 25;
					
				}
				
			}
			
			target_x = player.x+16;
			endplayer = player.id;
			player.follow_player = false;
			player = noone;
			
			endsequence = 3;
			exit;
			
		}
		
		if (player.grounded) {
			
			player.xscale = 1;
			
			if (player.hspd < 1.5625)
			
				player.hspd += 0.05;
			
			else player.hspd = 1.5625;
			
		} else if (player.hspd < 1.5625) {
			
			player.hspd += 0.037109375;
			
		}
	
	} else if (player != noone) {
		
		if (player.vine == id) {
		
			if (endsequence == 0) {
			
				endsequence = 1;
				audio_play_stop_sound(snd_flag,0,0);
			
			}
		
			if (flag_y < -18) {
		
				player.climbing = true;
		
				if (player.bbox_bottom < bbox_bottom-2) {
		
					player.controllable = false;
					player.y += 2;
					player.vspd = 2;
			
				} else {
				
					player.grounded = true;
					player.vspd = 0;
					player.grav = 0;
					player.hspd = 0;
				
				}
			
				flag_y += 2;
			
			} else {
			
				player.xscale = -1;
				player.x = round((bbox_left+bbox_right)/2) + 7;
			
				if (timer == 0) {
				
					timer = 16;
				
				} else timer --;
			
				if (timer <= 0) {
				
					if (player.bbox_bottom < bbox_bottom-2) {
				
						player.x += 4;
						player.hspd = 0.5;
						player.jumping = false;
						player.vspd_cap = 3;
						player.vspd = 0.1;
					
					} else {
				
						player.grounded = true;
						player.hspd = 0.15625;
						
					}
					
					player.vine = noone;
					player.vinecooldown = 8;
					player.climbing = false;
					player.crouching = false;
					player.controllable = false;
					endsequence = 2;
					timer = 10;
				
				}
			
			}
		
		}
		
	}
	
} else {
	
	if (!global.levelcleared)
	
		player = instance_place(x,y,obj_player);
	
	if (player) {
		
		if (player.hspd > 0) {
			
			player.xscale = 1;
			
		} else if (player.hspd < 0) {
			
			player.xscale = -1;
			
		}
		
	}
	
}
	
if (endsequence == 3) {
	
	if (endplayer) {
		
		endplayer.manual_y_offset = -1;
		
		if (endplayer.x >= target_x-1-endplayer.hspd) {
			
			endplayer.hspd = 0;
			endplayer.visible = false;
			
		}
		
	}
	
	if (global.time > 0) {
			
		var point_mod = 1;
			
		if (alt_jingle && global.time > 10) {
				
			point_mod = 1;
				
		}
		
		global.time -= 1*point_mod;
		global.points += 50*point_mod;
		
		if (!audio_is_playing(snd_beep))
		
			audio_play_sound(snd_beep,0,1);
		
	} else {
		
		audio_stop_sound(snd_beep);
		
		if (endplayer.hspd == 0 || endplayer.visible = false) {
			
			endsequence = 4;
			castleflag = instance_create_depth(flag_x,y-60,150,obj_flag_castle);
			
		}
		
	}
	
}

if (endsequence == 4 && songlengthtimer <= 0) {
	
	if (castleflag.y <= castleflag.ystart - 20) {
		
		if (fireworksleft > 0) {
		
			fireworktimer --;
		
			if (fireworktimer <= 0) {
			
				var _x = 0;
				var _y = 0;
			
				if (fireworkpos = 0) {
				
					_x = 80;
					_y = 136;
				
				} else if (fireworkpos = 1) {
				
					_x = 56;
					_y = 88;
				
				} else if (fireworkpos = 2) {
				
					_x = 152;
					_y = 72;
				
				}
			
				fireworkpos ++;
			
				if (fireworkpos > 2)
			
					fireworkpos = 0;
			
				instance_create_depth(x+_x+(flag_x-x-96),y-_y,10,obj_firework);
				fireworktimer = 30;
				fireworksleft --;
			
			}
			
		} else {
			
			levelendtimer --;
			
			var k = global.level+1;
			
			if (levelendtimer <= 0 && songlengthtimer <= 0) {
				
				for (var i = global.world; i < array_height_2d(global.worldlevel); i ++) {
		
					for (var j = 1; j < array_length_2d(global.worldlevel,i); j ++) {
		
						if ((k == j) && (!done)) {
							
							obj_controller.levelstart = 160;
							global.dest = global.worldlevel[i,k];
							obj_controller.fadetimer = 15;
							global.level = j;
							global.world = i;
							done = true;
							global.savegame = true;
							exit;
							
						}
			
					}
					
					k = 1;
	
				}
				
			}
			
		}
		
	}
	
}

if (instance_exists(obj_early_castle_exit)) {
	
	mycastle.x = obj_early_castle_exit.x+8;
	mycastle.y = obj_early_castle_exit.y+16;
	
} else {
	
	mycastle.x = x+104;
	mycastle.y = y+16;
	
}

if (startendcountdown)

	songlengthtimer --;