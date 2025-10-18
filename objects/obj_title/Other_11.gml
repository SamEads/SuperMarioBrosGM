/// @description "Let's-a Go!" (Load into the file)

obj_controller.fadetimer = 15;
global.levelcleared = true;
obj_controller.levelstart = 160;
global.data = ds_map_create();
load_game_file(file_selected,global.currentgame_name);