if (global.frozen) {
	
	event_inherited();
	exit;
	
}

if (has_wings && !dead) {
	
	//Parakoopa logic
	
} else {
	
	autogravity = true;
	physics = true;
	
}

// Inherit the parent event
event_inherited();

if (has_wings && !dead) {
	
	grav = 0.1;
	
	if (!global.editormode) {
		
		physics = false;

		var s = collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+abs(vspd),obj_semisolid,0,0);

		if (s)
		&& (!collision_line(bbox_left-1,bbox_bottom-2-abs(vspd),bbox_right+1,bbox_bottom-2-abs(vspd),obj_semisolid,0,0)) {
		
			y = (s.bbox_top-(sprite_height-sprite_get_yoffset(sprite_index)));
		
			while (collision_point(x,bbox_bottom+vspd,obj_semisolid,0,0))
		
				y --;
		
			vspd = -2.95;
		
		}
	
		if (hspd < 0) {
	
			if (collision_point(bbox_left-1,bbox_bottom-2,obj_semisolid,0,0)) {
		
				hspd = -hspd;
		
			}
		
		} else if (hspd > 0) {
		
			if (collision_point(bbox_right+1,bbox_bottom-2,obj_semisolid,0,0)) {
		
				hspd = -hspd;
		
			}
		
		}

		x += hspd;
		vspd += grav;
	
		if (vspd >= 2.75)
	
			vspd = 2.75;
	
		y += vspd;
	
	} else {
		
		if (grounded) {
			
			vspd = -2.95;
			
		}
		
		grav = 0.1;
		autogravity = false;
		physics = true;
		
	}
	
}