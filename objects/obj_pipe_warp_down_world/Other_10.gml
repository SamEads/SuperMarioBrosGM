obj_controller.fadetimer = 15;
obj_controller.levelstart = 160;

global.levelcleared = true;

if (global.current_file != -1) {
	
	var _extra = "";
	
	if (global.hardmode)
	
		_extra = "h";
	
	ds_map_replace(global.unlocked_worldlevel,"w"+string(global.world)+_extra,1);
	ds_map_replace(global.unlocked_worldlevel,"w"+string(global.world)+"l"+string(global.level)+_extra,1);
	
}

global.savegame = true;
obj_controller.stopmusic = true;

with (obj_controller) {
	
	audio_stop_sound(bgm_sound);
	
}

var altdest = false;

if (instance_exists(obj_warpzone))

	if (obj_warpzone.activated == false)
	
		altdest = true;

var warpworld = 0;

for (var i = 1; i < array_height_2d(global.worldlevel); i ++) {
		
	if (i <= my_world) {
			
		warpworld = i;
			
	} else break;
	
}

//if (!altdest) {

	global.dest = global.worldlevel[warpworld,1];
	global.world = warpworld;
	
/*} else {
	
	global.dest = global.worldlevel[0,1];
	
	global.world = 0;
	
}*/

global.level = 1;

global.dest_id = -1;