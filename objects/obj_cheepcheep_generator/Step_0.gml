if (x <= camera_get_view_x(view_camera[0])+(camera_get_view_width(view_camera[0])/2)) {
	
	if (instance_place(camera_get_view_x(view_camera[0])+(camera_get_view_width(view_camera[0])/2),y,obj_generator_stopper))
	
		exit;
	
	if (cheepcheeptimer > 0)
	
		cheepcheeptimer --;
	
	else {
		
		//Run the test every half a second
		cheepcheeptimer = 30;
		
		var testsrun = 0;
		
		while (instance_number(obj_cheepcheep) < 3) {
		
			var test_x = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])+16+irandom_range(0,64);
			var test_y = ceil((camera_get_view_y(view_camera[0])+irandom_range(48,208))/16)*16;
			
			var cheep = instance_nearest(test_x,test_y,obj_cheepcheep);
			
			if (cheep) {
				
				if (point_distance(test_x,test_y,cheep.x,cheep.y) < 12) {
					
					var test_x = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])+16+irandom_range(0,64);
					var test_y = ceil((camera_get_view_y(view_camera[0])+irandom_range(48,208))/16)*16;
					
				}
				
			}
		
			if (instance_place(test_x,test_y,obj_liquid)) {
		
				with instance_create_depth(test_x+0.1,test_y,0,obj_cheepcheep) {
					
					bobbing = choose(true,false);
					sprite_index = choose(spr_cheepcheep,spr_cheepcheep_red);
					
					if (sprite_index == spr_cheepcheep_red) {
						
						swap_palette = false;
						
					}
					
				}
				
			}
				
			testsrun ++;
			
			if (testsrun > 10) exit;
				
		}
		
	}
	
}