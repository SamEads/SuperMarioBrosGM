/// @description Level control

#region For ease of access, copy this section into the creation code

//Draw the hud
draw_hud = true;

//Custom audio track to play, keeping at -1 will choose the proper song based on your theme
bgm = -1;

//How much time for the level (-1 for no time/continue from last room)
leveltime = -1;

//Level theme (will change palettes of certain objects but not the tiles themselves)
//Theme list:
//themetype.overworld
//themetype.cave,
//themetype.castle
//themetype.water
theme = themetype.overworld;

//Play music
playmusic = true;

//Background layer, if any, to show with modern mode
//Keep at -1 if no BG
background_layer = -1;
background_color_layer = -1;

//Retro layer, if any, to hide during modern mode
//Keep at -1 if no retro layer to hide
retro_layer = -1;

//Modern layer, if any, to hide during retro mode
//Keep at -1 if no modern layer to hide
modern_layer[0] = -1;

//Free scrolling
freescroll = false;

//Custom level name string (-1 for automatic)
levelname = -1;

//Max room height
set_height = room_height;

//Retro theme, keep at -1 to stay as the same theme
retro_theme = -1;

//Modern theme, keep at -1 to stay as the same theme
modern_theme = -1;

//Retro background music, keep at -1 to stay as the same theme
retro_bgm = -1;

//Follow the player
followplayer = true;

#endregion

#region Do not use

bg_x = 0;
string_switch = false;
snowtimer = -1;
depth = -25;

//Camera variables
_vx = 0;
_vy = 0;
dest_y = y;
follow_y_dir = 0;
camX = 0;

bg_fade_set = false;
start_faded = true;
bg_fade = -1;

#endregion