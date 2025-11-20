/// @description Break animation

if (break_animation) {

	with (instance_create_depth(x+4,y+4,depth-2,obj_brick_shatter)) { vspd = -6.5; hspd = -1.25; grav = 0.375; };
	with (instance_create_depth(x+12,y+4,depth-2,obj_brick_shatter)) { vspd = -6.5; hspd = 1.25; grav = 0.375; };
	with (instance_create_depth(x+4,y+12,depth-2,obj_brick_shatter)) { vspd = -4.5; hspd = -1.25; grav = 0.375; };
	with (instance_create_depth(x+12,y+12,depth-2,obj_brick_shatter)) { vspd = -4.5; hspd = 1.25; grav = 0.375; };

	global.points += 50;

	audio_play_stop_sound(snd_break,0,0);
	
}