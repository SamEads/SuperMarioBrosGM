function draw_arrows_horizontal(_x,_y,_text) {
	
	draw_set_font(global.currentfont);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	
	if (global.smb2_mode) {
		
		draw_sprite(spr_hud_arrow_alt,arrow_index,_x,_y);
		draw_sprite_ext(spr_hud_arrow_alt,arrow_index,_x-1+ceil((string_length(_text)*8)+16)+1,_y,-1,1,0,-1,1);
		
	} else {
	
		draw_sprite(spr_hud_arrow,arrow_index,_x,_y);
		draw_sprite_ext(spr_hud_arrow,arrow_index,_x-1+ceil((string_length(_text)*8)+16),_y,-1,1,0,-1,1);
		
	}
	
}