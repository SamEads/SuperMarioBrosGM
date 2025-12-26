if (timer > 0)
	
	timer --;
		
else {
		
	timer = 80;
		
	var _x = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])+12;
	
	var _y = ceil(camera_get_view_y(view_camera[0])/16)*16;
		
	_y += (ceil(irandom_range(48,camera_get_view_height(view_camera[0])-48)/16))*16;
		
	var i = 0;
		
	with (obj_flame)
	
		if (instance_in_view(self,view_camera[0],8))
	
			i ++;
			
	with (obj_bowser)
	
		if (instance_in_view(self,view_camera[0],8))
	
			i ++;
		
	if (i < 1) {
		
		with instance_create_depth(_x,_y,0,obj_flame) {
			
			image_xscale = -1;
			fast = true;
			
		}
			
	}
		
}