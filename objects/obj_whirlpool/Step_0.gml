/// @description Drag the player to the center

if (global.frozen) exit;

if (instance_place(x,y,obj_player)) {
	
	var player = instance_place(x,y,obj_player);
	
	if (player.dead) exit;
		
	var siding = (bbox_left+bbox_right)/2;

	if (player.x > siding+4) {
	
		player.x -= 0.5;
	
	} else if (player.x < siding-4) {
	
		player.x += 0.5;
	
	}

	if (!player.grounded) {

		player.vspd += 0.075;
	
	}

}