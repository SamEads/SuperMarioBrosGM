/// @description Draw non-GUI HUD elements

_xx = camera_get_view_x(view_camera[0]);
_yy = camera_get_view_y(view_camera[0]);
_yy += (global.widescreen) ? 0 : 0;
_ww = camera_get_view_width(view_camera[0]);
_hh = camera_get_view_height(view_camera[0]);

draw_set_font(global.currentfont);
draw_set_halign(fa_left);

#region Manage extra background fade checks that occur post-End Step

if (!global.moderneffects) {

	if (fadetimer > 0) {

		if (fadetimercheck != true) {
		
			if (bg_fade == -1) {
		
				bg_fade = 0;
		
				with (obj_levelcontrol) {
			
					other.bg_fade = 3;
					event_user(0);
			
				}
		
			}
		
		}

		fadetimercheck = true;
	
	} else {
	
		fadetimercheck = false;
	
	}

}

#endregion

if (levelstart > 0 && ((fadetimer <= 0) || (!global.moderneffects && bg_fade == 0)) || global.gameover) {

	draw_set_color(c_black);

	draw_rectangle(_xx,0,_xx+_ww,0+room_height,false);

	draw_set_color(c_white);
	
	if (!global.gameover) {
		
		if (timeup) {
			
			draw_set_halign(fa_center);
		
			draw_text_custom(_xx+(_ww/2),_yy+(_hh/2),"TIME UP");
		
			draw_set_halign(fa_left);
			
		} else if (levelstart > 15 || global.moderneffects) {

			draw_set_halign(fa_center);

			draw_text_custom(_xx+(_ww/2)-4,_yy+(_hh/2)-32,"WORLD "+displaylevel);

			draw_set_halign(fa_left);

			draw_text_custom(_xx+(_ww/2)-8,_yy+(_hh/2),"x ");
			
			draw_set_font(global.currentfont);
			draw_set_color(c_white);
			draw_set_halign(fa_left);
	
			if (selecting_player) {
	
				var x_off = 0;
				
				if ((char == chara.toadette && powerup == itemtype.id_small))
				
					x_off = -2;
					
				else if (char == chara.toadette && powerup != itemtype.id_small)
					
					x_off = -5;
					
				else if (powerup != itemtype.id_small)
				
					x_off = -1;
	
				draw_sprite(spr_hud_arrow,arrow_index,_xx+(_ww/2)-41+x_off,_yy+(_hh/2));
				draw_sprite_ext(spr_hud_arrow,arrow_index,_xx+(_ww/2)-7,_yy+(_hh/2),-1,1,0,-1,1);
			
			}

			draw_set_halign(fa_right);

			if (global.p_lives[char] >= 10 && global.p_lives[char] <= 19) {
				
				draw_sprite(spr_complete,0,_xx+(_ww/2)+8,_yy+(_hh/2));
				draw_text_custom(_xx+(_ww/2)+24,_yy+(_hh/2),string_char_at(string(global.p_lives[char]),string_length(string(global.p_lives[char]))));
				
			} else {
				
				if (global.p_lives[char] < 99) {

					draw_text_custom(_xx+(_ww/2)+24,_yy+(_hh/2),string(global.p_lives[char]));
					
				} else {
					
					draw_text_custom(_xx+(_ww/2)+24,_yy+(_hh/2),"99+");
					
				}
				
			}

			draw_set_halign(fa_left);

			var dispP = char;
				
			var sprite;
			
			if (!global.moderneffects) {
				
				sprite = player_anim("_head");
			
				pal_swap_set_char(char,0);
			
				draw_sprite_ext(sprite,0,_xx+(_ww/2)-24,_yy+(_hh/2)-7,1,1,0,c_white,1);
				
			} else {
				
				sprite = player_anim("_head");
				
				var pal = 0;
				
				if (instance_exists(obj_player))
				
					pal = obj_player.pal;
			
				pal_swap_set_char(char,pal);
				
				var subimg = (powerup == itemtype.id_small) ? 0 : 1;
					
				draw_sprite_ext(sprite,subimg,_xx+(_ww/2)-24,_yy+(_hh/2)-7,1,1,0,c_white,1);
				
				
			}
			
			shader_reset();
	
		} else exit;
	
	} else {
		
		draw_set_halign(fa_center);
		
		draw_text_custom(_xx+(_ww/2),_yy+(_hh/2),"GAME OVER");
		
		draw_set_halign(fa_left);
		
	}

}

if (draw_hud && !global.moderneffects) {

	event_user(5);

}

draw_set_halign(fa_left);