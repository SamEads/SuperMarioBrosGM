if (instance_place(x,y,obj_hardmode_only))

	if (!global.hardmode)

		instance_destroy();

if (instance_exists(obj_generator_stopper)) {
	
	for (var i = x/8; i < room_width/8; i ++) {
		
		if (instance_place(i*8,y,obj_generator_stopper)) {
			
			mystopper = instance_place(i*8,y,obj_generator_stopper);
			exit;
			
		}
		
		if (i*8 > room_width)
		
			exit;
		
	}
	
}