if (global.moderneffects) {
	
	switch (obj_controller.currenttheme) {

		default: sprite_index = spr_buzzybeetle_alt; swap_palette = true; break;
		case (themetype.cave): sprite_index = spr_buzzybeetle_alt_underground; swap_palette = false; break;
		
	}
	
} else {

	sprite_index = spr_buzzybeetle;
	swap_palette = true;

}

// Inherit the parent event
event_inherited();