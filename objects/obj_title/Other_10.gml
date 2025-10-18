/// @description Update file displays

for (var i = 0; i <= 2; i ++) {

	loadworld[i+1] = -1;
	loadlevel[i+1] = -1;
	load_hardmode[i+1] = false;
	load_unlockedworldlevel[i+1] = ds_map_create();
	
	ds_map_replace(load_unlockedworldlevel[i+1],"modern",false);
	ds_map_replace(load_unlockedworldlevel[i+1],"score",0);
	ds_map_replace(load_unlockedworldlevel[i+1],"char",chara.mario);
	ds_map_replace(load_unlockedworldlevel[i+1],"lives",obj_controller.default_lives);
	ds_map_replace(load_unlockedworldlevel[i+1],"powerup",itemtype.id_small);
	ds_map_replace(load_unlockedworldlevel[i+1],"coins",0);
	
}

var f_to_read;

f_to_read[0] = global.currentgame_name+"_save1.sam";
f_to_read[1] = global.currentgame_name+"_save2.sam";
f_to_read[2] = global.currentgame_name+"_save3.sam";

for (var i = 0; i <= 2; i ++) {

	if (file_exists(global.datafolder+f_to_read[i])) {
				
		load_unlockedworldlevel[i+1] = ds_map_secure_load(global.datafolder+f_to_read[i]);
		loadworld[i+1] = ds_map_find_value(load_unlockedworldlevel[i+1],"lw");
		loadlevel[i+1] = ds_map_find_value(load_unlockedworldlevel[i+1],"ll");
		load_hardmode[i+1] = ds_map_find_value(load_unlockedworldlevel[i+1],"lhm");
		
		if (load_hardmode[i+1] > 0) {
			
			if (global.hardmode_unlocked == false) {
		
				global.hardmode_unlocked = true;
				obj_controller.unlockedchars = 5;
				
			}
			
		}
				
	}
	
}