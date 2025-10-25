image_index = global.tick;

if (global.moderneffects) {

	if (moderntimer > 0) {
	
		moderntimer --;

		if (moderntimer <= 0)
	
			hit = 2;
		
		else
		
			exit;
		
	}
	
}

if (hit == 1) {
	
	if (actiontimer == 1) {
		
		for (var i = 0; i < array_length_1d(hider); i ++) {
			
			with (hider[i]) {
				
				visible = true;
				
			}
			
		}
		
	}
	
	actiontimer ++;
	
	if (actiontimer >= 24) {
		
		showchain = false;
		
	}
	
	if (actiontimer == 26) {
		
		with (obj_bowser) {
			
			if (instance_in_view(self,view_camera[0],16)) {
				
				dying_animation = true;
				
			}
			
		}
		
		with (instance_nearest(x,y,obj_bridge)) {
			
			destroying = true;
			
		}
		
	}
	
}

if (hit == 2) {
	
	global.frozen = false;
	global.levelcleared = true;
	
	if (global.current_file != -1) {
	
		var _extra = "";
	
		if (global.hardmode)
	
			_extra = "h";
	
		ds_map_replace(global.unlocked_worldlevel,"w"+string(global.world)+_extra,1);
		ds_map_replace(global.unlocked_worldlevel,"w"+string(global.world)+"l"+string(global.level)+_extra,1);
	
	}
	
	obj_controller.stopmusic = true;
	audio_play_stop_sound(mus_castleclear,0,0);
		
	with (obj_castle_end) {
			
		active = true;
			
		with (instance_nearest(x,y,obj_cameralimiter))
		
			instance_destroy();
			
	}
	
	hit = 3;
		
}