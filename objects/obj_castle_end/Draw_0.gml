if (!peach) {

	var _toad = 0;
	var visible_toad_x = toad_x;
	
	if (!global.moderneffects)
	
		visible_toad_x = floor(toad_x);

	if (do_toad_animation)
		
		_toad = toad;

	switch (_toad) {
		
		default:
		
			draw_sprite(sprite_index,toadindex,round(x),y+1+toadjump);
			
			break;
			
		case (1):
		
			if (bag_position == -1)
				
				draw_sprite(bag_sprite,bag_index,round(x)+8,y+1);
		
			if (draw_toad)
			
				draw_sprite(sprite_index,toadindex,round(x)+8,y+1+toadjump);
				
			if (bag_position == 1)
				
				draw_sprite(bag_sprite,bag_index,round(x)+8,y+1);
			
			break;
			
		case (2):
		
			if (bag_position == -1)
				
				draw_sprite(bag_sprite,bag_index,round(x)+16,y+1);
		
			if (draw_toad) {
			
				draw_sprite(sprite_index,toadindex,round(x)-visible_toad_x+16,y+1+toadjump);
				draw_sprite_ext(sprite_index,toadindex,round(x)+visible_toad_x+16,y+1+toadjump,-1,1,0,-1,1);
				
			}
				
			if (bag_position == 1)
				
				draw_sprite(bag_sprite,bag_index,round(x)+16,y+1);
			
			break;
			
		case (3):
		
			if (bag_position == -1)
				
				draw_sprite(bag_sprite,bag_index,round(x)+16+16,y+1);
		
			if (draw_toad) {
			
				//Left
				draw_sprite_ext(toad2sprite,toadindex,round(x)+16+16-visible_toad_x,y+1+toadjump,-1,1,0,-1,1);
				
				//Right
				draw_sprite(toad2sprite,toadindex,round(x)+16+16+visible_toad_x,y+1+toadjump);
				
				//Center
				draw_sprite(sprite_index,toadindex,round(x)+16+16,y+1+toadjump)
				
			}
				
			if (bag_position == 1)
				
				draw_sprite(bag_sprite,bag_index,round(x)+16+16,y+1);
			
			break;
			
		case (4):
		
			if (bag_position == -1)
				
				draw_sprite(bag_sprite,bag_index,round(x)+8,y+1);
		
			if (draw_toad) {
			
				draw_sprite(sprite_index,toadindex,round(x)+8,y+1+toadjump);
				
			}
				
			if (bag_position == 1)
				
				draw_sprite(bag_sprite,bag_index,round(x)+8,y+1);
			
			break;
			
		case (5):
		
			if (bag_position == -1)
				
				draw_sprite(bag_sprite,bag_index,round(x)+8,y+1);
		
			if (draw_toad) {
			
				draw_sprite_ext(sprite_index,toadindex,round(x)+8+toad_x,y+1+toadjump,1,1,ang,-1,1);
				
			}
				
			if (bag_position == 1)
				
				draw_sprite(bag_sprite,bag_index,round(x)+8,y+1);
			
			break;
			
		case (6):
		
			if (bag_position == -1)
				
				draw_sprite(bag_sprite,bag_index,round(x)+8,y+1);
		
			if (draw_toad) {
				
				if (toad_timer >= 60) {
			
					for (var i = 0; i < 4; i ++) {
			
						draw_sprite_ext(spr_toad_walk_canoe,toadindex,round(x)+toad_x+21-(i*9),y+1,1,1,ang,-1,1);
					
					}
					
				}
				
				var extra_y = 0;
				
				if (floor(toadindex) == 1)
				
					extra_y = 1;
				
				draw_sprite_ext(sprite_index,toadindex,round(x)+8+toad_x,y+1+toadjump+extra_y,1,1,ang,-1,1);
				
			}
				
			if (bag_position == 1)
				
				draw_sprite(bag_sprite,bag_index,round(x)+8,y+1);
			
			break;
			
		case (7):
		
			if (bag_position == -1)
				
				draw_sprite(bag_sprite,bag_index,round(x)+8,y+1);
		
			if (draw_toad) {
			
				for (var i = 0; i < 6; i ++) {
					
					if (toad_x-12-(i*10) > 0)
			
						draw_sprite_ext(toad2sprite,toadindex,round(x)+toad_x-4-(i*10),y+1,1,1,ang,-1,1);
					
				}
				
				draw_sprite_ext(sprite_index,toadindex,round(x)+12+toad_x,y+1+toadjump,1,1,ang,-1,1);
				
			}
				
			if (bag_position == 1)
				
				draw_sprite(bag_sprite,bag_index,round(x)+8,y+1);
			
			break;

	}

} else {
	
	var _m = 0;
	
	if (do_toad_animation)
	
		_m = peach_x_extra-8;
	
	draw_sprite_ext(peachsprite,peachindex,x+peach_x+(_m),y+1+peach_y,-1,1,0,-1,1);
	
}

_xx = camera_get_view_x(view_camera[0]);
_yy = camera_get_view_y(view_camera[0]);
_ww = camera_get_view_width(view_camera[0]);
_hh = camera_get_view_height(view_camera[0]);

if (show_thankyou) {
	
	draw_set_halign(fa_center);

	var player = "BITCH";
	
	if (instance_exists(obj_player)) {
		
		with (instance_nearest(x,y,obj_player)) {
			
			player = string_upper(player_name(char));
			
		}
		
	}
	
	var _w = camera_get_view_width(view_camera[0]);
	
	var thankyou_x = (_ww)-128;
	
	var princess_y = 0;
	
	if (peach)
	
		princess_y = -8;
	
	if (_w < 256)
		
		thankyou_x = (_ww/2);

	draw_text_custom(_xx+thankyou_x,_yy+(_hh/2)-32-8+princess_y,"THANK YOU "+player+"!");

	draw_set_halign(fa_left);
	
	var princess_x = (_ww)-214;
	
	if (_w < 256)
		
		princess_x = (_ww/2)-86;
		
	if (peach == false) {

		if (endtimer >= 120) {
		
			draw_text_custom(_xx+princess_x,_yy+(_hh/2)-8+princess_y,"BUT OUR PRINCESS IS IN\n\nANOTHER CASTLE!");
		
		}
		
	} else if (endtimer >= 220) {
		
		if (!hardtext)
		
			draw_text_custom(_xx+princess_x+16,_yy+(_hh/2)+princess_y,"YOUR QUEST IS OVER.");
			
		else
		
			draw_text_custom(_xx+princess_x-24,_yy+(_hh/2)+princess_y,"THE KINGDOM HAS BEEN SAVED.");
		
		if (endtimer >= 340) {
		
			if (!hardtext)
		
				draw_text_custom(_xx+princess_x-16,_yy+(_hh/2)+16+princess_y,"WE PRESENT YOU A NEW QUEST.");
				
			else
			
				draw_text_custom(_xx+princess_x-16,_yy+(_hh/2)+16+princess_y,"HURRAH TO OUR HERO "+player+"!");
			
		}
		
	}

	draw_set_halign(fa_left);
	
}