/// @description Define variables

global.hardmode_unlocked = false;
global.toppoints = 0;
unlockedchars = 4;

if (!file_exists("globaldata.smb")) {
	
	first_time = true;

	var f = ds_map_create();
	
	ds_map_replace(f,"ct",global.controllertype);
	ds_map_replace(f,"hmu",global.hardmode_unlocked);
	ds_map_replace(f,"pts",global.toppoints);
	ds_map_replace(f,"scale",global.scale);
	ds_map_replace(f,"hud",global.hudstyle);
	ds_map_replace(f,"wide",global.widescreen);
	ds_map_replace(f,"abutton",global.abutton);
	ds_map_replace(f,"bbutton",global.bbutton);
	ds_map_replace(f,"lkey",global.lkey);
	ds_map_replace(f,"rkey",global.rkey);
	ds_map_replace(f,"ukey",global.ukey);
	ds_map_replace(f,"dkey",global.dkey);
	ds_map_replace(f,"start",global.start);
	ds_map_replace(f,"select",global.select);
	ds_map_replace(f,"vsync",global.vsync);
	ds_map_replace(f,"parallax",global.parallax);

	ds_map_secure_save(f,"globaldata.smb");
	
	ds_map_destroy(f);

} else {
	
	var f = ds_map_secure_load("globaldata.smb");
	
	if (f == -1) {
		
		if (file_exists("globaldata.smb")) {
			
			old_data = true;
			
		}
		
	} else {
		
		global.controllertype =		real(ds_map_find_value(f,"ct"));
		global.hardmode_unlocked =	real(ds_map_find_value(f,"hmu"));
		global.toppoints =			real(ds_map_find_value(f,"pts"));
		global.scale =				real(ds_map_find_value(f,"scale"));
		global.hudstyle =			real(ds_map_find_value(f,"hud"));
		global.widescreen =			real(ds_map_find_value(f,"wide"));
		global.abutton =			real(ds_map_find_value(f,"abutton"));
		global.bbutton =			real(ds_map_find_value(f,"bbutton"));
		global.lkey =				real(ds_map_find_value(f,"lkey"));
		global.rkey =				real(ds_map_find_value(f,"rkey"));
		global.ukey =				real(ds_map_find_value(f,"ukey"));
		global.dkey =				real(ds_map_find_value(f,"dkey"));
		global.start =				real(ds_map_find_value(f,"start"));
		global.select =				real(ds_map_find_value(f,"select"));
		global.vsync =				real(ds_map_find_value(f,"vsync"));
		global.parallax =			real(ds_map_find_value(f,"parallax"));
		
	}
	
}

display_reset(0,global.vsync);

global.points = 0;
global.coins = 0;
global.time = 0;
global.gameover = false;
global.paused = false;

default_lives = 3;
charcount = 8;

// "Support" for multiple different players, but this engine does not directly support multiplayer. Focus mostly on char[0]
for (var i = 0; i < charcount; i ++) {
	
	global.p_lives[i] = default_lives;
	global.p_powerup[i] = itemtype.id_small;
	
	//Default starting health for health-based characters
	global.p_health[i] = 1;
	
	//Default maximum health for health-based characters
	global.p_maxhealth[i] = 2;
	
}

global.p_char[0] = chara.mario;

global.data = ds_map_create();

//Whether the level has been cleared yet or not
global.levelcleared = false;

//Midway point room (-1 if not activated yet)
global.midwaypoint = -1;
global.midwaypoint_x = -1;

global.respawnroom = -1;

global.unlocked_worldlevel = ds_map_create();
	
for (var i = 1; i < array_height_2d(global.worldlevel); i ++) {
	
	ds_map_replace(global.unlocked_worldlevel,"complete",0);
	ds_map_replace(global.unlocked_worldlevel,"complete_h",0);
	
	ds_map_replace(global.unlocked_worldlevel,"w"+string(i),0);
	ds_map_replace(global.unlocked_worldlevel,"w"+string(i)+"h",0);
	
	for (var j = 1; j < array_length_2d(global.worldlevel, i); j ++) {
		
		ds_map_replace(global.unlocked_worldlevel,"w"+string(i)+"l"+string(j),0);
		ds_map_replace(global.unlocked_worldlevel,"w"+string(i)+"l"+string(j)+"h",0);
	  
	}

}