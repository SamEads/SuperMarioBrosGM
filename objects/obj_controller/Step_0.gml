/// @description Music & time

if (global.smb2_mode) {
	
	global.currentfont = global.font_smb2;
	
} else {
	
	global.currentfont = global.font;
	
}

if (keyboard_check_pressed(ord("F")) && (keyboard_check(vk_alt))) {
	
	show_fps = !show_fps;
	
}

if (global.debugmode) {

	//Scale up
	if keyboard_check_pressed(ord("P")) {
	
		global.scale ++;
	
		event_user(1);
	
	}

	//Scale down
	if keyboard_check_pressed(ord("O")) {
	
		if (global.scale > 1) {
	
			global.scale --;
		
		}

		event_user(1);
	
	}

	//Janky level selector only really meant to be used for major debugging- will be removed later!
	if keyboard_check(vk_control) && keyboard_check_pressed(ord("E")) {
	
		if (choosing_level == 0) {
	
			global.frozen = true;
			choosing_level = 1;
			selection = 1;
			global.world = 0;
			global.level = 0;
		
		} else {
		
			choosing_level = 0;
			global.frozen = false;
		
		}
		
	} else if (choosing_level > 0) {
	
		if keyboard_check_pressed(vk_anykey) {
	
			if (keyboard_check_pressed(vk_backspace)) {
		
				choosing_level = 0;
				global.frozen = false;
			
			}
	
			if (choosing_level == 1) {
			
				if ((keyboard_key-48 > 0) && (keyboard_key-48 <= 9)) {
		
					global.world += ((keyboard_key-48) * selection);
					selection *= 10;
				
				} else if (keyboard_key == 189) {
				
					choosing_level ++;
					selection = 1;
				
				}
		
			} else if (choosing_level == 2) {
		
				if ((keyboard_key-48 > 0) && (keyboard_key-48 <= 9)) {
		
					global.level += ((keyboard_key-48) * selection);
					selection *= 10;
				
				} else if (keyboard_key == 13) {
				
					choosing_level ++;
					selection = 1;
				
				}
		
			}
		
			if (choosing_level == 3) {
			
				choosing_level = 0;
			
				event_user(1);
			
				if (room_exists(global.worldlevel[global.world,global.level])) {
			
					global.dest = global.worldlevel[global.world,global.level];
					obj_controller.fadetimer = 15;
					event_user(1);
				
				}
			
			}
		
		}
	
	}

}
	
//Manage the game-over timer
if (gameover_timer > 0) {
	
	/*The game-over timer utilizes the level start screen, so force it to stay at the max height so that
	none of the level start functions starting at around 150 on the tick begin*/
	levelstart = 160;
	
	//Subtract from the game over tick
	gameover_timer --;
	
	//Reset time
	global.time = 0;
	mainleveltime = 0;
	displaytime = 0;
	
	//If the tick has reached zero, fade to the title screen
	if (gameover_timer <= 0) {
		
		levelstart = 0;
		fade_in = 0.05;
		fade_dir = 1;
		fadetimer = 15;
		global.dest = global.current_title;
		
	}
	
//When the game-over timer has reached zero, let the game know that there is no longer a game-over in play
} else if (global.gameover == true && fadealpha >= 1) {
	
	global.gameover = false;
	global.time = 0;
	mainleveltime = 0;
	
}

//Fading to black
if (fade_dir == 1) {

	fadealpha += fade_in;
	
	if (fadealpha >= 1) {
		
		fadealpha = 1;
		fade_dir = 0;
		fade_in = -1;
		
	}
	
//Fading out of black
} else if (fade_dir == -1) {

	fadealpha -= fade_out;
	
	if (fadealpha <= 0) {
		
		fadealpha = 0;
		fade_dir = 0;
		fade_out = -1;
		
	}
	
}

//If the level is starting...
if (levelstart > 0 && fadetimer <= 0) {
	
	//If the level start is nearing the end,
	if (levelstart == 15 && !timeup) {
		
		//Ease out the alpha of the text
		if (fadealpha == 0) {
		
			fade_in = 0.1;
			fade_dir = 1;
		
		//If the fade has completed, finish the level start countdown
		} else if (fadealpha == 1 && !selecting_player)
		
			levelstart --;
		
	} else if (!selecting_player) levelstart --;
	
	//If the level start screen has decremented enough, fade the screen back in to show the level start
	if (levelstart == 150) {
		
		fade_dir = -1;
		fade_out = 0.1;
		alarm[3] = 2;
		
	}
	
	if (levelstart > 15
	&& fade_dir == 0
	&& !global.gameover
	&& !timeup) {
		
		scr_buttons();
		
		if (button_check_pressed(select)) {
			
			selecting_player = !selecting_player;
			
			if (selecting_player) {
				
				stored_lives = global.p_lives[char];
				
			}
			
		}
		
		if (selecting_player) {
			
			var charlimit = obj_controller.unlockedchars;
				
			charlimit -= 1;
			
			//Index the current powerup
			var _powerup = obj_player.powerup;
			
			//Index the old current character
			var _oldchar = global.p_char[0];
			
			if (button_check_pressed(left)) {
				
				global.p_char[0] --;
				
			} else if (button_check_pressed(right)) {
				
				global.p_char[0] ++;
				
			}
			
			//Cycle the character counter
			if (global.p_char[0] < 0)
			
				global.p_char[0] = charlimit;
				
			if (global.p_char[0] > charlimit)
			
				global.p_char[0] = 0;
				
			if (_oldchar != global.p_char[0]) {
			
				//Give them the other character's,
				global.p_lives[global.p_char[0]] = stored_lives;
			
				//Then give the other character the default lives
				global.p_lives[_oldchar] = default_lives;
			
				//Change player character
				obj_player.char = global.p_char[0];
			
				//Change the powerup
				obj_player.powerup = _powerup;
				
			}
			
			arrow_index += 0.0375;
			
			if (levelstart < 100)
		
				levelstart = 100;
		
			if (button_check_pressed(abutton)
			|| button_check_pressed(start)
			|| button_check_pressed(bbutton)) {
				
				selecting_player = !selecting_player;
				
			}
		
		}
		
	}
	
	//Make the time-up counter a tad faster than the normal level start
	if (timeup && levelstart > 100) {
	
		levelstart = 100;
		
	}
	
	//If the level start countdown is finished...
	if (levelstart == 0) {
		
		//If there's no time-up on screen, start the level
		if (!timeup) {
		
			fade_dir = -1;
			fade_out = 0.05;
			
		} else {
	
			//Restart the level start screen if "Time Up" was shown before
			timeup = false;
			levelstart = 160;
			
		}
		
	} else if (timeup) {
		
		//Don't show the time if "Time Up" is on the screen
		showtime = false;
		
	}
	
	//Freeze all actors
	global.frozen = true;
	
	//Put the HUD above EVERYTHING
	depth = -1000;
	
	//Set the HUD to the cave theme temporarily
	currenttheme = themetype.cave;
	
	//Don't show the time in retro mode
	showtime = false;
	
	//Manage midwaypoint positioning at the start of a level
	if (global.midwaypoint_x != -1) {
		
		if (!instance_exists(obj_player)) {
			
			instance_create_depth(global.midwaypoint_x,room_height,0,obj_player);
			
		}
		
		//Set the player and camera position	
		obj_player.x = global.midwaypoint_x;
		obj_player.y = room_height;
		obj_levelmanager.camX = obj_player.x + 80;
			
		//Make it so the player isn't lodged into a block
		with (obj_player) {
			
			var found_spot = false;
				
			while (!collision_rectangle(x,bbox_bottom+1,x,bbox_bottom+1,obj_semisolid,1,0)) {
				
				y --;
				
				while (collision_rectangle(x,bbox_bottom,x,bbox_bottom,obj_semisolid,1,0)) {
					
					y --;
					
					if (!collision_rectangle(x,bbox_bottom,x,bbox_bottom,obj_semisolid,1,0)) {
						
						found_spot = true;
						
					}
					
				}
					
				if ((y < (room_height/2)) || found_spot)
					
					break;
					
			}
					
		}
		
	}
	
	//If the level is starting...
	if (levelstart <= 0) {
		
		//Unfreeze everything at the start of the level
		global.frozen = false;
			
		if (global.midwaypoint_x != -1) {
			
			//Destroy enemies on-screen when the level starts and the player is at a midway point
			with (obj_enemyspawner) {
	
				if (distance_to_point(camera_get_view_x(view_camera[0])+128,y) <= 160) && (depth < 100) {
		
					destroy_line();
		
					instance_destroy();
					
					if (my_enemy != noone) {
						
						with (my_enemy) {
							
							instance_destroy();
							
						}
						
					}
		
				}
	
			}
				
		}
		
	}
	
//If the level start screen isn't showing, manage some things
} else if (instance_exists(obj_levelmanager) && fade_dir != 1) {
	
	//Put the HUD above or below things
	if (global.moderneffects) {
		
		depth = -100;
		
	} else {
		
		depth = 19;
		
	}
	
	//Manage alternate themes
	if (global.moderneffects && obj_levelmanager.modern_theme != -1)
		
		currenttheme = obj_levelmanager.modern_theme;
		
	else if (!global.moderneffects && obj_levelmanager.retro_theme != -1)
	
		currenttheme = obj_levelmanager.retro_theme;
		
	else
	
		currenttheme = obj_levelmanager.theme;
	
	//Route athletic palette to overworld
	if (currenttheme == themetype.athletic)
	
		currenttheme = themetype.overworld;
		
	//Route forest palette to overworld
	if (currenttheme == themetype.forest)
	
		currenttheme = themetype.overworld;
		
	//Route desert theme to overworld only when not in modern effects
	if (currenttheme == themetype.desert && !global.moderneffects)
	
		currenttheme = themetype.overworld;
		
	//Route snow palette to overworld, only when not in modern effects
	if (currenttheme == themetype.snow && !global.moderneffects)
	
		currenttheme = themetype.overworld;
	
}

//Restart the game if tab+R are pressed

if (room != rm_corrupt
&& room != rm_setup
&& room != rm_presents)

	if keyboard_check_pressed(ord("R")) && keyboard_check(vk_tab) game_restart();

if (global.time >= 100 && !global.levelcleared) {
	
	tempo = 1;
	
} else if (global.time > 0 && !global.levelcleared) {

	//Hurry up!
	if (tempo != 1.4) {
	
		tempo = 1.4;
		audio_play_stop_sound(snd_hurryup,0,0);
		audio_pause_sound(bgm_sound);
		
	}
	
	//Resume the sound once the tempo has reached a higher speed and the time-up sound isn't playing
	if (!audio_is_playing(snd_hurryup) && tempo == 1.4) {
		
		audio_resume_sound(bgm_sound);
		
	}
	
	//Adjust the music pitch
	audio_sound_pitch(bgm_sound,1.4);
	
}

//Check for whether the player is warping
var player_inactive = true;

//Set the controller character & manage the player_inactive variable (HUD char)
if (instance_exists(obj_player)) {
	
	char = obj_player.char;
	powerup = obj_player.powerup;
	
	if (obj_player.controllable)
	
		player_inactive = (obj_player.warping) ? true : false;
	
}

//If the time can be subtracted from...
if (!global.frozen && !player_inactive && !global.levelcleared && !global.freezetime) {

	//Tick the timer
	timetick --;

	//If the tick has reached at or below zero...
	if (timetick <= 0) {
	
		//Set up the next tick!
		timetick = 25;
	
		//Then subtract the tick!
		if (global.time > 0) {
	
			global.time --;
			
			//If the time is equal to zero, but only if it REACHED it while counting...
			if (global.time == 0) {
				
				//Tiiime up!
				displaytime = 0;
				timeup = true;
			
				//Kill the player
				with (obj_player)
			
					event_user(2);
					
			}
			
		}
	
	}
	
}

//Manage the fade pause & coincidingly, the black that shows up on the screen only in retro mode
if (fadetimer > 0) {
	
	if (bg_fade == -1) {
		
		bg_fade = 0;
		
		with (obj_levelmanager) {
			
			other.bg_fade = 3;
			event_user(0);
			
		}
		
	} else if (bg_fade > 0) {
		
		bg_fade --;
		
	}
	
	//Subtract the fade timer
	if (fadetimer > 0 && !global.moderneffects) || (fadetimer > 1 && global.moderneffects) {
	
		fadetimer --;
		
	//If the fade timer is less than one and we are in modern effects, ease slower so that the actual fading has time to keep up
	} else if (fadetimer <= 1 && global.moderneffects) {
		
		fadetimer -= 0.05;
		
	}
	
	//If the alpha is zero, fade to black
	if (fadealpha == 0) {
		
		fade_dir = 1;
		fade_in = 0.05;
		
	}
	
	//Go to the next room when the fade timer has reached the maximum amount
	if (fadetimer <= 0) {
		
		global.frozen = false;
		room_goto(global.dest);
		global.dest = -1;
		fade_dir = -1;
		fade_out = 0.05;
		bg_fade = -1;
		
	}
	
}

//Music
if (levelstart <= 0) {

	//If a new song is to be played
	if (choosemusic) {
	
		//If the level control object exists
		if (instance_exists(obj_levelmanager)) {
			
			//Remember the old background music
			var old_bgm = bgm;
			
			if (!global.levelcleared) {
			
				var theme_to_switch = obj_levelmanager.theme;
			
				if (obj_levelmanager.modern_theme != -1 && global.moderneffects)
			
					theme_to_switch = obj_levelmanager.modern_theme;
				
				if (obj_levelmanager.retro_theme != -1 && !global.moderneffects)
			
					theme_to_switch = obj_levelmanager.retro_theme;
		
				//Switch the songs
				switch (theme_to_switch) {
			
					default: bgm = mus_overworld; break;
					case (themetype.athletic): if (global.moderneffects) bgm = mus_athletic; else bgm = mus_overworld; break;
					case (themetype.forest): if (global.moderneffects) bgm = bgm_forest; else bgm = mus_overworld; break;
					case (themetype.snow): if (global.moderneffects) bgm = bgm_snow; else bgm = mus_overworld; break;
					case (themetype.desert): if (global.moderneffects) bgm = bgm_desert; else bgm = mus_overworld; break;
					case (themetype.cave): bgm = mus_underground; break;
					case (themetype.castle): bgm = mus_castle; break;
					case (themetype.water): bgm = mus_water; break;
			
				}
			
				//Choose different background music if the level control "bgm" variable is different
				if (obj_levelmanager.bgm != -1)
			
					if ((global.moderneffects) || (!global.moderneffects && obj_levelmanager.retro_bgm == -1))
				
						bgm = obj_levelmanager.bgm;
					
				//Choose different music only for retro mode if you're in retro mode currently
				if (obj_levelmanager.retro_bgm != -1)
			
					if (!global.moderneffects)
				
						bgm = obj_levelmanager.retro_bgm;
					
			}
			
			//If the old BGM doesn't match the new BGM, stop the sound
			if (old_bgm != bgm)
		
				audio_stop_sound(bgm_sound);
				
			//Stop choosing music
			choosemusic = false;
		
		}
	
	} else {
	
		//Manage the actual playing of music
		if ((fadetimer <= 0
		|| global.moderneffects)
		&& !stopmusic) {
			
			var play_invincible = true;
			var play_pswitch = false;
			var inv_tune = mus_invincible;
			
			if (global.pswitch > 0) {
				
				play_pswitch = true;
				
				//If the P-Switch music isn't playing...
				if (!audio_is_playing(mus_pswitch)) {
		
					//Stop the normal background music
					audio_stop_sound(bgm);
						
					//Play the P-Switch music
					bgm_sound = audio_play_sound(mus_pswitch,0,0);
		
				}
				
			}
			
			//If the player is invincible and above a threshold, play the invincible music
			if (instance_exists(obj_player)) {
				
				if (obj_player.invincibletimer > 60) {
					
					//Let the game know not to play the normal music
					play_invincible = true;
				
					//If the invincible music isn't playing...
					if (!audio_is_playing(inv_tune)) {
		
						//Stop the normal background music
						audio_stop_sound(bgm);
						
						//Play the invincible music
						bgm_sound = audio_play_sound(inv_tune,0,0);
		
					}
				
				} else play_invincible = false;
				
			}
	
			//Play the music
			if (!audio_is_playing(bgm) && !play_invincible && !play_pswitch && !global.paused && loop_song) {
				
				//If the player isn't invincible, stop playing the invincibility tune
				if (audio_is_playing(inv_tune)) {
		
					audio_stop_sound(inv_tune);
		
				}

				//Stop p-switch tune
				if (audio_is_playing(mus_pswitch)) {
		
					audio_stop_sound(mus_pswitch);
		
				}
		
				//If a song has been chosen,
				if (bgm != -1)
		
					//Play it!
					bgm_sound = audio_play_sound(bgm,0,0);
		
			}
		
		//If the variables are in play for the music to stop...
		} else if (audio_is_playing(bgm_sound)) {
		
			//Stop the music
			audio_stop_sound(bgm_sound);
			
			//Let the game know no music has been chosen
			bgm = -1;
		
		}
	
	}

}

//If the coin counter is above 100
if (global.coins >= 100) {
	
	//Subtract 100 (just in case the coins went over 100 somehow)
	global.coins -= 100;
	
	//Increment the player lives
	global.p_lives[char] ++;
	
	//Play the 1-up sound
	audio_stop_sound(snd_1up);
	audio_play_sound(snd_1up,0,0);
	
}

//Update the coins that show up on the HUD
displaycoins = global.coins;

//Decrement the shake timer if the screen is shaking
if (shake_length > 0)

	shake_length --;