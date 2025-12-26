var player = (instance_place(x,bbox_top-1,obj_player));

if (player) {
	
	if (player.grounded) {

		if (instance_place(x,y,obj_left)) {
	
			hspd = -1;
	
		} else if (instance_place(x,y,obj_right)) {
	
			hspd = 1;
	
		} else if (instance_place(x,y,obj_up)) {
	
			vspd = -1;
	
		} else if (instance_place(x,y,obj_down)) {
	
			vspd = 1;
	
		}
	
	}
	
}

// Inherit the parent event
event_inherited();