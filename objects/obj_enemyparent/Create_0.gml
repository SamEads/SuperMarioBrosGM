/// @description Enemy parent

#region The ONLY creation code variable for enemies (the rest are ignored!)

always_active = false; 

alt_object = -1;

#endregion

//Inherit create event from parent
event_inherited();

//Can player stomp on enemy's head to kill it?
//0: Hurt player
//1: Hurt self
//2: Bounce player
stompable = true;

//Fireball-able?
//0: Doesn't get fire-balled
//1: Gets fire-balled
fireballable = true;

//Automatically change xscale?
//0: Manual Xscale
//1: Xscale matches HSPD
auto_xscale = true;

//Can be pick up?
pickup = true;

//Quickly return from a throw (think Bullet Bills)
quick_throw = false;

//Object when thrown (-1 to not have a special object)
thrown_object = -1;

//Image speed of enemy
image_speed = 0.125;
imgspd = -1;

//Score to give if killed by invincibility or fireball
alternatescore = 100;

if (!global.hardmode)

	//Starting speed of enemy
	hspd = -.5;
	
else

	//Starting speed of enemy in hard mode
	hspd = -.675;

//Does the enemy flip at walls
wall_flip = true;

//Maximum vertical speed of the enemy
vspd_cap = 4;

//Turn at other enemies? Disabling this makes it so enemies don't turn at you either
enemyturn = true;

//Do you flip at edges?
edgeflip = false;

//What's the sprite when the enemy is squished?
stompsprite = spr_goomba_squish;

//What's the sprite if the enemy is killed normally?
deathsprite = sprite_index;

//Is the scoring different from other enemies?
differentscoring = false;

//Does the eenmy have physics?
physics = true;

//Delay on the next hit if the enemy doesn't immediately die
cooldown = 8;

//Swap palettes to match the rest of the level?
swap_palette = true;

//Different palette for castles (will route to underground palette)
castle_alt_palette = false;

#region System

dead = false;
stompdead = false;

full_dead = false;

//Who hit the enemy
hitter = noone;

//Is the enemy currently invincible
invincible = false;

//Disappear timer
stompdisappear = 0;

//Spawner parent variables
spawner_parent = noone;
oob = false;

//The enemy's color
color = 0;

//Palette to create the enemy with
palette = -1;

//Whether or not the instance has shown itself on screen yet
been_in_view = false;

#endregion

start_depth = depth;