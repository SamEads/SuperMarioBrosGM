/// @description Red Koopa

// Inherit the parent event
event_inherited();

if (global.hardmode > 1)

	alt_object = obj_koopa_blue;

//Set to red color
color = 1;

//Flip at edges
edgeflip = true;

//Don't swap palettes based on theme
swap_palette = false;

//Set death sprite
deathsprite = spr_shell_red;
stompsprite = spr_shell_red;