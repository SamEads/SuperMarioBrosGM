/// @description A semi-solid platform that only works when Modern mode is enabled

if (global.moderneffects) {
	
	mysolid = instance_create_depth(x,y,depth,obj_semisolid);
	
} else {
	
	mysolid = instance_create_depth(x,y,depth,obj_solid);
	
}

with (mysolid) {
			
	image_xscale = other.image_xscale;
	image_yscale = other.image_yscale;
			
}