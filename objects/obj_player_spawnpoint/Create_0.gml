active = false;

if (global.dest_id != -1) exit;

deposit = instance_create_depth(x,y,-5,obj_player);
deposit.controllable = false;
active = true;
starttimer = 0;