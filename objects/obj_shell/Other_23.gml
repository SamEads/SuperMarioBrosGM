/// @description Interaction with question block tops

if (dead || global.frozen || vspd < 0) exit;

add_score(100);
audio_play_stop_sound(snd_kick,0,0);

var player = instance_nearest(x,y,obj_player);

if (player)

	hspd = (x > player.x) ? 0.75 : -0.75;
	
vspd = -2.5;
shelltimer = -1;
image_index = 0;
yscale = -1;
moving = false;