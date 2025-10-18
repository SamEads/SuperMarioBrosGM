/// @description load_game_file(file);
/// @param file
/// @param gamemode

function load_game_file(file, gamemode) {
	if (file < 1 || file > 3) {
		return;	
	}
	
	file =  global.datafolder + gamemode + "_save" + string(file) + ".sam";

	if file_exists(file) {
		load_unlockedworldlevel[file] = ds_map_secure_load(file);
		loadworld[file] = ds_map_find_value(load_unlockedworldlevel[file],"lw");
		loadlevel[file] = ds_map_find_value(load_unlockedworldlevel[file],"ll");
		load_hardmode[file] = ds_map_find_value(load_unlockedworldlevel[file],"lhm");
    
	} else {

	    // If the file does not exist, set the variables to prevent unknown results
	    save_game_file(file,global.currentgame_name);
		
		var worldlevel_size = array_length(global.worldlevel);
		for (var i = 1; i < worldlevel_size; i ++) {
			ds_map_replace(global.unlocked_worldlevel,"complete",0);
			ds_map_replace(global.unlocked_worldlevel,"complete_h",0);
	
			ds_map_replace(global.unlocked_worldlevel,"w"+string(i),0);
			ds_map_replace(global.unlocked_worldlevel,"w"+string(i)+"h",0);
	
			for (var j = 1; j < array_length(global.worldlevel[i]); j ++) {
				ds_map_replace(global.unlocked_worldlevel,"w"+string(i)+"l"+string(j),0);
				ds_map_replace(global.unlocked_worldlevel,"w"+string(i)+"l"+string(j)+"h",0);
			}

		}

	}

}