if (global.moderneffects) {
		
	_xx = 0;
	_yy = 0;
		
}

if (global.hudstyle == 0) {

	draw_set_color(c_white);

	//Player name
	draw_set_font(global.currentfont);
	var tmp = global.currentfont;
	
	if (currenttheme == themetype.castle && global.widescreen) {
		
		draw_set_font(global.font_smb2);
		
	}

	if instance_exists(obj_player) char = obj_player.char;

	str = string_upper(player_name(char));

	var extra = 0;

	if (string_length(str) > 7 && !global.widescreen)
	
		extra = (string_length(str)-7)*8;

	draw_text_custom(_xx+24-extra,_yy+16,str);

	//Score
	var scorevis = string_replace_all(string_format(global.points,6,0)," ","0");
	draw_text_custom(_xx+24,_yy+24,scorevis);

	//Coins
	if (instance_exists(obj_levelmanager)) pal_swap_set(spr_pal_hudcoin,currenttheme);
		
	var hudcoin;
		
	switch (global.smb2_mode) {
			
		default: hudcoin = spr_hud_coin; break;
		case (true): hudcoin = spr_hud_coin_smb2; break;
			
	}
		
	draw_sprite(hudcoin,global.tick,_xx+(_ww/2)-(_ww/8)-8,_yy+24);
	shader_reset();
	draw_text_custom(_xx+(_ww/2)-(_ww/8),_yy+24,"x");
	var coinvis = string_replace_all(string_format(displaycoins,2,0)," ","0");
	draw_text_custom(_xx+(_ww/2)-(_ww/8)+8,_yy+24,coinvis);

	//World
	draw_text_custom(_xx+(_ww/2)+(_ww/8)-16,_yy+16,"WORLD");
	draw_text_custom(_xx+(_ww/2)+(_ww/8)-8,_yy+24,displaylevel);

	//Time
	draw_text_custom(_xx+_ww-56,_yy+16,"TIME");
	var timevis = string_replace_all(string_format(displaytime,3,0)," ","0");
	if (showtime || global.moderneffects) draw_text_custom(_xx+_ww-48,_yy+24,timevis);
	
	draw_set_font(tmp);
	
}

if (global.hudstyle == 1) {
	
	draw_set_font(global.currentfont);
	
	//Score
	draw_set_halign(fa_right);
	draw_text_custom(_xx+(_ww/2)-(_ww/8)-4,_yy,global.points);
	draw_set_halign(fa_left);
	
	//Coins
	if (instance_exists(obj_levelmanager)) pal_swap_set(spr_pal_main,currenttheme);
	draw_sprite(spr_hud_coin,global.tick,_xx+(_ww/2)-(_ww/8)+8,_yy);
	shader_reset();
	draw_text_custom(_xx+(_ww/2)-(_ww/8)+16,_yy,"x");
	var coinvis = string_replace_all(string_format(displaycoins,2,0)," ","0");
	draw_text_custom(_xx+(_ww/2)-(_ww/8)+24,_yy,coinvis);
	
	//Time
	draw_set_halign(fa_right);
	var timevis = string_replace_all(string_format(displaytime,3,0)," ","0");
	draw_sprite(spr_time,0,_xx+_ww-string_width(timevis)-8,_yy);
	if (showtime || global.moderneffects) draw_text_custom(_xx+_ww,_yy,timevis);
	draw_set_halign(fa_left);
	
}

if (global.hudstyle == 2) {

	draw_set_color(c_white);

	//Player name
	draw_set_font(global.currentfont);

	if instance_exists(obj_player) char = obj_player.char;

	str = string_upper(string_char_at(player_name(char),0))+"x";

	draw_text_custom(_xx+(_ww/2)-(_ww/4)+12,_yy,str);
	draw_set_halign(fa_right);
	draw_text_custom(_xx+(_ww/2)-(_ww/4)+44,_yy,string(global.p_lives[char]))
	draw_set_halign(fa_left);
	
	//Time
	var timevis = string_replace_all(string_format(displaytime,3,0)," ","0");
	draw_sprite(spr_time,0,_xx+(_ww/2)-10,_yy);
	if (showtime || global.moderneffects) draw_text_custom(_xx+(_ww/2)-2,_yy,timevis);
	
	//Coins
	if (instance_exists(obj_levelmanager)) pal_swap_set(spr_pal_main,currenttheme);
	draw_sprite(spr_hud_coin,global.tick,_xx+(_ww/2)+(_ww/4)-32,_yy);
	shader_reset();
	var coinvis = string_replace_all(string_format(displaycoins,2,0)," ","0");
	draw_text_custom(_xx+(_ww/2)+(_ww/4)-24,_yy,coinvis);

	//Score
	var scorevis = string_replace_all(string_format(global.points,7,0)," ","0");
	draw_set_halign(fa_right);
	draw_text_custom(_xx+_ww-8,_yy,scorevis);
	draw_set_halign(fa_left);

	//World
	draw_text_custom(_xx+8,_yy,"WORLD "+string(global.world));
	
}

if (room != global.current_title) {
		
	if (char == chara.custom && (sign(health_based) == 1)) {
			
		var hx = _xx+23;
		var hy = _yy+32;
			
		switch (global.hudstyle) {
				
			case (3): hx = _xx+23-8; hy = _yy+34; break;
			case (2): hx = _xx+23-16; hy = _yy+32-16-8; break;
				
		}
		
		var shakeamt = clamp(clamp(global.p_maxhealth[char],13,global.p_maxhealth[char])-13,0,1000);
	
		for (var i = 0; i < global.p_maxhealth[char]; i ++) {
		
			var _h = 0;
		
			if (global.p_health[char] <= i) {
			
				_h = 1;
			
			}
			
			var y_grab = (health_based != 2) ? (i*16) : 0;
			var x_grab = (health_based == 2) ? (i*16) : 0;
		
			pal_swap_set(spr_pal_hudcoin,currenttheme);
			draw_sprite_ext(spr_health,_h,hx+(shakeamt*random_range(-1,1))+x_grab,hy+(shakeamt*random_range(-1,1))+y_grab,1,1,0,-1,1);
			shader_reset();
		
		}
			
	}
		
}