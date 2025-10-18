if (instance_exists(obj_bowser) && hit == 0) {
	
	with (obj_enemyparent)
	
		if (object_index != obj_bowser && object_index != obj_bowser_hammer && object_index != obj_bowser_true)
		
			instance_destroy();
			
	with (obj_firebar_clockwise)
	
		instance_destroy();
		
	with (obj_firebar_counter)
	
		instance_destroy();
		
	with (obj_firebar_fireball)
	
		instance_destroy();
	
	with (obj_movingplatform)
	
		instance_destroy();
		
	with (obj_podoboo)
	
		instance_destroy();
		
	with (obj_fireball)
	
		instance_destroy();
		
	with (obj_flame)
	
		instance_destroy();
		
	with (obj_hammer)
	
		instance_destroy();
		
	var j = 0;
	var captor = obj_physicsparent;
	
	var quickend = false;
	
	if (instance_exists(obj_bowser)) {
		
		with (obj_bowser) {
			
			if (!instance_in_view(self,view_camera[0],32) || dead)
		
				quickend = true;
				
		}
		
	} else if (!instance_exists(obj_bowser)) {
		
		quickend = false;
		
	}
	
	if (!quickend) {
	
		if (!global.moderneffects) {
	
			repeat (2) {
		
				with (captor) {
			
					if (visible)
					&& (instance_in_view(self,view_camera[0],8)) {
				
						with (other) {
					
							hider[j] = other.id;
							j ++;
					
						}
				
						visible = false;
				
					}
			
				}
		
				captor = obj_player;
		
			}
	
		} else {
			
			obj_controller.stopmusic = true;
			audio_stop_sound(obj_controller.bgm_sound);
			actiontimer = 23;
			
		}

		global.frozen = true;
		hit = 1;
	
	} else {
		
		hit = 2;
		
	}
	
}