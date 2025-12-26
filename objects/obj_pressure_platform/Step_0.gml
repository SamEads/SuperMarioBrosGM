// Inherit the parent event
event_inherited();

var player = instance_place(x,bbox_top-8,obj_player);

if (player) {
	
	if (player.vspd >= 0 && !player.dead) {
		
		if (cooldown <= 0) {
		
			vspd = 2;
			
		} else
		
			cooldown --;
		
	} else {
		
		cooldown = default_cooldown;
		vspd = 0;
		
	}
	
} else {
	
	vspd = 0;
	cooldown = default_cooldown;
	
}