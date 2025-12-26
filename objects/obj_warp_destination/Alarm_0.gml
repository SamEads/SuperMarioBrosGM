with (obj_enemyspawner) {
	
	if (distance_to_point(obj_player.x+48,y) < 96) && (depth < 100) {
		
		if (instance_in_view(self,view_camera[0],-16)) {
		
			primed = false;
		
			with (my_enemy)
		
				instance_destroy();
				
		}
		
	}
	
}