/// @description Red Parakoopa

// Inherit the parent event
event_inherited();

if (global.hardmode > 1)

	alt_object = obj_parakoopa_blue;

//Don't swap palettes based on theme
swap_palette = false;

//Set death sprite
deathsprite = spr_shell_red;
stompsprite = spr_shell_red;

//Direction
direct = 1;

//No physics
physics = false;

//Different scoring
differentscoring = true;

//Invincible score
alternatescore = 200;

thrown_object = obj_shell;

color = 1;