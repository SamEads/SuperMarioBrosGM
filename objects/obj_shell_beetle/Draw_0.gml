if (global.moderneffects) {

	switch (obj_controller.currenttheme) {

		default: sprite_index = spr_buzzybeetle_shell_moving; swap_palette = true; break;
		case (themetype.cave): sprite_index = spr_buzzybeetle_shell_moving_underground; swap_palette = false; break;
		
	}
	
} else {

	sprite_index = spr_buzzybeetle_shell;
	swap_palette = true;
	
}

// Inherit the parent event
event_inherited();