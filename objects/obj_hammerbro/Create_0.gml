// Inherit the parent event
event_inherited();

// Hard mode
if (global.hardmode > 1)

	alt_object = obj_sledgebro;

// Normal sprite
walk_sprite = spr_hammerbro;

//Throw sprite
throw_sprite = spr_hammerbro_throw;

// High jump speed
highjump_spd = 4.675;

// Low jump speed
lowjump_spd = 2;

// Hammer X offset
hammer_x_offset = -1;

// Hammer Y offset
hammer_y_offset = -2;

x_middle = xstart;

chasing = false;

hspd = -0.25;

auto_xscale = false;

autograv = false;

jump_timer = irandom_range(180,240);

highjump = false;

lowjump_timer = 0;

hammers_left = irandom_range(2,7);

throw_timer = irandom_range(2,6)*10;

post_throw_timer = 60;

chase_timer = 3600;

differentscoring = true;

alternatescore = 1000;

wall_flip = false;

castle_alt_palette = true;

calculate_gravity = true;