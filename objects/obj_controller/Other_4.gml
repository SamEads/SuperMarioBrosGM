/// @description Set up music/time/etc. for each level

//Re-read buttons
scr_buttons_init();

//Reset values if the level was cleared
if (global.levelcleared == true) {
	
	global.time = 0;
	
	mainleveltime = -1;

	global.levelcleared = false;
	
	global.midwaypoint = -1;
	
	global.midwaypoint_x = -1;
	
	global.respawnroom = -1;
	
}

if (global.gameover) {
	
	global.gameover = false;
	global.points = 0;
	global.coins = 0;
	
}

//Castle room guesses
global.guesses = 0;

//Whether the game is paused
global.paused = false;

//Re-do music choice
choosemusic = false;

//Set height
set_height = room_height;

if instance_exists(obj_levelmanager) {
	
	set_height = obj_levelmanager.set_height;
	
	choosemusic = true;
	
	stopmusic = false;
	
	if (obj_levelmanager.playmusic == false)
	
		stopmusic = true;
	
	if (mainleveltime == -1) {
		
		mainleveltime = obj_levelmanager.leveltime;
		
		if (mainleveltime <= 0)
		
			displaytime = 0;
			
		else
		
			displaytime = mainleveltime;
		
	}
	
	if (mainleveltime != -1 && global.time <= 0) {
		
		global.time = mainleveltime;
		displaytime = mainleveltime;
		
	}
	
	var _w = string(global.world);
	
	switch (_w) {
		
		case ("0"): _w = " "; break;
		case ("10"): _w = "A"; break;
		case ("11"): _w = "B"; break;
		case ("12"): _w = "C"; break;
		case ("13"): _w = "D"; break;
		
	}
	
	var lev = _w+"-"+string(global.level);
	
	if (global.hardmode)
	
		lev = _w+"*"+string(global.level);

	if (instance_exists(obj_levelmanager)) {
	
		if (obj_levelmanager.levelname != -1) {
		
			lev = obj_levelmanager.levelname;
		
		}
	
	}

	displaylevel = lev;
	rp_display = _w+"-"+string(global.level);
	
}

for (var i = 0; i < charcount; i ++) {
	
	if (global.p_health[i] <= 0) {
	
		global.p_health[i] = 1;
	
		global.p_maxhealth[i] = 2;
		
	}
	
}

//Set camera up
event_user(1);
alarm[0] = -1;

//Reset position in level
x = 0;
y = 0;

alarm[1] = 1;

window_set_caption("Super Mario Bros.");

if (global.savegame) full_save();

//Reset time tick
timetick = 25;

alarm[5] = 2;

if (global.hardmode_unlocked) {
	unlockedchars = 5;
}