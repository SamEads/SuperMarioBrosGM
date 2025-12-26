/// @description Shell logic

if (global.frozen) {
	
	event_inherited();
	exit;
	
}

// Inherit the parent event
event_inherited();

if (dead) exit;

// Make a bump sound
if (collision_rectangle(bbox_right, bbox_top+5, bbox_right+abs(hspd), bbox_bottom-4, obj_solid, 1, 0) && hspd > 0) || (collision_rectangle(bbox_left-abs(hspd), bbox_top+5, bbox_left, bbox_bottom-4, obj_solid, 1, 0) && hspd < 0) {

    if (moving && !collision_rectangle(bbox_left-abs(hspd), bbox_top+5, bbox_right+abs(hspd), bbox_bottom-4, obj_block_parent, 1, 0)) {
		
		if point_in_rectangle(x,y,camera_get_view_x(view_camera[0])-16,camera_get_view_y(view_camera[0])-16,camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])+16,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])+16) {
    
			audio_play_stop_sound(snd_bump,0,0);
		
		}
        
    }
    
}

if (wallframe)

	audio_play_stop_sound(snd_bump,0,0);

if (global.moderneffects) {

	//Hit block from sides
	var blockparent = collision_rectangle(bbox_left-(abs(hspd)),bbox_top+1+abs(vspd),bbox_right+(abs(hspd)),bbox_bottom-1-vspd,obj_block_parent,0,1);

	if (blockparent) {
	
		if (kicker != noone) {
	
			if (kicker != noone) {
	
				if (collision_rectangle(bbox_left-(abs(hspd)),bbox_top+1+abs(vspd),bbox_right+(abs(hspd)),bbox_bottom-1-vspd,obj_qblock,0,1))
				
					blockparent.hitsize = kicker.powerup;
				
			}
		
			blockparent.hitter = kicker.id;
		
		}
				
		if (blockparent.can_hit) {
				
			blockparent.hitsequence = 1;
			audio_play_stop_sound(snd_bump,0,0);
			hspd = -hspd;
					
		}
				
	}
	
}

if (extracooldown > 0)

	extracooldown --;

if (!moving && grounded && vspd == 0)

	hspd = 0;
	enemyturn = true;
	
if (grounded)

	extra_points = false;
	
if (moving) {
	
	enemyturn = false;
	extra_points = false;
	
	if (vspd > 0 && vspd < 1)
		
		vspd = 1;
	
	switch (global.moderneffects) {
		
		case (true):
	
			switch (color) {
		
				case (0): sprite_index = spr_shell_moving; break;
				case (1): sprite_index = spr_shell_red_moving; break;
				case (2): sprite_index = spr_shell_blue_moving; break;
		
			}
			
			image_speed = abs(hspd)/10;
			
			break;
			
		case (false):
		
			switch (color) {
		
				case (0): sprite_index = spr_shell; break;
				case (1): sprite_index = spr_shell_red; break;
				case (2): sprite_index = spr_shell_blue; break;
		
			}
			
			image_speed = 0;
			image_index = 0;
			
			break;
			
	}
	
	shelltimer = -1;
	
} else {
	
	switch (color) {
		
		case (0): sprite_index = spr_shell; break;
		case (1): sprite_index = spr_shell_red; break;
		case (2): sprite_index = spr_shell_blue; break;
		
	}
	
	if (shelltimer == -1) {
	
		shelltimer = 300;
		
	}
	
	if (!inhabited) {
		
		image_speed = 0;
		image_index = 0;
	
	} else if (shelltimer > 0) {
		
		shelltimer --;
	
		if (shelltimer <= 90) {
			
			image_speed = 0.125;
			
		} else {
			
			image_speed = 0;
			
			if (grounded && vspd >= 0 && !extra_points)
			
				image_index = 0;
			
		}
	
	} else {
		
		image_speed = 0;
		
		if (grounded && vspd >= 0 && !extra_points)
		
			image_index = 0;
		
	}
	
	if (extra_points)
	
		image_speed = 0.1;
	
	if (shelltimer <= 0) {
		
		koopa = noone;
		
		if (color == 0)
		
			koopa = instance_create_depth(x,y,depth,obj_koopa_green);
			
		else if (color == 1)
		
			koopa = instance_create_depth(x,y,depth,obj_koopa_red);
			
		else if (return_instance != -1)
		
			koopa = instance_create_depth(x,y,depth,return_instance);
			
		if (koopa != noone) {
			
			with (koopa) {
				
				switch_spawns(other.id);
				
				if (global.moderneffects) {
				
					if (instance_nearest(x,y,obj_player).x > x) {
					
						xscale = 1;
						hspd = abs(hspd);
					
					} else {
					
						xscale = -1;
						hspd = -abs(hspd);
					
					}
					
				} else {
					
					xscale = choose(-1,1);
					hspd = abs(hspd)*xscale;
					
				}
				
			}
			
		}
			
		instance_destroy();
			
	}
	
}

if (throw_timer <= 0) {

	if (!grounded && abs(hspd) > 2 && moving) {
	
		hspd -= 0.7*sign(hspd);
	
	} else if (moving && grounded) {
	
		hspd = 3.5*sign(hspd);
	
	}
	
} else

	throw_timer --;

if (global.moderneffects) {
	
	if (instance_place(x,y,obj_coin) && moving) {
		
		with (instance_place(x,y,obj_coin)) {
		
			collected = true;
			instance_destroy();
			
		}
		
	}
	
}

if (moving && bbox_left > camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])+128)

	instance_destroy();
	
deathsprite = sprite_index;
stompsprite = sprite_index;