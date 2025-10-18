if (instance_exists(obj_player)) {
	
	if (obj_player.x > x)
	
		active = false;
	
}

if (active) {

	if (player) {
	
		var dif = obj_levelcontrol.camX-obj_player.x;

		player.x += new_x-x;
		
		with (obj_fireball) {
		
			x += other.new_x-other.x;
			y += other.new_y-other.y;
			
		}
		
		player.xprevious += new_x-x;
		obj_levelcontrol.camX = player.x+dif;
		player.y += new_y-y;
		obj_controller.set_height = set_height;
		
		with (obj_enemyspawner)
		
			inactive = false;
	
	}

}

if (!instance_in_view(self,view_camera[0],32)) {
	
	active = true;
	
}

player = instance_place(x,y,obj_player);