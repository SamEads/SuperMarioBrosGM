if (global.frozen) {
	
	image_speed = 0;
	event_inherited();
	exit;
	
}

if (!dead) {
	
	physics = false;
	image_speed = 0.125;
	
	if (!shooting) {
		
		if (instance_exists(obj_player)) {
		
			if (x >= obj_player.x)
		
				xscale = -1;
			
			else
		
				xscale = 1;
			
		}
		
		shoot_timer --;
	
		if (shoot_timer <= 0) {
			
			if (instance_exists(obj_player)) {
			
				time_to_shoot = point_distance(x,y,obj_player.x+(obj_player.hspd*20),obj_player.y);
			
				shotspd = clamp(time_to_shoot/40,3.5,4);
			
				shoot_dir = point_direction(x,y,obj_player.x,obj_player.y);
				
				shoot_timer = 60+irandom_range(10,20);
				
				shooting = true;
				
				pre_dir = shoot_dir + 60;
			
				my_dir = pre_dir;
			
				image_speed = abs(shotspd)/8;
			
			}
			
		} else if (shoot_timer < 20) {
			
			image_speed = 0;
			
		} else {
			
			x += lengthdir_x(1.2,shoot_dir);
			y += lengthdir_y(1.2,shoot_dir);
			
			shoot_dir += 10;
			
			
		}
	
	} else {
		
		time_to_shoot -= shotspd;
		
		my_dir -= 2;
		
		x += lengthdir_x(shotspd,my_dir);
		y += lengthdir_y(shotspd,my_dir);
		
		if (time_to_shoot <= 0) {
			
			shotspd -= 0.075;
			
			if (shotspd <= 2) {
		
				shooting = false;
				shotspd = 2;
				
			}
			
		}
		
	}

	if (cooldown > 0)
	
		cooldown --;

} else {
	
	physics = true;
	event_inherited();
	
}