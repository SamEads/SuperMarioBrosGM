/// @description Green & Red Shells

//Inherit parent event
event_inherited();

//Invincible score
alternatescore = 200;

//Set default speed values
hspd = 0;

//Image speed
image_speed = 0;

//Turn at enemies
enemyturn = false;

//Currently moving
moving = false;

//Who kicked the shell
kicker = noone;

//Shell combo
combo = 0;

//Timer for getting back up
shelltimer = -1;

//Alternate scoring from default
differentscoring = true;

//Extra cooldown so that the scoring doesn't interact with combos in situations like the 1-up trick
extracooldown = 0;

//Color (0-green, 1-red)
color = 0;

//Return instance
return_instance = -1;

castle_alt_palette = true;

//Has koopa
inhabited = false;

//Extra points
extra_points = false;

//Go farther into the ground
extra_y = 1;

//If this is above 0, don't decelerate in the air because you were just thrown
throw_timer = 0;

//Return object
thrown_object = object_index;