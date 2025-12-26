for (var i = x/8; i < (room_width)/8; i ++) {
	
	if collision_rectangle(i*8,0,i*8,room_height,obj_balanceplatform_right,0,0) {
		
		if (collision_rectangle(i*8,0,i*8,room_height,obj_balanceplatform_right,0,0).my_buddy == noone) {
		
			if (my_buddy == noone)

				my_buddy = collision_rectangle(i*8,0,i*8,room_height,obj_balanceplatform_right,0,0);
		
			my_buddy.my_buddy = id;
		
			with (my_buddy) {
			
				if (global.hardmode) {
	
					if (image_xscale == 3) {
		
						image_xscale = 2;
		
					}
	
				}

			}
		
			break;
			
		}
		
	}
	
}

if (my_buddy != noone) {
	
	if (instance_exists(obj_balanceplatform)) {
		
		for (var i = y/4; i > 0; i -= 4) {
			
			if collision_rectangle(bbox_left-16,i*4,bbox_right+16,i*4,obj_balanceplatform,0,0) {
			
				anchor = collision_rectangle(bbox_left-16,i*4,bbox_right+16,i*4,obj_balanceplatform,0,0);
				anchor.top = anchor.y;
			
			}
			
		}
		
	}
	
	if (anchor == noone)
	
		anchor = instance_create_depth(0,0,depth,obj_balanceplatform);
	
	with (anchor) {
		
		depth = 50;
		left = other.id;
		right = other.my_buddy.id;
		
	}
	
	my_buddy.anchor = anchor;
	
}

if (global.hardmode) {
	
	if (image_xscale == 3) {
		
		image_xscale = 2;
		
	}
	
}