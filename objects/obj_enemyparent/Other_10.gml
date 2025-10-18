/// @description Death event

if (dead) exit;

//Modify sprite & position
sprite_index = deathsprite;
yscale = -sign(yscale);
image_index = 0;
image_speed = 0;

//Set to dead
dead = true;

//Set up death speed
if (hspd == 0) hspd = 1;
hspd = ((bbox_left+bbox_right)/2 > other.x) ? sign(abs(hspd)) : -sign(abs(hspd));

if (!instance_place(x,y,obj_liquid))

	vspd = -3;
	
else

	vspd = -1;