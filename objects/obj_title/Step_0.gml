#region Ease of Access

function adjust_widescreen() {
	
	if (widescreen_delay == 0) {
		
		global.widescreen = !global.widescreen;
			
		with (obj_controller)
			
			event_user(1);
					
		widescreen_delay = 30;
					
	}
	
}

function adjust_parallax() {
	
	global.parallax = !global.parallax;
	
}

function adjust_vsync() {
	
	global.vsync = !global.vsync;
	display_reset(0,global.vsync);
	
}
	
#endregion

if (obj_controller.fadetimer > 0) exit;

global.freezetime = true;
global.time = 0;

window_set_caption("Super Mario Bros.");

scr_buttons();

var charlimit = obj_controller.unlockedchars;
var chooseworld = false;
var reset_player = false;

if ((button_check_pressed(abutton) || button_check_pressed(start))
&& can_select) {
	
	var _menu = menu;
	
	if (menu == 0) {
		
		if (selection_position == 0) {
		
			menu = 1;
			event_user(0);
			
		}
			
		else if (selection_position == 1)
		
			menu = 2;
			
		else audio_play_stop_sound(snd_incorrect,0,0);
		
	} else if (menu == 1) {
		
		if (selection_position >= 0
		&& selection_position <= 2) {
			
			if (!deleting) {
			
				file_selected = selection_position + 1;
		
				if (loadworld[file_selected] == -1) {
		
					menu = 3;
				
				} else {
				
					global.dest = global.worldlevel[loadworld[file_selected],loadlevel[file_selected]];
					global.world = loadworld[file_selected];
					global.level = loadlevel[file_selected];
					global.hardmode = load_hardmode[file_selected];
					global.current_file = file_selected;
					ds_map_copy(global.unlocked_worldlevel,load_unlockedworldlevel[file_selected]);
					event_user(1);
					loadworld[file_selected] = global.world;
					loadlevel[file_selected] = global.level;
					load_hardmode[file_selected] = global.hardmode;
			
				}
				
			} else {
				
				if (delete_game_file(selection_position + 1,global.currentgame_name)) {
					
					audio_stop_sound(snd_explosion);
					audio_play_sound(snd_explosion,0,0);
					
					screen_shake(20);
					
					with (effect_create(spr_explosion,0.25,72+4,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+16+(selection_position*16)+4))
					
						depth = -10;
					
				}
				
				event_user(0);
				
			}
			
		} else {
		
			deleting = !deleting;
			
		}
	
	} else if (menu == 2) {
		
		if (selection_position == 0) {
			
			menu = 5;
			
		} else if (selection_position == 1) {
			
			global.hudstyle ++;
			
			if (global.hudstyle == 1)
			
				global.hudstyle = 2;
			
			else if (global.hudstyle > 3)
			
				global.hudstyle = 0;
				
		} else if (selection_position == 2) {
			
			menu = 4;
			
		} else if (selection_position == 3) {
			
			global.scale ++;
			
			if (global.scale > 4) {
				
				global.scale = 4;
				
				if (!window_get_fullscreen())
				
					window_set_fullscreen(true);
					
				else {
					
					window_set_fullscreen(false);
					global.scale = 1;
					
				}
				
			}
			
			with (obj_controller)
				
				event_user(1);
			
		} else audio_play_stop_sound(snd_incorrect,0,0);
		
	} else if (menu == 3) {
		
		if (selection_position == 0) {
	
			global.dest = global.worldlevel[1,1];
			global.current_file = file_selected;
			event_user(1);
			
		} else if (selection_position == 1) {
			
			global.p_char[0] ++;
			
			if (global.p_char[0] > charlimit-1)
			
				global.p_char[0] = 0;
				
			obj_player.char = global.p_char[0];
			
			if (global.p_char[0] == chara.custom && health_based)
			
				obj_player.powerup = itemtype.id_big;
				
			else
			
				obj_player.powerup = itemtype.id_small;
			
		} else if (selection_position == 2) {
			
			global.moderneffects = !global.moderneffects;
			
		} else if (selection_position == 3 && global.hardmode_unlocked) {
			
			global.hardmode = !global.hardmode;
			
		} else audio_play_stop_sound(snd_incorrect,0,0);
	
	} else if (menu == 4) {
		
		if (selection_position == 0) {
			
			obj_controller.fadetimer = 15;
			global.dest = rm_setup;
			
		} else if (selection_position == 1) {
			
			global.controllertype = !global.controllertype;
			
		}
		
	} else if (menu == 5) {
		
		if (selection_position == 0) {
			
			adjust_widescreen();
		
		} else if (selection_position == 1) {
			
			adjust_parallax();
			
		} else if (selection_position == 2) {
			
			adjust_vsync();
			
		}
	
	} else {
		
		audio_play_stop_sound(snd_incorrect,0,0);
	
	}
	
	if (_menu != menu) {
	
		selection_position = 0;
		
	}
	
} else if (button_check_pressed(bbutton)) {
	
	var _menu = menu;
	
	if (menu == 1
	|| menu == 2) {
		
		menu = 0;
		
	} else if (menu == 3) {
		
		menu = 1;
		
	} else if (menu == 4) {
		
		menu = 2;
		
	} else if (menu == 5) {
		
		menu = 2;
		
	}
	
	if (_menu != menu) {
	
		selection_position = 0;
		
	}
	
}

if (button_check_pressed(right) && can_select) {
	
	if (menu == 2) {
		
		if (selection_position == 1) {
			
			global.hudstyle ++;
			
			if (global.hudstyle == 1)
			
				global.hudstyle = 2;
			
			else if (global.hudstyle > 3)
			
				global.hudstyle = 0;
				
		} else if (selection_position == 3) {
	
			global.scale ++;
			
			if (global.scale > 4) {
				
				global.scale = 4;
				
				if (!window_get_fullscreen())
				
					window_set_fullscreen(true);
					
				else {
					
					window_set_fullscreen(false);
					global.scale = 1;
					
				}
				
			}
		
			with (obj_controller)
				
				event_user(1);
	
		}
	
	} else if (menu == 3) {
		
		if (selection_position == 1) {
			
			global.p_char[0] ++;
			
			if (global.p_char[0] > charlimit-1)
			
				global.p_char[0] = 0;
				
			obj_player.char = global.p_char[0];
			
			if (global.p_char[0] == chara.custom && health_based)
			
				obj_player.powerup = itemtype.id_big;
				
			else
			
				obj_player.powerup = itemtype.id_small;
			
		} else if (selection_position == 2) {
			
			global.moderneffects = !global.moderneffects;
			
		} else if (selection_position == 3) {
			
			global.hardmode = !global.hardmode;
			
		}
		
	} else if (menu == 4) {
		
		if (selection_position == 1) {
			
			global.controllertype = !global.controllertype;
			
		}
		
	} else if (menu == 5) {
		
		if (selection_position == 0) {
			
			adjust_widescreen();
		
		} else if (selection_position == 1) {
			
			adjust_parallax();
			
		} else if (selection_position == 1) {
			
			adjust_vsync();
			
		}
		
	}
	
} else if (button_check_pressed(left) && can_select) {
	
	if (menu == 2) {
		
		if (selection_position == 1) {
			
			global.hudstyle --;
			
			if (global.hudstyle == 1)
			
				global.hudstyle = 0;
			
			else if (global.hudstyle < 0)
			
				global.hudstyle = 3;
				
		} else if (selection_position == 3) {
		
			if (window_get_fullscreen())
		
				window_set_fullscreen(false);
		
			else if (global.scale == 1) {
			
				global.scale = 4;
			
				window_set_fullscreen(true);
			
			} else global.scale --;
		
			with (obj_controller)
				
				event_user(1);
			
		}
		
	} else if (menu == 3) {
		
		if (selection_position == 1) {
			
			global.p_char[0] --;
			
			if (global.p_char[0] < 0)
			
				global.p_char[0] = charlimit-1;
				
			obj_player.char = global.p_char[0];
				
		} else if (selection_position == 2) {
			
			global.moderneffects = !global.moderneffects;
			
		} else if (selection_position == 3) {
			
			global.hardmode = !global.hardmode;
			
		}
		
	} else if (menu == 4) {
		
		if (selection_position == 1) {
			
			global.controllertype = !global.controllertype;
			
		}
		
	} else if (menu == 5) {
		
		if (selection_position == 0) {
			
			adjust_widescreen();

		} else if (selection_position == 1) {
			
			adjust_parallax();
			
		} else if (selection_position == 2) {
			
			adjust_vsync();
			
		}
		
	}
	
}

if (button_check_pressed(up) && can_select) {
	
	selection_position --;
	
} else if (button_check_pressed(down) && can_select) {
	
	selection_position ++;
	
}

if (menu == 0) {
	
	var option_count = 2;
	
	if (selection_position > option_count-1)
	
		selection_position = 0;
		
	else if (selection_position < 0)
	
		selection_position = option_count-1;
	
} else if (menu == 1 || menu == 2 || (menu == 3 && global.hardmode_unlocked)) {
	
	var option_count = 4;
	
	if (selection_position > option_count-1)
	
		selection_position = 0;
		
	else if (selection_position < 0)
	
		selection_position = option_count-1;
	
} else if (menu == 3) {
	
	var option_count = 3;
	
	if (selection_position > option_count-1)
	
		selection_position = 0;
		
	else if (selection_position < 0)
	
		selection_position = option_count-1;
	
} else if (menu == 4) {
	
	var option_count = 2;
	
	if (selection_position > option_count-1)
	
		selection_position = 0;
		
	else if (selection_position < 0)
	
		selection_position = option_count-1;
	
} else if (menu == 5) {
	
	var option_count = 4;
	
	if (selection_position > option_count-1)
	
		selection_position = 0;
		
	else if (selection_position < 0)
	
		selection_position = option_count-1;
	
}

if (choosing_world > 0) {
	
	if ((button_check_pressed(abutton)) || (button_check_pressed(bbutton)) || (button_check_pressed(start))) {
	
		choosing_world = 0;
		can_select = true;
		
	} else {
	
		var chooselvl = 0;
		var hard_unlocked = false;
	
		if (!is_undefined(ds_map_find_value(load_unlockedworldlevel[selection_position+1],"hm"))) {
	
			hard_unlocked = true;
		
			//Unlock level 1
			ds_map_replace(load_unlockedworldlevel[selection_position+1],"w1h",1);
			ds_map_replace(load_unlockedworldlevel[selection_position+1],"w1l1h",1);
		
		}

		if (button_check_pressed(right)) {
		
			choosing_world ++;
		
			if (choosing_world == 2) {
	
				if (!hard_unlocked) {
			
					choosing_world ++;
			
				}
		
			}
		
		} else if (button_check_pressed(left)) {
		
			choosing_world --;
		
			if (choosing_world == 2) {
	
				if (!hard_unlocked) {
			
					choosing_world --;
			
				}
		
			}
		
		}
		
		if (choosing_world == 2) {
		
			if (button_check_pressed(up) || button_check_pressed(down)) {
			
				if (load_hardmode[selection_position+1])
			
					load_hardmode[selection_position+1] = false;
				
				else
			
					load_hardmode[selection_position+1] = true;
				
				loadworld[selection_position+1] = 1;
				loadlevel[selection_position+1] = 1;
			
			}
		
		}
	
		var _extra = "";
	
		if (load_hardmode[selection_position+1] > 0) {
	
			_extra = "h";
		
		}

		if (choosing_world < 1)
	
			choosing_world = 3;
		
		else if (choosing_world > 3)
	
			choosing_world = 1;
		
		if (choosing_world == 1 || chooseworld) {
		
			if ((button_check_pressed(up) || chooseworld == 1) && chooseworld != -1) {
			
				loadworld[selection_position+1] ++;
			
				while (ds_map_find_value(load_unlockedworldlevel[selection_position+1],"w"+string(loadworld[selection_position+1])+_extra) != 1
				&& ds_map_find_value(load_unlockedworldlevel[selection_position+1],"w"+string(loadworld[selection_position+1])+_extra) != 0.5) {
				
					loadworld[selection_position+1] ++;
				
					if (loadworld[selection_position+1] > array_height_2d(global.worldlevel))
				
						loadworld[selection_position+1] = 0;
				
				}
				
				loadlevel[selection_position+1] = 4;
			
				if (ds_map_find_value(load_unlockedworldlevel[selection_position+1],"w"+string(loadworld[selection_position+1])+"l"+string(loadlevel[selection_position+1])+_extra) != 1
				&& ds_map_find_value(load_unlockedworldlevel[selection_position+1],"w"+string(loadworld[selection_position+1])+"l"+string(loadlevel[selection_position+1])+_extra) != 0.5)
			
					chooselvl = 1;
			
			} else if ((button_check_pressed(down) || chooseworld == -1) && chooseworld != 1) {
			
				if (button_check_pressed(down)) {
			
					loadworld[selection_position+1] --;
			
					while (ds_map_find_value(load_unlockedworldlevel[selection_position+1],"w"+string(loadworld[selection_position+1])+_extra) != 1
					&& ds_map_find_value(load_unlockedworldlevel[selection_position+1],"w"+string(loadworld[selection_position+1])+_extra) != 0.5) {
				
						loadworld[selection_position+1] --;
				
						if (loadworld[selection_position+1] <= 0)
				
							loadworld[selection_position+1] = array_height_2d(global.worldlevel);
				
					}
			
				}
				
				loadlevel[selection_position+1] = 4;
			
				if (ds_map_find_value(load_unlockedworldlevel[selection_position+1],"w"+string(loadworld[selection_position+1])+"l"+string(loadlevel[selection_position+1])+_extra) != 1
				&& ds_map_find_value(load_unlockedworldlevel[selection_position+1],"w"+string(loadworld[selection_position+1])+"l"+string(loadlevel[selection_position+1])+_extra) != 0.5)
			
					chooselvl = 1;
		
			}
		
		}
	
		if (choosing_world == 3 || chooselvl != 0) {
		
			if ((button_check_pressed(up) || chooselvl == 1) && chooselvl != -1) {
		
				loadlevel[selection_position+1] ++;
		
				while (ds_map_find_value(load_unlockedworldlevel[selection_position+1],"w"+string(loadworld[selection_position+1])+"l"+string(loadlevel[selection_position+1])+_extra) != 1
				&& ds_map_find_value(load_unlockedworldlevel[selection_position+1],"w"+string(loadworld[selection_position+1])+"l"+string(loadlevel[selection_position+1])+_extra) != 0.5) {

					loadlevel[selection_position+1] ++;
				
					if (loadlevel[selection_position+1] > array_length_2d(global.worldlevel,loadworld[selection_position+1]))
				
						loadlevel[selection_position+1] = 0;

				}
			
			} else if ((button_check_pressed(down) || chooselvl == -1) && chooselvl != 1) {
		
				loadlevel[selection_position+1] --;
		
				while (ds_map_find_value(load_unlockedworldlevel[selection_position+1],"w"+string(loadworld[selection_position+1])+"l"+string(loadlevel[selection_position+1])+_extra) != 1
				&& ds_map_find_value(load_unlockedworldlevel[selection_position+1],"w"+string(loadworld[selection_position+1])+"l"+string(loadlevel[selection_position+1])+_extra) != 0.5) {

					loadlevel[selection_position+1] --;
				
					if (loadlevel[selection_position+1] <= 0)
				
						loadlevel[selection_position+1] = array_length_2d(global.worldlevel,loadworld[selection_position+1]);


				}
			
			}

		}
	
		if (button_check_pressed(select)) {
	
			choosing_world = 0;
			can_select = true;
		
		}
	
	}
	
}

else if (menu == 1) {
	
	if (selection_position >= 0 && selection_position <= 2) {
		
		if (button_check_pressed(select) && (loadworld[selection_position+1] != -1)) {
			
			can_select = false;
			choosing_world = 1;
			
		}
		
		if (loadworld[selection_position+1] != -1) {
	
			global.moderneffects = ds_map_find_value(load_unlockedworldlevel[selection_position+1],"modern");
			global.p_char[0] = ds_map_find_value(load_unlockedworldlevel[selection_position+1],"char");
			if (global.p_char[0] > 3) global.p_char[0] = 0;
			global.p_powerup[0] = ds_map_find_value(load_unlockedworldlevel[selection_position+1],"powerup");
			global.p_lives[global.p_char[0]] = ds_map_find_value(load_unlockedworldlevel[selection_position+1],"lives");
			global.points = ds_map_find_value(load_unlockedworldlevel[selection_position+1],"score");
			global.coins = ds_map_find_value(load_unlockedworldlevel[selection_position+1],"coins");
			obj_player.char = global.p_char[0];
			obj_player.powerup = global.p_powerup[0];
			
		} else {
			
			reset_player = true;
			
		}
		
	} else {
		
		reset_player = true;
		
	}
	
} else if (menu == 0)

	reset_player = true;

if (reset_player) {

	global.points = 0;
	global.coins = 0;
	global.moderneffects = false;
	global.p_char[0] = chara.mario;
	global.p_powerup[0] = itemtype.id_small;
	global.p_lives[obj_player.char] = obj_controller.default_lives;
	obj_player.powerup = global.p_powerup[0];
	obj_player.char = global.p_char[0];
	global.p_lives[obj_player.char] = obj_controller.default_lives;
	
}

if (menu == 0) {

	global.moderneffects = false;
	char = chara.mario;
	obj_player.char = char;
	
} else {
	
	char = global.p_char[0];
	
}

if (menu != 1) {
	
	deleting = false;
	
}

arrow_index += 0.0375;

if (widescreen_delay > 0)

	widescreen_delay --;
	
if (global.moderneffects && global.hardmode == 1) global.hardmode = 2;
if (!global.moderneffects && global.hardmode == 2) global.hardmode = 1;