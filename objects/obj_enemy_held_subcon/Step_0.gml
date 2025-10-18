if (global.frozen) exit;

if (thrown) {
	
	grav = 0.15625;
	
	if (vspd < -2 && !hit_object)
	
		vspd = -2;
	
	bouncy = true;
	
	if (!hit_object && !quick_throw && physics)
	
		physics_collision(false,true);
		
	else {
		
		vspd += grav;
		y += vspd;
		x += hspd;
		
	}
	
	if (indexed_throw_y == -1) {
		
		indexed_throw_y = y;
		
	} else if (quick_throw && (y >= indexed_throw_y+16) && !hit_object) {
		
		y = indexed_throw_y+16;
		ret_obj = instance_create_depth(x,y,depth,return_object);
		instance_destroy();
			
	}
	
	if (return_object_alt != -1) {
		
		ret_obj = instance_create_depth(x,y,depth,return_object_alt);
		ret_obj.color = color;
		
		if ((ret_obj.object_index == obj_shell)
		|| (ret_obj.object_index == obj_shell_beetle)) {
		
			ret_obj.moving = true;
			ret_obj.hspd = 3.5*(sign(hspd)+(abs(hspd)/8));
			ret_obj.cooldown = 8;
			ret_obj.throw_timer = 10;
			ret_obj.kicker = thrower;
			
		}
			
		instance_destroy();
	
	} else if (bouncing) {
	
		hspd = hspd/2;
		
		if (abs(hspd) < 0.25) {
			
			ret_obj = instance_create_depth(x,y,depth,return_object);
			instance_destroy();
			
		}
	
	}
	
}

if (ret_obj != noone) {
	
	ret_obj.color = color;
	ret_obj.sprite_index = sprite_index;
	ret_obj.swap_palette = swap_palette;
	
}