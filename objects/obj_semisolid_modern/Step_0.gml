/// @description Manage swapping semi-solids

if (global.moderneffects) {
	
	if (instance_exists(mysolid)) {
	
		if (mysolid.object_index == obj_solid) {
		
			with (mysolid) instance_destroy();
			mysolid = instance_create_depth(x,y,depth,obj_semisolid);
		
			with (mysolid) {
			
				image_xscale = other.image_xscale;
				image_yscale = other.image_yscale;
			
			}
		
		}
	
	}
	
} else {
	
	if (instance_exists(mysolid)) {
	
		if (mysolid.object_index == obj_semisolid) {
		
			with (mysolid) instance_destroy();
			mysolid = instance_create_depth(x,y,depth,obj_solid);
		
			with (mysolid) {
			
				image_xscale = other.image_xscale;
				image_yscale = other.image_yscale;
			
			}
		
		}
		
	}
	
}