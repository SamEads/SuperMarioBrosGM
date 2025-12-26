if (global.frozen)

	exit;

// Inherit the parent event
event_inherited();

if (!instance_exists(obj_player)) exit;

if (!dead) {
	
	if (blooping) {
		
		if (abs(vspd) < 1.5) {
		
			vspd -= 0.5;
			hspd -= 0.5*dir;
			
		}
		
	} else {
		
		if (abs(hspd) > 0) {
		
			hspd += 0.2*-hspd;
			
			if (abs(hspd) < 0.2)
			
				hspd = 0;
			
		}
		
		vspd += 0.2;
		
		if (vspd > 0.5)
	
			vspd = 0.5;
			
	}
	
	if (blooptimer > 0)
	
		blooptimer --;
	
	if (blooptimer <= 0) {
		
		if (y > camera_get_view_y(view_camera[0])+16) {
		
			if (y > obj_player.bbox_top-24) {
			
				if (obj_player.x > x)
			
					dir = -1;
				
				else
			
					dir = 1;
	
				blooping = true;
				blooptimer = 70;
				vspd = 0;
				hspd = 0;
		
			}
		
		}
		
	} else if (blooptimer <= 50) {
		
		blooping = false;
		
	}
	
	if (blooptimer == 25) image_index = 1;
	if (blooptimer = 10) image_index = 0;
	
	if (!collision_rectangle(x,bbox_top,x,bbox_top,obj_liquid,1,0))
	&& (collision_rectangle(x,bbox_bottom,x,bbox_bottom,obj_liquid,1,0))

		if (vspd < 0)

			vspd = 0;
	
	x += hspd;
	y += vspd;
	
}