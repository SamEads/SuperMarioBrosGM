/// @description Main controller object

//Hard mode
global.hardmode = false;

//Default window scale
global.scale = 4;
oldscale = -1;

//Themes
//0: Original (256x240 base)
//3: SMM2 (384x216 base)
global.hudstyle = 0;
global.widescreen = false;
global._gw = 256;
global._gh = 240;

//Alternate graphics & gameplay
global.smb2_mode = false;

//Debug mode
global.debugmode = true;

//Effects (rotations & the like)
global.moderneffects = false;

//Editor mode (slightly different objects)
global.editormode = false;

//Menu options
global.parallax = true;
global.vsync = true;

global.performance = false;
show_fps = false;
shown_fps = fps_real;
alarm[4] = 10;

global.dest = -1;
global.dest_id = -1;

//Level (if you'd like to load into a different level just change the world and level)
global.worldlevel[0,0] = 0;
global.world = 1;
global.level = 1;
global.unlocked_worldlevel[0,0] = 0;

enum game {
	
	smb1,
	smb2
	
}

//Directory
global.datafolder = "Save Data/";

#region Keys

global.lkey = vk_left;
		
global.rkey = vk_right;
		
global.ukey = vk_up;
		
global.dkey = vk_down;
    
global.abutton = ord("X");
		
global.bbutton = ord("Z");
		
global.select = vk_space;
		
global.start = vk_enter;

#endregion

//Controller type
global.controllertype = 0;

//Reset / set important variables
old_data = false;
first_time = false;
event_user(0);

#region Enumerators

enum themetype {
	
	overworld = 0,
	cave = 1,
	castle = 2,
	water = 3,
	snow = 4,
	desert = 5,
	athletic = 6,
	forest = 7
	
}

enum chara {
	
	mario = 0,
	luigi = 1,
	toad = 2,
	toadette = 3,
	custom = 4
	
}

enum itemtype {
	
	id_small,
    id_big,
    id_flower,
	id_subcon,
	id_coin,
	id_coin_multi,
	id_star,
	id_1up,
	id_vine,
	id_poison
	
}

#endregion

//Stop the music
stopmusic = false;

#region Palette swapper variables

globalvar Pal_Shader, Pal_Texel_Size, Pal_UVs, Pal_Index, Pal_Texture;
Pal_Shader = shd_palette_swapper;
Pal_Texel_Size = shader_get_uniform(shd_palette_swapper, "texel_size");
Pal_UVs = shader_get_uniform(shd_palette_swapper, "palette_UVs");
Pal_Index = shader_get_uniform(shd_palette_swapper, "palette_index");
Pal_Texture = shader_get_sampler_index(shd_palette_swapper, "palette_texture");

#endregion

#region Do not touch unless you know what you're doing

//Rich Presence display
rp_display = "";
lastbgm = -1;

//Current file
global.current_file = -1;

//Tick for things like question blocks
global.tick = 0;

//Whether the game is frozen currently (doesn't freeze everything unlike a pause)
global.frozen = false;

//P-switch time
global.pswitch = 0;

mainleveltime = -1;

//Showing time (between warps)
showtime = true;

timeup = false;

//Display char
char = chara.mario;
powerup = itemtype.id_small;

//Fonts
global.font = font_add_sprite_ext(spr_font,"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-x!@.*",0,0);
global.font_alt = font_add_sprite_ext(spr_font_palette,"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-x!@.*",0,0);
global.font_smb2 = font_add_sprite_ext(spr_font_smb2,"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-x!@.*",0,0);
global.pointfont = font_add_sprite_ext(spr_font_points,"0123456789",0,0);

global.currentfont = global.font;

//Guesses
global.guesses = 0;

//Fade alpha
fadealpha = 0;

//Last room you were in
global.last_room = room;

//The music to be played
bgm = -1;

//The index of the actual music playing
bgm_sound = -1;

//Current music tempo
tempo = 1;

//Time the screen shakes for
shake_length = 0;

//Level start timer manager
levelstart = 0;

//The current theme, since sometimes it won't match up with the level control
currenttheme = themetype.overworld;

//Switching music due to themes, new levels, etc.
choosemusic = false;

//GameOver time managing
gameover_timer = 0;

//Does the song loop
loop_song = true;

//Display variables for mid-actions where it doesn't match up with the actual variables
displaytime = 0;
displaylevel = "";
displaycoins = 0;

//Time variables
timetick = 25;

//Freeze the time (warping)
global.freezetime = false;

alarm[2] = 2;

//Fading variables
fade_out = -1;
fade_in = -1;
fade_dir = 0;
fadetimer = 0;
fadetimercheck = false;

//Solid BG fade
bg_fade = -1;

//Currently drawing the HUD
draw_hud = true;

//Debug
choosing_level = 0;

//Surface for the HUD
hudsurf = -1;
hw = -1;

//Selecting player
selecting_player = false;
arrow_index = 0;

//Save the game
global.savegame = false;

//Surface for the pause BG
global.pausebgsurface = -1;

//Set up levels
currentgame = game.smb1;
global.currentgame_name = "null";
level_list();

//Destroy multiple instances
if (instance_exists(obj_controller))

	with (obj_controller)
	
		if (id != other.id)
		
			instance_destroy();
			
_dw = display_get_width();
_dh = display_get_height();
_cam = camera_create();
			
#endregion

scr_buttons_init();

draw_black = false;

last_modern = global.moderneffects;