/// @description Player
ang = 0;

#region Character variables

char = global.p_char[0];
powerup = global.p_powerup[0];
pal = 0;

#endregion

#region Speed variables

#endregion

#region State values

//Current vine
vine = noone;

//Invincible
invincible = false;

//Climbing
climbing = false;

//Swimming
swimming = false;
swimsleft = 0;
swim_index = 0;

//Currently controllable
controllable = true;

//Use physics
physics = true;

//Unfinished/never to complete(?) - Yoshi Mount
mount = noone;

//Is the camera to follow the player currently?
follow_player = true;

//Whether the player is currently stunned
stunned = false;

//Skidding
skidding = false;

#endregion

#region System variables

//Pull timer for pulling up an object
pull_timer = 0;
pulling_up = false;
pull_y_goal = 0;
throw_timer = 0;
extra_y = 0;
charge = 0;
pull_object = noone;
newsprite = -1;
hit_block = false;

//Animating at a wall
wall_walking = false;

//Add VSPD, HSPD, GRAV
automatic_physics = false;

cooldown = 0;

canjump = true;

physics_init();

dead = false;
altdeath = false;

xscale = 1;

yscale = 1;

warping = false;

jumping = false;

crouching = false;

//0: not holding
//1: subcon hold
//>1: future?
holding = 0;

manual_x_offset = 0;
manual_y_offset = 0;

inwall = false;

jumprelease = true;

running = false;

transforming = false;

controllable_check = false;

combo = 0;
invincible_combo = 0;

runcooldown = 10;
shooting = 0;
vinecooldown = 0;
immune = false;
poweringdown = false;

noclip = false;
powerupcheck = false;
lastpowerup = powerup;
returnpal = 0;

tail_index = 0;
tail_x_offset = 0;
tail_y_offset = 0;

bubblesleft = 3;

//Put the player in front of everything on its layer
alarm[0] = 2;

#region Various timers to avoid use of alarms

transform_index = 0;
jumptimer = -1;
bubbletimer = 20;
immunetimer = 0;
transformtimer = 0;
deathtimer = 0;
invincibletimer = 0;
invincibility_alpha = 1;
spintimer = 0;
shaketimer = 0;

calculate_new_gravity = false;

cooldown = 0;

#endregion

#endregion

layer_create(-10,"Player");
layer_add_instance("Player",self);
scr_buttons_init();