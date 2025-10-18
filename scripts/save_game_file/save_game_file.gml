/// @description save_game_file(file);
/// @param file

function save_game_file(argument0,argument1) {

	// Choose a file depending on the argument supplied
	if (argument0 == 1) {
		
	    file = global.datafolder+argument1+"_save1.sam";
		
	} else if (argument0 == 2) {
		
	    file = global.datafolder+argument1+"_save2.sam";
		
	} else if (argument0 == 3) {
		
	    file = global.datafolder+argument1+"_save3.sam";
		
	} else exit;
	
	var _extra = "";
	
	if (global.hardmode)
	
		_extra = "h";
		
	if (ds_map_find_value(global.unlocked_worldlevel,"w"+string(global.world)+"l"+string(global.level)+_extra) == 0) {
		
		ds_map_replace(global.unlocked_worldlevel,"w"+string(global.world)+_extra,0.5);
		ds_map_replace(global.unlocked_worldlevel,"w"+string(global.world)+"l"+string(global.level)+_extra,0.5);
			
	}
	
	ds_map_replace(global.unlocked_worldlevel,"lw",global.world);
	ds_map_replace(global.unlocked_worldlevel,"ll",global.level);
	ds_map_replace(global.unlocked_worldlevel,"lhm",global.hardmode);
	ds_map_replace(global.unlocked_worldlevel,"modern",global.moderneffects);
	ds_map_replace(global.unlocked_worldlevel,"score",global.points);
	ds_map_replace(global.unlocked_worldlevel,"char",global.p_char[0]);
	ds_map_replace(global.unlocked_worldlevel,"lives",global.p_lives[obj_controller.char]);
	ds_map_replace(global.unlocked_worldlevel,"powerup",global.p_powerup[0]);
	ds_map_replace(global.unlocked_worldlevel,"coins",global.coins);
	ds_map_secure_save(global.unlocked_worldlevel,file);

}