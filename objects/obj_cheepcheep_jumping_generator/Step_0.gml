if (x <= camera_get_view_x(view_camera[0])+(camera_get_view_width(view_camera[0])/2)) {
	
	if (mystopper != noone) {
		
		if (mystopper.x <= camera_get_view_x(view_camera[0])+(camera_get_view_width(view_camera[0])/2))
		
			exit;
		
	}

	event_user(0);
	
}