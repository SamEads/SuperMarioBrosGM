scr_buttons();

#region Menu Options

if (finished) {
	
	//Really dirty way of handling unpausing so that the pause BG only gets deleted a moment afterward
	if (unpausing == 1.5) {
		
		global.frozen = false;
		sprite_delete(global.pausebgsurface);
		unpausing = 2;
		
	}
	
	if (unpausing == 1) {
		
		global.paused = false;
		global.hudstyle = changehud;
		instance_activate_all();
		unpausing = 1.5;
		
	}
	
	if (unpausing == 2) {
		
		unpausetimer --;
		
		if (unpausetimer <= 0) {
	
			instance_destroy();
	
			with (obj_controller) {
		
				audio_sound_set_track_position(bgm_sound,other.returntime);
				audio_sound_gain(bgm_sound,1,0);
		
			}
			
		}
		
	}

	exit;
	
}

if (!adjusting
&& !pausing
&& !unpausing) {
	
	current_menu = menu;
	
	arrow_index += 0.0375;
	
	if (button_check_pressed(down)) {
				
		selection ++;
				
	} else if (button_check_pressed(up) || button_check_pressed(select)) {
				
		selection --;
				
	}
	
	switch (menu) {
		
		case (menustate.pause):
		
			switch (selection) {
			
				case (0):
				
					if (button_check_pressed(abutton) || button_check_pressed(start)) {
						
						unpausing = 1;
						audio_play_stop_sound(snd_pause,0,0);
						unpausetimer = audio_sound_length(snd_pause)*60;
						
					}
				
					break;
					
				case (1):
				
					if (button_check_pressed(abutton) || button_check_pressed(start)) {
				
						menu = 1;
					
					}
					
					break;
					
				case (2):
				
					if (button_check_pressed(abutton) || button_check_pressed(start)) {
				
						global.dest = global.current_title;
						obj_controller.fade_in = 0.025;
						obj_controller.fadetimer = 30;
						finished = true;
						exit;
					
					}
					
					break;
			
			}
			
			break;
			
		case (menustate.options):
		
			if (button_check_pressed(bbutton))
			
				menu = 0;
		
			switch (selection) {
			
				case (0):
				
					if (button_check_pressed(abutton) || button_check_pressed(right) || button_check_pressed(start)) {
					
						changehud ++;
						
						if (changehud == 1)
						
							changehud ++;
						
					} else if (button_check_pressed(left)) {
					
						changehud --;
						
						if (changehud == 1)
						
							changehud --;
						
					}
					
					if (changehud > 3)
					
						changehud = 0;
						
					if (changehud < 0)
					
						changehud = 3;
				
					break;
					
				case (1):
				
					if (button_check_pressed(abutton) || button_check_pressed(right) || button_check_pressed(start) || (button_check_pressed(left))) {
					
						global.controllertype = !global.controllertype;
						
					}
				
					break;
					
				case (2):
				
					if (button_check_pressed(abutton) || button_check_pressed(right) || button_check_pressed(start)) {
					
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
						
					} else if (button_check_pressed(left)) {
					
						if (window_get_fullscreen())
		
							window_set_fullscreen(false);
		
						else if (global.scale == 1) {
			
							global.scale = 4;
			
							window_set_fullscreen(true);
			
						} else global.scale --;
		
						with (obj_controller)
				
							event_user(1);
							
					}
				
					break;
			
			}
		
			break;
		
	}
	
	if (menu != current_menu) {
	
		selection = 0;
		
	}
	
}

#endregion

#region Adjustment Variables for each section

var max_selection = 0;

switch (menu) {
	
	case (menustate.pause):
	
		max_w = 136;
		max_h = 104;
		max_selection = 2;
		break;
		
	case (menustate.options):
	
		max_w = 188;
		max_h = 104;
		max_selection = 2;
		break;
	
}
		
if ((selection > max_selection) && !adjusting)
	
	selection = 0;
	
if (selection < 0)

	selection = max_selection;
	
#endregion

if (unpausing) {

	if (ww > 0) {
	
		ww -= (8 * (max_w/max_h));
		hh -= 8;
		
		if (ww <= 0) {
		
			ww = 0;
			hh = 0;
			finished = true;
			
		}
	
	}

} else if ((max_h != hh) || (max_w != ww)) {
	
	var spd = 8;
	
	if (adjusting
	&& !pausing)
	
		spd = 4;
	
	if (ww < max_w) {
	
		ww += (spd * (max_w/max_h));
		
		if (ww > max_w)
		
			ww = max_w;
	
	}
	
	if (ww > max_w) {
	
		ww -= (spd * (max_w/max_h));
		
		if (ww < max_w)
		
			ww = max_w;
	
	}
	
	if (hh > max_h) {
		
		hh -= spd;
				
	}
	
	if (hh < max_h) {
	
		hh += spd;
	
	}
	
	adjusting = true;
	
} else {
	
	adjusting = false;
	pausing = false;
	
}