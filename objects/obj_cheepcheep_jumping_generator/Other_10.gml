if (timer > 0)
	
	timer --;
		
else {
		
	timer = 40;
		
	var _x = camera_get_view_x(view_camera[0])+irandom_range(16,camera_get_view_width(view_camera[0])-16);
	var _y = camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])+16;
		
	if (instance_number(obj_cheepcheep_jump) < 3) {
		
		var cheep = instance_create_depth(_x,_y,0,obj_cheepcheep_jump);
			
		if (cheep.x > camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])-32)
		
			cheep.hspd = -abs(cheep.hspd)/2;
			
	}
		
}