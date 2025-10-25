scr_buttons();

if (!global.moderneffects)

	cam_hspd = 1.5625;
	
else

	cam_hspd = 1.6;

if (active) {
	
	//Activate the end timer
	if (camera_get_view_x(view_camera[0]) >= room_width-camera_get_view_width(view_camera[0])) {
	
		//Start incrementing the end timer
		endtimer ++;
		
		//Show the thank you text right when the camera gets to the end if default Toad/is Peach
		if (!do_toad_animation || toad == 0 || peach == true)
		
			show_thankyou = true;
		
	}
	
	//If the NPC is not set to Peach, go through with one of the set Toad animations
	if (!peach) {
	
		var _toad = 0;
	
		if (do_toad_animation)
		
			_toad = toad;
	
		switch (_toad) {
			
			#region Default (SMBDX) Toad
			
			default:
	
				if (do_toad_animation && endtimer > 0) {
	
					if (endtimer%110 == 1 || endtimer == 5) {
		
						if (toadjump == 0) {
			
							vspd = -3;
							grav = 0.2;
			
						}
		
					}
		
					vspd += grav;
					toadjump += vspd;
		
					if (toadjump >= 0) {
			
						toadjump = 0;
						vspd = 0;
						grav = 0;
			
					}
		
					toadindex += 0.125;
		
				} else {
			
					toadindex = 0;
					toadjump = 0;
			
				}
				
				break;
				
			#endregion
				
			#region Castle 1 Toad
				
			case (1):
			
				if (bag_sprite == spr_bag) {
				
					draw_toad = false;
					bag_index += 0.125;
					
					if (bag_index > 25) {
						
						bag_index = 0;
						bag_sprite = spr_bag_opening;
						draw_toad = true;
						show_thankyou = true;
						toadjump = -1;
						
					}
					
				} else {
					draw_toad = true;
					bag_sprite = spr_bag_opening;
					
					if (bag_index > 2) {
						
						toad_timer ++;
						
						if (toad_timer%110 == 1 || toad_timer == 5) {
		
							if (vspd == 0) {
			
								vspd = -3;
								grav = 0.2;
			
							}
		
						}
						
						if (vspd > 0)
						
							bag_position = -1;
		
						vspd += grav;
						toadjump += vspd;
		
						if (toadjump >= 0) {
			
							toadjump = 0;
							vspd = 0;
							grav = 0;
			
						}
		
						toadindex += 0.125;
						
					} else bag_index += 0.075;
					
				}
				
				break;
				
			#endregion
				
			#region Castle 2 Toads
				
			case (2):
			
				if (bag_sprite == spr_bag) {
				
					draw_toad = false;
					bag_index += 0.125;
					
					if (bag_index > 25) {
						
						bag_index = 0;
						bag_sprite = spr_bag_opening;
						draw_toad = true;
						show_thankyou = true;
						toadjump = -1;
						
					}
					
				} else {
				
					toad_timer ++;
					draw_toad = true;
					bag_sprite = spr_bag_opening;
					
					if (bag_index > 2) {
						
						if (vspd == 0 && toadjump == -1) {
							
							vspd = -3;
							grav = 0.2;
							toadindex = 1;
							
						} else if (grav == 0) {
							
							toadindex = 0;
							
						}
						
						if (toad_timer >= 100)
						
							sprite_index = spr_toad_peace;
						
						if (vspd != 0)
						
							toad_x += 0.3;
						
						if (vspd > 0)
						
							bag_position = -1;
		
						vspd += grav;
						toadjump += vspd;
		
						if (toadjump >= 0) {
			
							toadjump = 0;
							vspd = 0;
							grav = 0;
			
						}
						
					} else bag_index += 0.075;
					
				}
				
				break;
				
			#endregion
			
			#region Castle 3 Toads
				
			case (3):
			
				if (bag_sprite == spr_bag) {
				
					draw_toad = false;
					bag_index += 0.125;
					toad2sprite = spr_toad;
					
					if (bag_index > 25) {
						
						bag_index = 0;
						bag_sprite = spr_bag_opening;
						draw_toad = true;
						show_thankyou = true;
						toadjump = -1;
						
					}
					
				} else {
					
					draw_toad = true;
					bag_sprite = spr_bag_opening;
					
					if (bag_index > 2) {
						
						toad_timer ++;
						
						if (toad_timer < 16) {
							
							if (toad_timer%8 == 1)
							
								toad_x += 4;
								
							toad2sprite = spr_toad_arm;
							
						} else if (toad_timer == 40) {
							
							vspd = -3;
							grav = 0.2;
							toad2sprite = spr_toad_jump_side;
							image_index = 1;
							
						} else if (grav != 0) {
							
							toad_x += 0.2;
							
						} else if (toad_timer > 40 && grav == 0) {
							
							image_index = 0;
							sprite_index = spr_toad;
							toad2sprite = spr_toad;
							
						}
						
						if (vspd != 0)
						
							toad_x += 0.3;
						
						if (vspd > 0)
						
							bag_position = -1;
		
						vspd += grav;
						toadjump += vspd;
		
						if (toadjump >= 0) {
			
							toadjump = 0;
							vspd = 0;
							grav = 0;
			
						}
						
					} else bag_index += 0.075;
					
				}
				
				break;
				
			#endregion
			
			#region Castle 4 Toads
			
			case (4):
			
				if (bag_sprite == spr_bag) {
				
					draw_toad = false;
					bag_index += 0.125;
					
					if (bag_index > 25) {
						
						bag_index = 0;
						bag_sprite = spr_bag_opening;
						draw_toad = true;
						show_thankyou = true;
						toadjump = -1;
						
					}
					
				} else {
					
					draw_toad = true;
					bag_sprite = spr_bag_opening;
					
					if (bag_index > 2) {
						
						if (vspd > 0)
						
							bag_position = -1;
						
						if (toad_timer == 10) {
							
							jumptoad = instance_create_depth(x+8,y-toadjump,depth+1,obj_toad_jump);
							audio_play_stop_sound(snd_powerup_reveal,0,0);
							
							with (jumptoad) {
								
								buddies_left = 2;
								linepos = other.depth-1;
								visible = false;
								
							}
							
						}
						
						toad_timer ++;
						
						if (toad_timer == 100) {
							
							vspd = -3;
							grav = 0.2;
							toadindex = 1;
							jumptoad.jumping = true;
							jumptoad.vspd = -1;
							jumptoad.hspd = 1;
							jumptoad.grounded = false;
							audio_play_stop_sound(snd_jump_small,0,0);
							
						}
						
						if (toad_timer == 150) {
							
							jumptoad.sprite_index = spr_toad;
							jumptoad.image_index = 0;
							
						}
						
						if (toad_timer == 200) {
							
							sprite_index = spr_toad_peace;
							jumptoad.sprite_index = spr_toad_peace;
							
						}
						
						vspd += grav;
						toadjump += vspd;
						
						if (toadjump >= 0) {
			
							toadjump = 0;
							vspd = 0;
							grav = 0;
							toadindex = 0;
			
						}
						
					} else bag_index += 0.075;
					
				}
				
				break;
				
			#endregion
			
			#region Castle 5 Toads
				
			case (5):
			
				if (bag_sprite == spr_bag) {
				
					draw_toad = false;
					bag_index += 0.125;
					
					if (bag_index > 25) {
						
						bag_index = 0;
						bag_sprite = spr_bag_opening;
						draw_toad = true;
						show_thankyou = true;
						vspd = -2.5;
						grav = 0.15625;
						hspd = 1;
						sprite_index = spr_toad_bunch_jump;
						audio_play_stop_sound(snd_jump,0,0);
						
					}
					
				} else {
					
					bag_sprite = spr_bag_opening;
					toad_timer ++;
					
					if (toad_timer%8 == 1 && hspd != 0)
					
						ang += 90;
						
					else if (hspd == 0) {
					
						sprite_index = spr_toad_bunch;
						ang = 0;
						
						if (toad_timer%irandom_range(12,14) == 1) {
							
							effect_create(spr_daze,0.125,x+toad_x+irandom_range(-20,28),y-12-irandom_range(0,8));
							
						}
						
					}
					
					if (toad_timer > 65) {
					
						if (hspd != 0) {
					
							hspd = 0;
							audio_play_stop_sound(snd_break,0,0);
							
						}
						
					}
					
					if (bag_index > 2) {
						
						//After bag has opened
						
					} else bag_index += 0.075;
					
					vspd += grav;
					toad_x += hspd;
					toadjump += vspd;
						
					if (toadjump >= 0) {
			
						toadjump = 0;
						
						if (toad_timer > 40) {
							
							if (grav != 0)
							
								audio_play_stop_sound(snd_bump,0,0);
						
							vspd = 0;
							grav = 0;
							
						} else {
							
							vspd = -1.5625;
							audio_play_stop_sound(snd_bump,0,0);
							
						}
						
						toadindex = 0;
			
					}
					
				}
				
				break;
				
			#endregion
			
			#region Castle 6 Toads
				
			case (6):
			
				if (bag_sprite == spr_bag) {
				
					draw_toad = false;
					bag_index += 0.125;
					
					if (bag_index > 25) {
						
						bag_index = 0;
						bag_sprite = spr_bag_opening;
						draw_toad = true;
						show_thankyou = true;
						vspd = -3;
						grav = 0.15625;
						sprite_index = spr_toad_canoe_small;
						audio_play_stop_sound(snd_powerup_reveal,0,0);
						
					}
					
				} else {
					
					bag_sprite = spr_bag_opening;
					toad_timer ++;
					
					if (bag_index > 2) {
						
						bag_position = -1;
						
					} else bag_index += 0.075;
					
					if (grav == 0) {
						
						sprite_index = spr_toad_canoe;
						image_index = 0;
						
					}
					
					vspd += grav;
					toad_x += hspd;
					toadjump += vspd;
					
					if (grav != 0) {
						
						if (toadjump >= 4) {
			
							toadjump = 4;
							vspd = 0;
							grav = 0;
							audio_play_stop_sound(snd_bump,0,0);
							
						}
						
					} else {
						
						if (toad_timer > 60) {
						
							if (toadjump > -2) {
						
								toadjump -= .25;
						
							} else {
						
								hspd = 1;
								toadindex += 0.125;
						
							}
							
						}
					
					}
					
					if (round(x)+8+toad_x-24 < camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])) {
					
						if (toadindex >= 2) {
					
							toadindex = 0;
							audio_play_stop_sound_at(snd_stomp,0,0,x+8+toad_x-24,y);
						
						}
						
					}
			
				}
				
				break;
				
			#endregion
			
			#region Castle 7 Toads
				
			case (7):
			
				if (bag_sprite == spr_bag) {
				
					draw_toad = false;
					bag_index += 0.125;
					
					if (bag_index > 25) {
						
						bag_index = 0;
						draw_toad = true;
						show_thankyou = true;
						bag_sprite = spr_bag_opening_alt;
						sprite_index = spr_toad_small_flag;
						toad2sprite = spr_toad_small;
						effect_create(spr_bag_part,0.125,x+10,y+1);
						audio_play_stop_sound(snd_pickup,0,0);
						
					}
					
				} else {
					
					toad_timer ++;
					toad_x ++;
					toadindex += 0.125;
					
					if (round(x)+8+toad_x-72 < camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])) {
					
						if (toadindex >= 2) {
					
							toadindex = 0;
							
							if (global.moderneffects) {
							
								audio_play_stop_sound_at(snd_march_short,0,0,round(x)+8+toad_x-72,y);
								
							} else {
							
								audio_play_stop_sound(snd_march_short,0,0);
								
							}
						
						}
						
					}
			
				}
				
				break;
				
			#endregion
				
		}
		
	} else if (peach && do_toad_animation && endtimer > 0) {
		
		if (endtimer < 100 || (endtimer >= 220 && endtimer <= 400)) {
			
			peachindex += 0.125;
			
		}
		
		if (endtimer == 100)
		
			peachindex = 0;
			
		if (endtimer >= 600) {
		
			if (button_check(abutton)
			|| button_check(start)) {
				
				ready = true;
				
			}
		
		} if (endtimer >= 480) {
			
			if (endtimer >= 540) {
				
				peachsprite = spr_peach;
				peachindex = 0;
				
			} else {
				
				if (obj_player.powerup == itemtype.id_small)
				
					peachsprite = spr_peach_kiss_small;
					
				else
			
					peachsprite = spr_peach_kiss_tall;
			
				if (endtimer == 500) {
			
					peachindex = 1;
					
				}
				
				if (endtimer == 505)
				
					instance_create_depth(x+peach_x+peach_x_extra-20,y+peach_y-16,-20,obj_heart_peach);
					
			}
			
		} else if (endtimer >= 420) {
		
			if (peach_x_extra > 5) {
		
				peach_x_extra -= 0.5;
				peachindex += 0.5/6;
				peachsprite = spr_peach_walk;
				
				if (peach_x_extra <= 5) {
				
					peachsprite = spr_peach;
					peachindex = 0;
					
				}
				
			}
			
		}
		
	}
	
	if (peach) {
		
		if (!do_toad_animation) {
			
			peachsprite = spr_peach;
			peachindex = 0;
			
		}
	
		if (endtimer == 220) {
			
			obj_controller.stopmusic = false;
			obj_controller.bgm = mus_princess;
			obj_controller.bgm_sound = audio_play_sound(mus_princess,0,0);
			
		}
		
	}
	
	player = instance_nearest(x,y,obj_player);
	
	if (player && endtimer <= 0) {
		
		player.controllable = false;
		
		if (((distance_to_point(player.x,y) > 40) && (!global.moderneffects) && !peach) //Normal on normal effects
		|| ((distance_to_point(player.x,y) > 34) && peach && do_toad_animation) //Peach on Modern Effects
		|| ((distance_to_point(player.x,y) > 40 && global.moderneffects) && !peach)) { //Normal on modern effects
			
			player.hspd = 1.5625;
			
		} else if (player.hspd > 0) {
			
			player.hspd -= 0.05;
			
			if (player.hspd <= 0) {
			
				player.hspd = 0;
				player.x = ceil(player.x);
				
			}
				
		}
		
		player.xscale = 1;
		
	}
	
	if (!peach && endtimer >= 320)
	
		ready = true;
		
	if (peach && endtimer >= 600 && !done) {
		
		if (button_check_pressed(abutton)) {
		
			global.dest = global.current_title;
			obj_controller.fade_in = 0.05;
			obj_controller.fadetimer = 30;
			global.hardmode_unlocked = true;
			done = true;
			global.world = 1;
			global.level = 1;
			
			if (global.moderneffects)
			
				global.hardmode = 2;
				
			else
			
				global.hardmode = true;
				
			ds_map_replace(global.unlocked_worldlevel,"hm",1);
			
			//Store lives so that when the file is saved, it's saved with a different number of lives than the HUD
			var tmp = -1;
			
			if (player) {
			
				tmp = global.p_lives[player.char];
			
				if (global.p_lives[player.char] < 3)
				
					global.p_lives[player.char] = 3;
					
			}
			
			full_save();
			global.hardmode = false;
			
			if (tmp != -1)
			
				global.p_lives[player.char] = tmp;
			
		}
		
	}
	
	if (show_thankyou && (global.moderneffects || global.smb2_mode) && !peach && endtimer >= 240) {
		
		if (global.time > 0) {
		
			if (global.time > 10 && !global.smb2_mode) {
		
				global.time -= 2;
				global.points += 100;
				audio_sound_gain(snd_beep,0.5,0);
				if (!audio_is_playing(snd_beep)) audio_play_sound(snd_beep,0,1);
				
			} else {
				
				audio_sound_gain(snd_beep,0.5,0);
				if (!audio_is_playing(snd_beep)) audio_play_sound(snd_beep,0,1);
				global.time --;
				global.points += 50;
				
			}
		
		} else point_timer ++;
		
		if (global.time == 0) {
			
			audio_sound_gain(snd_beep,1,0);
			audio_stop_sound(snd_beep);
				
		}
	
	}
	
	if (ready && !done && !peach && ((!global.moderneffects && !global.smb2_mode) || (global.time <= 0 && point_timer > 60))) {
		
		var k = global.level+1;
				
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