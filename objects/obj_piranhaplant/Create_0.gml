event_inherited();

//Disable enemy turn
enemyturn = true;

//Can't be pick up
pickup = false;

//Turn to red piranha plant in hard mode
if (global.hardmode > 1)

	alt_object = obj_piranhaplant_red;

player_distance = 32;

spd = 0.5;

wait_timer = 60;

stand_timer = 70;

stompable = false;

distance = 28;

dir = image_angle+90;

state = 0;

image_speed = 0.125;

standtimer = 55;

depth = 150;

alternatescore = 200;

castle_alt_palette = true;

color = 0;