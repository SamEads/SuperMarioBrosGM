obj_controller.draw_hud = false;

hspd = 0;
vspd = 0;
grav = 0;

state = 0;
keyselection = 0;
key[0] = "";

arrow_index = 0;

fadeout = 0;

#region Player States

player_spr = spr_mario_small_walk;
player_img = 0;
player_x = 0;
player_y = 240-48;
player_y_start = player_y;
player_xscale = 1;

#endregion