if (!instance_exists(obj_player)) exit;

if (!activated) {

	if (camera_get_view_x(view_camera[0]) >= room_width-camera_get_view_width(view_camera[0])) {
	
		activated = true;
		
		with (obj_enemy_parent)
		
			instance_destroy();
	
	}
	
} else {

	timer ++;
	
}