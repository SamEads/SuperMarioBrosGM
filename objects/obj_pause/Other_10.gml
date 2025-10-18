/// @description Pause Menu Drawing

if (ww <= 0 || hh <= 0)

	exit;

draw_set_color(c_white);
draw_set_font(global.currentfont);

var _l = (display_get_gui_width()/2)-(ww/2);
var _t = (display_get_gui_height()/2)-(hh/2);
var _r = (display_get_gui_width()/2)+(ww/2);
var _d = (display_get_gui_height()/2)+(hh/2);

if (global.moderneffects)

	draw_set_alpha(0.8);

draw_rectangle_color(_l,_t,_r,_d,c_black,c_black,c_black,c_black,false);

if (global.moderneffects)

	draw_set_alpha(1);

if ((ww == max_w)
&& (hh == max_h)
&& (!adjusting)) {
	
	var _hudstyle = "SMB";
	
	switch (changehud) {
		
		default:
			_hudstyle = "SMB";
			break;
		
		case (2):
			_hudstyle = "SMA4";
			break;
			
		case (3):
			_hudstyle = "SMM2";
			break;
			
	}
	
	var _hs = string(global.scale);
	var pausespr = (global.smb2_mode) ? spr_pause_alt : spr_pause;
	
	if (window_get_fullscreen())
	
		_hs = "F.SCREEN";
	
	switch (menu) {

		case (menustate.pause):

			if (global.smb2_mode) pal_swap_set(spr_pal_coin,obj_controller.currenttheme);
			draw_sprite(pausespr,0,display_get_gui_width()/2,_t+24);
			if (global.smb2_mode) shader_reset();
			draw_text_custom(_l+16,_t+48,"CONTINUE\n\nOPTIONS\n\nQUIT TO TITLE");
			draw_sprite_ext(spr_hud_arrow,arrow_index,_l+12,_t+48+(selection*16),-1,1,0,-1,1);
			break;
	
		case (menustate.options):
		
			if (selection == 0) draw_arrows_horizontal(_l+16+string_width("HUD STYLE-"),_t+48,_hudstyle);
			if (selection == 2) draw_arrows_horizontal(_l+16+string_width("GAME SCALE-"),_t+80,_hs);
			
			if (changehud != global.hudstyle) {
				
				if (global.moderneffects)

					draw_set_alpha(0.8);
				
				draw_rectangle_color(_l,_d+8,_r,_d+8+16+16,c_black,c_black,c_black,c_black,false);
				
				if (global.moderneffects)
				
					draw_set_alpha(1);
				
				draw_set_halign(fa_center);
				
				draw_text_custom((_l+_r)/2,_d+16,"HUD WILL CHANGE\nUPON UNPAUSING");
				
				draw_set_halign(fa_left);
				
			}
			
			var _ct = "B-Y";
	
			if (global.controllertype == 1)
	
				_ct = "A-B";
		
			if (global.smb2_mode) pal_swap_set(spr_pal_coin,obj_controller.currenttheme);
			draw_sprite(pausespr,1,display_get_gui_width()/2,_t+24);
			if (global.smb2_mode) shader_reset();
			draw_text_custom(_l+16,_t+48,"HUD STYLE- "+_hudstyle+"\n\nCONTROLLER TYPE- "+_ct+"\n\nGAME SCALE- "+_hs);
			draw_sprite_ext(spr_hud_arrow,arrow_index,_l+12,_t+48+(selection*16),-1,1,0,-1,1);
			break;
	
	}
	
}