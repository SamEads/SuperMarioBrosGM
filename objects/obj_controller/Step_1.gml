/// @description Tick, respawn, & debug commands
last_modern = global.moderneffects;

//Reset the tick if the level is just starting
if (levelstart > 0 && fade_dir == 0) {

	global.tick = 0;

} else if (global.paused) {
	
	//Don't tick while the game is paused

//Decrement the tick slowly frame 1
} else if (global.tick < 1) {
	
	global.tick += 0.0375;
	
} else {
	
	//Decrement the tick at a different speed if not frame 1
	global.tick += 0.15625;
	
	//Reset the tick after a threshold is met
	if (global.tick >= 4)
	
		global.tick = 0;
	
}

//P-Switch
if (global.pswitch > 0) {
	
	global.pswitch --;
	
}

//Let the game know what room to respawn in if the player is controllable
if (global.respawnroom == -1) {

	if (instance_exists(obj_player)) {
		
		if (obj_player.controllable && !obj_player.warping)
		
			global.respawnroom = room;
					
	}
	
}

//More debug commands
if (!global.paused) {
	
	if (global.debugmode) {

		if keyboard_check_pressed(vk_f1) {
	
			if (!keyboard_check(vk_tab)) {
		
				global._gw = 256;
				global._gh = 240;
	
			}
	
			global.widescreen = false;
			global.hudstyle = 0;
			event_user(1);
	
		} else if keyboard_check_pressed(vk_f2) {
	
			if (!keyboard_check(vk_tab)) {
	
				global._gw = 384;
				global._gh = 216;
	
			}
	
			global.widescreen = true;
			surface_rescale = true;
			global.hudstyle = 3;
			event_user(1);
	
		} else if (keyboard_check_pressed(vk_shift)) {
	
			global.moderneffects = !global.moderneffects;
	
			choosemusic = true;
			
			surface_rescale = (global.moderneffects) ? true : false;
			event_user(1);
	
		} else if (keyboard_check_pressed(vk_control)) {
	
			global.smb2_mode = !global.smb2_mode;
	
			choosemusic = true;
			
			surface_rescale = (global.moderneffects) ? true : false;
			event_user(1);
	
		}
	
	}

}