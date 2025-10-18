#region Snow

if (instance_exists(obj_controller)) {

	if (obj_controller.currenttheme == themetype.snow) {
	
		if (snowtimer > 0)
	
			snowtimer --;
		
		else if (snowtimer == 0) {
		
			snowtimer = 3;
		
			flakes = 50;
		
			if (global.performance)
		
				flakes = 10;
		
			for (var i = 0; i < irandom_range(0,flakes); i ++) {
			
				if (instance_number(obj_snow) > 180)
			
					break;
			
				var start_x = camera_get_view_x(view_camera[0])-128;
				var rand_x = irandom_range(0,camera_get_view_width(view_camera[0])+512);
				var rand_y = camera_get_view_y(view_camera[0])-12;
			
				instance_create_depth(start_x+rand_x,rand_y,-20,obj_snow);
			
			}
		
		} else {
		
			snowtimer = 3;
		
			var flakes = 90;
		
			if (global.performance)
		
				flakes = 30;
		
			for (var i = 0; i < flakes; i ++) {
			
				if (instance_number(obj_snow) > 180)
			
					break;
			
				var rand_x = camera_get_view_x(view_camera[0])-32+irandom_range(-8,camera_get_view_width(view_camera[0])+64);
				var rand_y = camera_get_view_y(view_camera[0])+irandom_range(-8,camera_get_view_height(view_camera[0])+8);
			
				instance_create_depth(rand_x,rand_y,-20,obj_snow);
			
			}
		
		}
	
	} else snowtimer = -1;

}

#endregion

instance_deactivate_object(obj_blockparent);

var spacing = 96;

if (global.editormode) {

	instance_deactivate_object(obj_enemyparent);
	spacing = 32;
	
}

instance_activate_region(camera_get_view_x(view_camera[0])-spacing,camera_get_view_y(view_camera[0])-16,camera_get_view_width(view_camera[0])+(spacing*2),camera_get_view_height(view_camera[0])+32,true);