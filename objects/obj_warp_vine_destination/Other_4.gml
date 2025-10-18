if (global.dest_id != my_id) exit;

// Inherit the parent event
event_inherited();

captor.y += 32;

captor.depth = 150;

captor.warping = true;

captor.climbing = true;

captor.controllable = false;

audio_play_stop_sound(snd_growing_vine,0,0);

captor.vine = instance_create_depth(x,y+32,151,obj_vine);

myvine = instance_create_depth(x,y+16,150,obj_growing_vine);

alarm[0] = 2;