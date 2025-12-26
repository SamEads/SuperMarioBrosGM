//Draw the HUD
obj_controller.draw_hud = true;

//Current menu
menu = 0;

//Current position on the menu
selection_position = 0;

//Current file selected to read information from
file_selected = 1;

image_alpha = 0;

depth = 10;

//Reset Worlds
global.world = 1;
global.level = 1;

//Reset current file
global.current_file = -1;

//Set up controls
char = 0;
scr_buttons_init();

//Can currently select options
can_select = true;

//Currently deleting a file
deleting = false;

//Currently choosing a world
choosing_world = 0;

//Timing variables
widescreen_delay = 0;
arrow_index = 0;

//If your last room was the set-up room, you probably got here from choosing controls. Change to the correct spot
if (global.last_room == rm_setup)

	menu = 4;