switch (obj_controller.currentgame) {
	
	default: logo = spr_logo; break;
	case (game.smb2): logo = spr_logo_smb2; break;
	
}

//If you're not on the advanced video controls, draw the logo
//if (menu != 5) {

	pal_swap_set(spr_pal_main,obj_controller.currenttheme);

	draw_sprite(logo,0,88+40,44+32+camera_get_view_y(view_camera[0]));

	if (obj_controller.currentgame == game.smb2) {
	
		draw_sprite(logo,global.tick,209,72+camera_get_view_y(view_camera[0]));
	
	}

	shader_reset();
	
//}

draw_set_halign(fa_right);

draw_set_font(global.font_alt);

if (menu == 0) {

	if (obj_controller.currentgame == game.smb2) {
	
		if (global.smb2_mode) draw_text_color(40+176+1+16,88+32+camera_get_view_y(view_camera[0])+1,"@1986 NINTENDO",c_black,c_black,c_black,c_black,1);
		draw_text(40+176+16,88+32+camera_get_view_y(view_camera[0]),"@1986 NINTENDO");
		
	} else {
	
		draw_text(40+176,88+32+camera_get_view_y(view_camera[0]),"@1985 NINTENDO");
		
	}
	
}

draw_set_halign(fa_left);
draw_set_font(global.currentfont);

if (menu == 0) {
	
	var offset = (obj_controller.currentgame = game.smb2) ? 8 : 0;
	var more_y = (global.widescreen) ? 2 : 1;

	draw_text_custom(88,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+24+((more_y-1)*8),"1 PLAYER GAME");
	draw_text_custom(88,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+40,"OPTIONS");
	draw_sprite(spr_selector,0,72,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+24+((more_y-1)*8)+(selection_position*(16/more_y)));
	draw_text_custom(88+8-offset,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])-56,"TOP- "+string(string_replace_all(string_format(global.toppoints,6,0)," ","0")));
	
} else if (menu == 1) {
	
	if (choosing_world != 0) {
		
		if (global.smb2_mode) {
		
			draw_sprite_ext(spr_hud_arrow_up_alt,arrow_index,176+((choosing_world-1)*8),camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+8+(selection_position*16),1,1,0,-1,1);
			draw_sprite_ext(spr_hud_arrow_down_alt,arrow_index,176+((choosing_world-1)*8),camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+22+(selection_position*16),1,1,0,-1,1);
		
		} else {
			
			draw_sprite_ext(spr_hud_arrow_vertical,arrow_index,176+((choosing_world-1)*8),camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+8+(selection_position*16),1,1,0,-1,1);
			draw_sprite_ext(spr_hud_arrow_vertical,arrow_index,176+((choosing_world-1)*8),camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+31+(selection_position*16),1,-1,0,-1,1);
		
		}
		
	}
	
	for (var i = 0; i <= 2; i ++) {
		
		var pointers = 0;

		if (!is_undefined(ds_map_find_value(load_unlockedworldlevel[i+1],"complete"))) {
			
			if (ds_map_find_value(load_unlockedworldlevel[i+1],"complete") == 1)
			
				pointers ++;
			
		}
		
		if (!is_undefined(ds_map_find_value(load_unlockedworldlevel[i+1],"complete_h"))) {
			
			if (ds_map_find_value(load_unlockedworldlevel[i+1],"complete_h") == 1)
			
				pointers ++;
			
		}
		
		if (pointers >= 2) {
			
			draw_sprite(spr_complete,0,200,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+16+(i*16))
			
		}

		fileprog[i+1] = "NEW";
		var dash = "-";
		
		if (load_hardmode[i+1] > 0)
		
			dash = "*";
	
		if (loadworld[i+1] != -1) {
	
			if (loadworld[i+1] != 0) {
	
				fileprog[i+1] = string(loadworld[i+1])+dash+string(loadlevel[i+1]);
				
			} else {
				
				fileprog[i+1] = " "+string(dash+string(loadlevel[i+1]));
				
			}
			
		}
		
	}
	
	var state = "FILE";
	var dots = " ...";
	var selectspr = spr_selector;
	
	if (deleting) {
	
		state = "ERASE"
		dots = "...";
		selectspr = spr_delete;

	}

	draw_text_custom(88,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+24-8,state+" A"+dots+" "+fileprog[1]);
	draw_text_custom(88,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+40-8,state+" B"+dots+" "+fileprog[2]);
	draw_text_custom(88,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+56-8,state+" C"+dots+" "+fileprog[3]);
	draw_text_custom(88,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+72-8,"ERASE DATA");
	draw_sprite(selectspr,0,72,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+16+(selection_position*16));
	
} else if (menu == 2) {

	draw_text_custom(72,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+24-8,"ADVANCED VIDEO");
	var _hudstyle = "SMB";
	
	switch (global.hudstyle) {
		
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
	
	if ((global.hudstyle == 3) && (global.scale != 2 && global.scale != 4))
	
		_hudstyle += "*";
	
	if (selection_position == 1)
	
		draw_arrows_horizontal(160-8,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+40-8,_hudstyle);
		
	draw_text_custom(72,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+40-8,"HUD STYLE- "+_hudstyle);
	
	if (global.hudstyle == 3 && selection_position == 1 && (global.scale != 2 && global.scale != 4)) {
		
		draw_text_ext(72,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+40+8,"*BEST IN 2x OR 4x\nSCALE FOR PROPER\nHUD DISPLAY",-1,-1);
		
	} else {
		
		var _hs = string(global.scale);
	
		if (window_get_fullscreen())
	
			_hs = "F.SCREEN";
		
		draw_text_custom(72,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+72-8,"GAME SCALE- "+_hs);
		draw_text_custom(72,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+56-8,"CONFIGURE CONTROLS");
		
	}
		
	if (selection_position == 3)
		
		draw_arrows_horizontal(160,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+72-8,_hs);
	
	draw_sprite(spr_selector,0,72-16,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+24+(selection_position*16)-8);
	
} else if (menu == 3) {

	var _n = player_name(char);
	draw_text_custom(72,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+24-8,"START GAME");
	
	if (selection_position == 1) {
		
		draw_arrows_horizontal(128,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+32,_n)
		
	}
	
	draw_text_custom(72,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+40-8,"PLAYER- "+string_upper(player_name(char)));
	var _eff = "OFF";
	
	if (global.moderneffects)
	
		_eff = "ON";
		
	draw_text_custom(72,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+56-8,"MODERN EFFECTS "+_eff);
	
	var _hm = "OFF";
	
	if (global.hardmode)
	
		_hm = "ON";
	
	if (global.hardmode_unlocked)
	
		draw_text_custom(72,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+72-8,"START HARD MODE "+_hm);
		
	draw_sprite(spr_selector,0,72-16,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+24+(selection_position*16)-8);
	
} else if (menu == 4) {

	var _ct = "B-Y";
	
	if (global.controllertype == 1)
	
		_ct = "A-B";

	draw_text_custom(72,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+24+16-8,"CONFIGURE KEYBOARD\n\nCONTROLLER TYPE- "+_ct);
	draw_sprite(spr_selector,0,72-16,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+24+16+(selection_position*16)-8);
	
} else if (menu == 5) {

	var off = 0;
	var top = 16;
	
	function onoff(boolean) {
		
		return (boolean) ? "ON" : "OFF";	
		
	}

	draw_text_custom(72,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+top+off,"TOGGLE WIDESCREEN"); off += 16;
	draw_text_custom(72,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+top+off,"MODERN PARALLAX- "+onoff(global.parallax)); off += 16;
	draw_text_custom(72,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+top+off,"VERTICAL SYNC- "+onoff(global.vsync)); off += 16;
	
	draw_sprite(spr_selector,0,72-16,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+top+(selection_position*16));
	
}