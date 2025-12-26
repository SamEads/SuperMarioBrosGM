if (global.frozen) {
	
	image_speed = 0;
	event_inherited();
	exit;
	
} else if (dead) {
	
	depth = -3;
	
	if (!global.moderneffects)
	
		instance_destroy();
		
	else {
	
		event_inherited();
		image_speed = 0;
		exit;
		
	}
	
} else {
	
	image_speed = 0.125;
	
}

if (color == 0) {

	if (!global.moderneffects)

		swap_palette = true;
	
	else if (obj_controller.currenttheme == themetype.water)

		swap_palette = false;
	
	else

		swap_palette = true;
		
}

if (state == 0) {
	
	if (standtimer >= wait_timer) {
		
		if (instance_exists(obj_player)) {
		
			if (point_distance(x,y,obj_player.x,y) > player_distance) {
		
				standtimer = 0;
				state ++;
			
			}
			
		} else {
			
			standtimer = 0;
			state ++;
				
		}
		
	} else standtimer ++;
	
}

if (state == 1) {

	if (point_distance(x,y,xstart,ystart) < distance) {

		x += lengthdir_x(spd,dir);
		y += lengthdir_y(spd,dir);
		
	} else {
		
		state = 2;
		
	}
	
}

if (state == 2) {
	
	standtimer ++;
	
	if (standtimer >= stand_timer) {
		
		standtimer = 0;
		state ++;
		
	}
	
}

if (state == 3) {
	
	if (point_distance(x,y,xstart,ystart) > spd) {

		x += lengthdir_x(spd,dir+180);
		y += lengthdir_y(spd,dir+180);
		
	} else {
		
		state = 0;
		
	}
	
}

if (cooldown > 0) cooldown --;

ang = dir-90;
image_angle = ang;