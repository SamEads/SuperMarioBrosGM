/// @description Draw screen & HUD elements

var _scale = 3.75;

draw_set_color(c_white);
draw_set_halign(fa_left);

draw_set_color($262626);
draw_rectangle(-display_get_gui_width(),0,0,display_get_gui_height(),false);
draw_rectangle(display_get_gui_width(),0,display_get_gui_width()*2,display_get_gui_height(),false);
draw_set_color(c_white);

for (var i = 0; i < display_get_gui_height()/_scale; i ++) {
	
	draw_sprite_ext(spr_border_switch,0,0,(i*(16/_scale)),-1/(_scale),1/(_scale),0,-1,1);
	draw_sprite_ext(spr_border_switch,0,display_get_gui_width(),(i*(16/_scale)),1/(_scale),1/(_scale),0,-1,1);
	
}

if ((fadetimer > 0 && bg_fade == 0) || (levelstart <= 15 && levelstart > 0)) {
	
	draw_set_color(c_black);
	draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),false);
	draw_set_color(c_white);
	
	if (!global.moderneffects)
	
		exit;
	
}

var shake = 0;

if (shake_length > 0) {
	
	shake = choose(-2,-1,0,1,2);
	
}

draw_set_halign(fa_left);

if (global.moderneffects) { pal_swap_set(spr_pal_screen,1); }

if (!sprite_exists(global.pausebgsurface)) {

	draw_surface_stretched(application_surface,0,0+shake,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]));
	
} else {

	gpu_set_blendenable(false);
	draw_sprite_stretched(global.pausebgsurface,0,0+shake,0,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]));
	gpu_set_blendenable(true);

}

if (levelstart == 0)

	with (obj_waterlevel_above)

		if (surface_exists(_ss) && global.moderneffects && obj_controller.fadealpha < 1)

			draw_surface_stretched(_ss,0,0+shake,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]));

draw_set_color(c_white);

shader_reset();
	
with (obj_pause)

	event_user(0);
	
if (global.moderneffects && draw_hud)

	event_user(5);

if (levelstart < 15 && levelstart > 0) && (!global.moderneffects) exit;

var makehudsurf = false;

if (!draw_hud)

	makehudsurf = false;

else if (hudsurf == -1) {
	
	makehudsurf = true;
	
} else if (hw != round(display_get_width())) {
	
	surface_free(hudsurf);
	makehudsurf = true;
	
} else if (!surface_exists(hudsurf))

	makehudsurf = true;

if (makehudsurf) {
	
	hudsurf = surface_create(round(display_get_width()),round(display_get_height()));
	hw = surface_get_width(hudsurf);
	_dw = display_get_width();
	_dh = display_get_height();
	_d_gui_w = display_get_gui_width();
	_d_gui_h = display_get_gui_height();
	
}

if (draw_hud) {

	if surface_exists(hudsurf) {

		surface_set_target(hudsurf);

		camera_set_view_size(_cam,round(_d_gui_w),round(_d_gui_h));
		camera_apply(_cam);

		draw_clear_alpha(c_black,0);

		if (global.hudstyle == 3 && (bg_fade <= 0 || global.moderneffects)) {
	
			draw_set_halign(fa_left);
			draw_set_font(global.currentfont);
	
			var hud_left_x_offset = 18;
	
			var clives = global.p_lives[char];
			
			var dispP = char;
			
			if (global.scale == 2 || global.scale == 4) {
				
				var sprite;
				
				sprite = player_anim("_head");
			
				pal_swap_set_char(char,0);
		
				draw_sprite_ext(sprite,0,hud_left_x_offset+2,12.5,0.5,0.5,0,c_white,1);
				
				shader_reset();
			
			} else {
				
				draw_text_custom(hud_left_x_offset-2,13,string_char_at(player_name(dispP),1));
				
			}

			draw_text_custom(hud_left_x_offset+7,12,"x");
			draw_set_color(c_white);
			draw_text_custom(hud_left_x_offset+16,13,string_replace_all(string_format(clives,2,0)," ","0"));
			
			draw_set_alpha(1);
	
			var coin_y_offset = 2;
			
			var hudcoin;
			
			switch (global.smb2_mode) {
			
				default: hudcoin = spr_hud_coin; break;
				case (true): hudcoin = spr_hud_coin_smb2; break;
			
			}
	
			if (instance_exists(obj_levelmanager)) pal_swap_set(spr_pal_hudcoin,currenttheme);
			draw_sprite(hudcoin,global.tick,hud_left_x_offset-2,22+coin_y_offset);
			shader_reset();

			draw_set_halign(fa_left);

			draw_set_color(c_white);
			var coinvis = string_replace_all(string_format(displaycoins,2,0)," ","0");
			draw_text_custom(hud_left_x_offset+7,21+coin_y_offset,"x");
			draw_text_custom(hud_left_x_offset+16,22+coin_y_offset,string_hash_to_newline(string(coinvis)));

			draw_set_color(c_white);

			draw_set_halign(fa_right);
			
			var hud_right_x_offset = 16;

			var scorevis = string_replace_all(string_format(global.points,9,0)," ","0");

			draw_set_color(c_white);
			draw_set_alpha(1);
			draw_text_custom(display_get_gui_width()-44-hud_right_x_offset,13,string_hash_to_newline(scorevis));

			draw_set_color(c_white);
			draw_set_alpha(1);
			
			if (global.smb2_mode) {
				
				pal_swap_set(spr_pal_font,obj_controller.currenttheme);
				draw_sprite_ext(spr_time,2,display_get_gui_width()-35-hud_right_x_offset,13,1,1,0,c_white,1);
				shader_reset();
				
			} else
			
				draw_sprite(spr_time,1,display_get_gui_width()-35-hud_right_x_offset,13);

			draw_set_color(c_white);
			draw_set_alpha(1);
			
			if (showtime || global.moderneffects) draw_text_custom(display_get_gui_width()-hud_right_x_offset,13,string_hash_to_newline(string(displaytime)));
	
		}

		shader_reset();

		surface_reset_target();
	
	}
	
} else if (surface_exists(hudsurf))

	surface_free(hudsurf);

if (global.moderneffects) { pal_swap_set(spr_pal_screen,1); }

if (surface_exists(hudsurf))

	draw_surface_stretched(hudsurf,0,0,round(display_get_gui_width()),round(display_get_gui_height()));
	
shader_reset();

if (global.moderneffects && fadealpha != 0) {
	
	draw_set_color(c_black);
	
	draw_set_alpha(fadealpha);
	
	draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),false);
	
	draw_set_alpha(1);
	
	draw_set_color(c_white);
	
}

if (show_fps) {

	draw_set_font(global.currentfont);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_left);
	var disptxt = "";
	disptxt += "FPS "+string(ceil(shown_fps/5)*5);
	
	/*if (global.debugmode) {
	
		if (instance_exists(obj_player)) {
		
			disptxt += "\nHSPD "+string(obj_player.hspd);
			disptxt += "\nVSPD "+string(obj_player.vspd);
			disptxt += "\nGROUNDED "+string(obj_player.grounded);
		
		}
	
	}*/
	
	var _w = string_width(disptxt);
	var _h = string_height(disptxt);
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(0,display_get_gui_height(),_w+1,display_get_gui_height()-_h-3,false);
	draw_set_alpha(1);
	//draw_text_custom(2,display_get_gui_height(),disptxt);
	draw_set_color(c_white);
	draw_text_custom(1,display_get_gui_height()-1,disptxt);
	draw_set_valign(fa_top);
	
}

draw_set_valign(fa_bottom);

draw_set_valign(fa_top);

if (draw_black)

	draw_clear(c_black);