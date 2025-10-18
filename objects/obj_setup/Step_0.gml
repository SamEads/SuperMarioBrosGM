switch (state) {
	
	case (0):
	
		if (player_x < 8) {
			
			if (hspd < 1.5625)
		
				hspd += 0.125;
			
		} else if (hspd > 0) {
		
			hspd -= 0.05625;
			
			if (hspd <= 0) {
			
				hspd = 0;
				player_spr = spr_mario_small_idle;
				state = 1;
				
			}
			
		}
	
		break;
	
}

if (state > 0) {

	if (keyselection < 8) {

		if (keyboard_check_pressed(vk_anykey)) {
		
			var add_key = true;
	
			key[keyselection] = keyboard_key;
		
			for (var i = 0; i < keyselection; i ++) {
			
				if (key[keyselection] == key[i]) {
			
					audio_play_stop_sound(snd_incorrect,0,0);
					add_key = false;
				
				}
				
			}
		
			if (add_key) {
		
				switch (keyselection) {
				
					case (0):
						player_xscale = -1;
						break;
					
					case (1):
						player_xscale = 1;
						break;
					
					case (3):
						player_spr = spr_mario_small_crouch;
						break;
					
					case (4): 
						audio_play_sound(snd_jump_small,0,0);
						player_spr = spr_mario_small_jump;
						vspd = -3;
						grav = 0.2;
						break;
				
				}
		
				keyselection ++;
			
			}
	
		}
	
	} else {
	
		if (keyboard_check_pressed(vk_enter)) {
	
			global.lkey = key[0];
			global.rkey = key[1];
			global.ukey = key[2];
			global.dkey = key[3];
			global.abutton = key[4];
			global.bbutton = key[5];
			global.start = key[6];
			global.select = key[7];
			obj_controller.visible = true;
			fadeout = 30;
	
		} else if (keyboard_check_pressed(vk_escape)) {
		
			for (var i = 0; i < array_length_1d(key); i ++) {
			
				key[i] = "";
			
			}
		
			keyselection = 0;
		
		}
	
	}

	if (fadeout > 0) {

		fadeout --;
	
		if (fadeout <= 0) {
	
			if (global.last_room == global.current_title)
			
				room_goto(global.current_title);
			
			else
			
				room_goto(rm_presents);
			
		}
	
	}

}

arrow_index += 0.0375;

if (arrow_index >= 2)

	arrow_index -= 2;
	
player_img += abs(hspd)/6;
player_x += hspd;

if (vspd > 0)

	grav = 0.4375;

vspd += grav;
player_y += vspd;

if (player_y > player_y_start) {

	player_y = player_y_start;
	grav = 0;
	vspd = 0;
	player_spr = spr_mario_small_idle;
	
}

var view_width = camera_get_view_width(view_camera[0]);
var view_height = camera_get_view_height(view_camera[0]);
	
_vx = 0;
_vy = room_height;

_vx = clamp(_vx, (camera_get_view_width(view_camera[0])/2), room_width - (camera_get_view_width(view_camera[0])/2));
_vy = clamp(_vy, (camera_get_view_height(view_camera[0])/2), room_height - (camera_get_view_height(view_camera[0])/2));
	
camera_set_view_pos(view_camera[0],_vx-(view_width/2),_vy-(view_height/2));