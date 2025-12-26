function physics_init() {

	//Various speed variables
	hspd = 0;
	vspd = 0;
	grav = 0.15625;
	
	//Whether the entity is on the ground
	grounded = false;
	
	//Flip speeds at wall
	wall_flip = false;
	
	//Vspd cap
	vspd_cap = 4;

	//Bouncy
	bouncy = false;
	
	//Currently bouncing
	bouncing = false;
	
	//Wall at
	wallframe = false;

}