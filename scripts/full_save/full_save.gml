/// @description Do a full game save (update data)
function full_save() {

	var complete = true;
	var hard_complete = true;
	
	if (ds_map_find_value(global.unlocked_worldlevel,"complete") == 1)

		complete = true;
		
	if (ds_map_find_value(global.unlocked_worldlevel,"complete_h") == 1)
	
		hard_complete = true;

	for (var i = 1; i < array_height_2d(global.worldlevel); i ++) {
		
		for (var j = 1; j < array_length_2d(global.worldlevel, i); j ++) {
			
			if (complete != false) {
		
				if (ds_map_find_value(global.unlocked_worldlevel,"w"+string(i)+"l"+string(j)) != 1) {
				
					complete = false;
				
				}
			
			}
		
			if (hard_complete != false) {
			
				if (ds_map_find_value(global.unlocked_worldlevel,"w"+string(i)+"l"+string(j)+"h") != 1) {
				
					hard_complete = false;
				
				}
			
			}
			
		}
		
		if (!complete && !hard_complete)
		
			break;

	}
	
	show_debug_message(json_encode(global.unlocked_worldlevel));
	
	if (complete) {
		
		ds_map_replace(global.unlocked_worldlevel,"complete",1);
		
	}
	
	if (hard_complete) {
		
		ds_map_replace(global.unlocked_worldlevel,"complete_h",1);
		
	}
	
	global.savegame = false;
	save_game_file(global.current_file,global.currentgame_name);
	
}