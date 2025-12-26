if (global.dest_id != my_id) exit;

global.dest_id = -1;

captor = instance_create_depth(x,y,-5,obj_player);

showtimer = 8;

captor.image_index = 2;

captor.powerup = global.p_powerup[0];
captor.char = global.p_char[0];
captor.controllable = false;

alarm[0] = 2;