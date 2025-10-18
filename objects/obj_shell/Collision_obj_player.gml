/// @description Interaction w/ the player

if (cooldown > 0 || global.frozen || dead) exit;

if (moving || other.invincible) {

	// Inherit the parent event
	event_inherited();

} else {
	
	//Set up cooldown and start moving
	cooldown = 4;
	extracooldown = 20;
	moving = true;
	enemyturn = false;
	
	var startspd = 3;
	
	hspd = (other.x > x) ? -startspd : startspd;
	
	//Specify the player to reward 1-up to
	kicker = other.id;
	
	//Add to their combo
	other.combo ++;
		
	if (extra_points) {
		
		hit_combo(10,other.combo,true,other.char);
		
	} else {
		
		if (other.hspd == 0) {
	
			//Offset the player's combo for the shell
			hit_combo(other.combo,other.combo,true,other.char);
			
		} else {
			
			//Offset the player's combo for the shell
			hit_combo(other.combo+2,other.combo,true,other.char);
			
		}
		
	}
	
	if (!global.moderneffects)
	
		//Offset own combo to start at 500
		combo = 3;
		
	else
	
		combo = 1;
	
}