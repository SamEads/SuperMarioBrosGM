/// @description Manage the initial camera/player position, destroy enemies on-screen

if (!instance_exists(obj_player)) exit;

if (obj_levelmanager.freescroll == false) {
	
	if (obj_levelmanager.followplayer)

		obj_levelmanager.camX = round(obj_player.x)+64;

	if (x < camera_get_view_x(view_camera[0])+(camera_get_view_width(view_camera[0])/2))

		x = camera_get_view_x(view_camera[0])+(camera_get_view_width(view_camera[0])/2)+0.1;
	
	with (obj_enemy_parent) {
	
		if (distance_to_point(obj_player.x,y) < 64) && (depth < 100) {
		
			instance_destroy();
		
		}
	
	}
	
} else {
	
	obj_levelmanager.camX = obj_player.x;
	obj_levelmanager.y = obj_player.y+16;
	obj_levelmanager.dest_y = obj_player.y;
	
}