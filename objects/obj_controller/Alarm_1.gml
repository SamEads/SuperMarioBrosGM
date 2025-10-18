/// @description Manage the initial camera/player position, destroy enemies on-screen

if (!instance_exists(obj_player)) exit;

if (obj_levelcontrol.freescroll == false) {
	
	if (obj_levelcontrol.followplayer)

		obj_levelcontrol.camX = round(obj_player.x)+64;

	if (x < camera_get_view_x(view_camera[0])+(camera_get_view_width(view_camera[0])/2))

		x = camera_get_view_x(view_camera[0])+(camera_get_view_width(view_camera[0])/2)+0.1;
	
	with (obj_enemyparent) {
	
		if (distance_to_point(obj_player.x,y) < 64) && (depth < 100) {
		
			instance_destroy();
		
		}
	
	}
	
} else {
	
	obj_levelcontrol.camX = obj_player.x;
	obj_levelcontrol.y = obj_player.y+16;
	obj_levelcontrol.dest_y = obj_player.y;
	
}