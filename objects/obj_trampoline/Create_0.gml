/// @description 70% Accurate Trampoline!

lowjump_height = 6;
highjump_height = 9;

lowjump_timer = 10;
highjump_timer = 20;

mysolid = instance_create_depth(x,y,depth,obj_solid);
mysolid.sprite_index = sprite_index;
mysolid.image_speed = 0;
mysolid.image_yscale = 1;
image_speed = 0;
captor = noone;
depth = 20;
retspd = 0;

set_grav = 0;

stored_hspd = 0;