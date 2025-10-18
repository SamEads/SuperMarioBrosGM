// Inherit the parent event
event_inherited();

//Shoot fire
shoot_fire = true;

//Throw hammers
throw_hammers = false;

//Starting speed
hspd = -0.25;

//Xscale
xscale = -1;

//Don't turn at enemies
enemyturn = false;

//Returning speed for breathing
walk_hspd = 0;

//Is Bowser "dying"
falling_out = false;

//Dying animation
dying_animation = false;

//Hits left
hits_left = 4;

//Hurt timer
hurttimer = 0;

//Death sprite
deathsprite = spr_bowser;

#region Hammer variables

throwtimer = 2;

canthrowtimer = 8;

hammersleft = irandom_range(1,9);

throwing = false;

#endregion

//Random turn around
random_turnaround = irandom_range(180,360);

auto_xscale = false;
wall_flip = false;
stompable = false
jumptimer = 60;

breathetimer = irandom_range(60,270);

vspd_cap = 2;

autogravity = false;
ignorecorners = false;

pickup = false;