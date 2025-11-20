event_user(15);

if (!instance_in_view(self,view_camera[0],128))

	instance_destroy();

if (sprouting) {
	
	y -= 0.25;
	
	if (y <= ystart-15) {
	
		sprouting = false;
		depth = 1;
		hspd = 1;
		event_user(0);
		
	}
	
} else {
	
	if (global.frozen) exit;
	
	if (vspd > vspd_cap) vspd = vspd_cap;
	
	event_inherited();
	
}

if (global.frozen) exit;

block = collision_point(x,bbox_bottom+2,obj_block_parent,0,0);

if (block) {
	
	if (block.hitsequence == 1 && vspd >= 0) {
	
		vspd = -2;
		
		if (block.hitter != noone) {
		
			if (block.hitter.x > x)
			
				hspd = -abs(hspd)
			
			else
		
				hspd = abs(hspd);
	
		}
	
	}
	
}