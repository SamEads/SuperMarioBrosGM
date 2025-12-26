// Inherit the parent event
event_inherited();

endsequence = 0;

player = noone;

flag_y = -143;

timer = 0;

alt_jingle = false;

pointdisp = 0;

fireworksleft = 0;

fireworkscalculated = false;

playeryhit = 0;

fireworktimer = 30;

fireworkpos = 0;

levelendtimer = 60;

songlengthtimer = round(room_speed * audio_sound_length(mus_courseclear));

done = false;

image_speed = 0;

flag_color = -1;

create_exit = true;

flag_x = x+96;

startendcountdown = false;

depth = 50;

mycastle = instance_create_depth(x,y,20,obj_castleside);