/// @description Thwomp

//Thwomp state
//0: Idle
//1: Angry
//2: Falling
//3: Waiting to go back up
//4: Going back up
thwompstate = 0;

//Inherit create event from parent
event_inherited();

//Can player stomp on enemy's head to kill it?
stompable = false;

//Fireball-able?
fireballable = false;

//Automatically change xscale?
auto_xscale = false;

//What's the sprite if the enemy is killed normally?
deathsprite = sprite_index;

//Physics? (Still moves left to right by default - no collisions though)
physics = false;

//Speed of enemy
hspd = 0;

//Turn at other enemies? Disabling this makes it so enemies don't turn at you either
enemyturn = false;

//Image speed of enemy
image_speed = 0;

//Thwomp timer
thwomptimer = 0;

pickup = false;