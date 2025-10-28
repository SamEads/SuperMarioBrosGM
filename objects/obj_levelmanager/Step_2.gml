/// @description Backgrounds, parallax, camera

if (!string_switch) {
	
	if (background_layer != -1) {
		
		background_layer = layer_get_id(background_layer);
		
		var col = $010000;
		
		if (layer_background_get_sprite(layer_background_get_id(background_layer)) == bgr_overworld)
		|| (layer_background_get_sprite(layer_background_get_id(background_layer)) == bgr_overworld_alt)
		|| (layer_background_get_sprite(layer_background_get_id(background_layer)) == bgr_snow)
		|| (layer_background_get_sprite(layer_background_get_id(background_layer)) == bgr_snow_alt)
		|| (layer_background_get_sprite(layer_background_get_id(background_layer)) == bgr_athletic)
		|| (layer_background_get_sprite(layer_background_get_id(background_layer)) == bgr_athletic_alt)
		|| (layer_background_get_sprite(layer_background_get_id(background_layer)) == bgr_forest) {
			
			col = $FF8676;
			
		}
		
		background_color_layer = layer_create(layer_get_depth(background_layer)+1);
		color_layer = layer_background_create(background_color_layer,-1);
		layer_background_blend(color_layer,col);
		
	} else {
		
		var a = layer_get_all();
    
		//Search through all layers
		for (var i = 0; i < array_length_1d(a); i ++) {
	
			if (layer_background_get_id(a[i]) != -1) {
				
				background_color_layer = layer_create(layer_get_depth(a[i])-5);
				color_layer = layer_background_create(background_color_layer,-1);
				layer_background_blend(color_layer,$000000);
				break;
				
			}
			
		}
		
	}
	
	if (retro_layer != -1) {
		
		retro_layer = layer_get_id(retro_layer);
		
	}
	
	for (var i = 0; i < array_length_1d(modern_layer); i ++) {
	
		if (modern_layer[i] != -1) {
		
			modern_layer[i] = layer_get_id(modern_layer[i]);
		
		}
		
	}
	
	string_switch = true;
	
}

if (background_layer != -1) {
	
	if (!layer_get_visible(background_layer) && global.moderneffects) {
		
		layer_set_visible(background_layer,true);
		
	}
	
	if (layer_get_visible(background_layer) && !global.moderneffects) {
		
		layer_set_visible(background_layer,false);
		
	}
	
}

if (background_color_layer != -1) {
	
	if (!layer_get_visible(background_color_layer) && global.moderneffects) {
		
		layer_set_visible(background_color_layer,true);
		
	}
	
	if (layer_get_visible(background_color_layer) && !global.moderneffects) {
		
		layer_set_visible(background_color_layer,false);
		
	}
	
}

if (retro_layer != -1) {
	
	if (!layer_get_visible(retro_layer) && !global.moderneffects) {
		
		layer_set_visible(retro_layer,true);
		
	}
	
	if (layer_get_visible(retro_layer) && global.moderneffects) {
		
		layer_set_visible(retro_layer,false);
		
	}
	
}

for (var i = 0; i < array_length_1d(modern_layer); i ++) {

	if (modern_layer[i] != -1) {
	
		if (!layer_get_visible(modern_layer[i]) && global.moderneffects) {
		
			layer_set_visible(modern_layer[i],true);
		
		}
	
		if (layer_get_visible(modern_layer[i]) && !global.moderneffects) {
		
			layer_set_visible(modern_layer[i],false);
		
		}
	
	}
	
}

if (instance_exists(obj_controller)) {

	if (obj_controller.fadetimer == 0 && followplayer) {
	
		var follow_player = true;
		var pre_x = camX;
	
		if (instance_exists(obj_castle_end)) {
		
			if (obj_castle_end.active)

				follow_player = false;
			
			if (!follow_player) {
			
				x += obj_castle_end.cam_hspd;
			
			}

		}
		
		if (instance_exists(obj_player) && follow_player) {
			
			if (obj_player.follow_player == false)
			
				follow_player = false;
				
		}
	
		if (instance_exists(obj_player) && follow_player) {
			
			if (!freescroll) {
	
				var _w = camera_get_view_width(view_camera[0])/2;
				var limiter = collision_rectangle(bbox_left+(x-xprevious)+_w+32,obj_player.y,bbox_left+(x-xprevious)+_w-32,obj_player.y,obj_cameralimiter,1,0);
				var go_forward = true;
				
				if (go_forward && !obj_player.inwall) {
		
					if (obj_player.x+32 > camera_get_view_width(view_camera[0])/2) && (!obj_player.poweringdown) {
			
						if ((((obj_player.x-obj_player.xprevious) > 0) || obj_player.warping) && obj_player.x+32 >= camX) && (!global.frozen) {
				
							if (obj_player.x < camX) {
			
								if (!obj_player.warping || (obj_player.y != obj_player.yprevious)) {
			
									if (obj_player.hspd >= 0)
			
										camX += clamp(obj_player.hspd-1,1,obj_player.hspd);
									
								} else if (obj_player.warping) {
								
									camX += (obj_player.x-obj_player.xprevious);
								
								}
					
							} else {
				
								if (((obj_player.x-obj_player.xprevious) > 0) && (obj_player.x > obj_player.xprevious) && obj_player.controllable && !obj_player.warping && !obj_player.climbing) {
						
									camX += (obj_player.x-obj_player.xprevious);
						
								} else if (abs(obj_player.hspd) >= 1) && (!obj_player.warping || (obj_player.y != obj_player.yprevious)) {
				
									camX += clamp(obj_player.hspd,1,abs(obj_player.hspd));
						
								} else if (obj_player.climbing && obj_player.controllable) {
									
									camX ++;
									
								} else if (obj_player.warping) {
								
									camX += (obj_player.x-obj_player.xprevious);
								
								}
					
							}
				
						}
			
					}
					
					if (obj_player.x < (camera_get_view_width(view_camera[0])/2)-32) && (camX < obj_player.x+32) {
			
						camX = obj_player.x+32;
			
					} else if (obj_player.poweringdown && obj_player.transformtimer < 40 && obj_player.transforming) {
			
						if ((camX < obj_player.x + 32) && (obj_player.hspd >= 1))
			
							camX += clamp(abs(obj_player.hspd-1),1,abs(obj_player.hspd));
			
					}
		
					y = obj_controller.set_height-(camera_get_view_height(view_camera[0])/2);
					
					y += (global.widescreen) ? -8 : 0;
					
					x = camX;
					
				}
				
				var j = 0;
				
				if (j == i) {
					
					camX = ceil_to_int(pre_x,16);
					x = camX;
					
				}
	
				
				if (limiter) {
					
					if (x+_w >= limiter.x) {
		
						x = round(limiter.x-_w);
						go_forward = false;
						
					}
	
				}
	
			} else {
				
				if (x < (camera_get_view_x(view_camera[0])+(camera_get_view_width(view_camera[0])/2))) {
					
					x = (camera_get_view_x(view_camera[0])+(camera_get_view_width(view_camera[0])/2));
					
				} else if ((obj_player.x >= (camera_get_view_x(view_camera[0])+(camera_get_view_width(view_camera[0])/2)+8)) && (obj_player.x > obj_player.xprevious)) {
			
					x += obj_player.x-obj_player.xprevious;
					
				} else if ((obj_player.x <= (camera_get_view_x(view_camera[0])+(camera_get_view_width(view_camera[0])/2)-8)) && (obj_player.x < obj_player.xprevious)) {
			
					x += obj_player.x-obj_player.xprevious;
					
				}
			
				if ((obj_player.grounded) || (obj_player.swimming && obj_player.vspd < 0)) && (!obj_player.dead) {
				
					dest_y = obj_player.y+8;
					follow_y_dir = 0;
				
				} else if (obj_player.vspd > 0) {
					
					if (obj_player.y >= camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)+32)
				
						follow_y_dir = -1;
				
				}
				
				if (obj_player.vspd <= 0)
				
					follow_y_dir = 1;
				
				if (follow_y_dir == -1 && obj_player.vspd > 0) {
					
					y += obj_player.vspd;
					dest_y = y;
					
				} else if (y > dest_y+4) {
				
					y -= 4;
				
				} else if (y > dest_y) {
					
					y = dest_y;
					
				} else if (obj_player.grounded) && (y != dest_y) {
					
					y += 4;
					
				}
				
				if (y > room_height-(camera_get_view_height(view_camera[0])/2)) {
					
					y = room_height-(camera_get_view_height(view_camera[0])/2);
					
				}
				
				if (dest_y > room_height-(camera_get_view_height(view_camera[0])/2)) {
					
					dest_y = room_height-(camera_get_view_height(view_camera[0])/2);
					
				}
			
			}
	
		}

	}

	var view_width = camera_get_view_width(view_camera[0]);
	var view_height = camera_get_view_height(view_camera[0]);
	
	_vx = x;
	_vy = y;

	_vx = clamp(_vx, (camera_get_view_width(view_camera[0])/2), room_width - (camera_get_view_width(view_camera[0])/2));
	_vy = clamp(_vy, (camera_get_view_height(view_camera[0])/2), obj_controller.set_height - (camera_get_view_height(view_camera[0])/2));
	
	camera_set_view_pos(view_camera[0],_vx-(view_width/2),_vy-(view_height/2));
	camera_set_view_angle(view_camera[0],0);

	//Parallax
	if (background_layer != -1 && global.moderneffects) {
		
		var parallax = (global.parallax) ? (_vx/2) : 0;
	
		if (theme == themetype.athletic) {
	
			if (layer_exists(background_layer)) {
		
				bg_x -= 0.125;
		
				layer_x(background_layer,bg_x+parallax);
		
			}
		
		} else if (layer_exists(background_layer)) {
		
			layer_x(background_layer,parallax);
			
		}
	
	}

}
	
#region Background fade (solid color before actual fade)

if (!start_faded) {
	
	if (!global.frozen) {
		
		bg_fade = 3;
		start_faded = true;
		hud_memory = obj_controller.draw_hud;
		obj_controller.draw_hud = false;
		event_user(0);
		
	}
	
} else if (bg_fade > 0) {
	
	bg_fade --;
	
	if (bg_fade <= 0 && bg_fade_set != -1) {
		
		bg_fade_set = 3;
		
	}
	
}

if (bg_fade_set == 3) {
	
	for (var i = 0; i < array_height_2d(memory); i ++) {
		
		layer_depth(memory[i,0],memory[i,1]);
		
	}
	
	obj_controller.draw_hud = hud_memory;
	bg_fade_set = 4;
	
}

#endregion