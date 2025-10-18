/// @description Update global data

if (global.points > global.toppoints)

	global.toppoints = global.points;

global.last_room = room;

if (file_exists("globaldata.smb")) {
	
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

}