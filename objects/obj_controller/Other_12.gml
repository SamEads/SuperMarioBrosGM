/// @description Go to room

if (global.gameover) {
	
	global.dest = global.current_title;
	
}

if (global.midwaypoint == -1)

	global.dest = global.respawnroom;
	
else

	global.dest = global.midwaypoint;
	
levelstart = 160;

global.time = 0;