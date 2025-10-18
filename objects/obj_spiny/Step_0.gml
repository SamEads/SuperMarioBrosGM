// Inherit the parent event
event_inherited();

if (dead || global.frozen) exit;

if (thrown) {
	
	sprite_index = spr_spiny_thrown;
		
	if (vspd > 3.5)
		
		vspd = 3.5;
	
	if (grounded) {
	
		thrown = false;
		hspd = -0.5;
		
		if (instance_exists(obj_player)) {
			
			if (instance_nearest(x,y,obj_player).x > x) {
				
				hspd = 0.5;
				
			}
			
		}
		
	}
	
} else {
	
	if (grounded && (abs(hspd) > 0.5) && vspd >= 0) {
	
		hspd = 0.5*sign(hspd);
		
	}
	
	sprite_index = spr_spiny;
	
}

if (spawner_parent == noone) {
	
	if !(instance_in_view(self,view_camera[0],8)) {
		
		if (y > camera_get_view_y(view_camera[0])+16)
		
			instance_destroy();
		
	}
	
}