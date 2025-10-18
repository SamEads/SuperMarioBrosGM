for (var i = 0; i < image_xscale; i ++) {
	
	instance_create_depth(x+(i*16),y,depth,obj_bridge);
	
}

instance_destroy();