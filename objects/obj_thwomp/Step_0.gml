/// @description Thwomp logic

if (global.frozen) {

	event_inherited();
	exit;
	
}

//Inherit the parent event
event_inherited();

if (instance_exists(obj_player)) {
	
	if (thwompstate < 2) {
	
		if distance_to_point(instance_nearest(x,y,obj_player).x,y) <= 24 {
		
			thwompstate = 2;
			grounded = false;
	
		} else if distance_to_point(instance_nearest(x,y,obj_player).x,y) <= 48 {
		
			thwompstate = 1;
		
		} else {
		
			thwompstate = 0;
		
		}
	
	}
	
}

if (thwompstate == 2) {
	
	physics = true;
	
	if (grounded) {
		
		//Shake the screen
		screen_shake(30);
		
		//Make a thud sound
		audio_play_stop_sound(snd_explosion,0,0);
		
		//Sit on the ground for a moment
		thwompstate = 3;
		
		//Prepare to go back up
		thwomptimer = 50;
		
	}
	
} else if (thwompstate == 4) {
	
	physics = false;
	
	y --;
	
	if (collision_rectangle(bbox_left+1,bbox_top,bbox_right-abs(hspd),bbox_top,obj_solid, 1, 0)) {
    
		while collision_rectangle(bbox_left+2,bbox_top,bbox_right-1,bbox_top,obj_solid, 1, 0) {
				
		    y ++;
				
		}
		
		thwompstate = 0;
		
	}
	
}

if (thwomptimer > 0) {
	
	thwomptimer --;
	
	if (thwomptimer <= 0)

		thwompstate = 4;

}

switch (thwompstate) {

	case (0): image_index = 0; break;
	case (1): image_index = 1; break;
	case (2): image_index = 2; break;
	case (3): image_index = 2; break;
	case (4): image_index = 0; break;
	
}

/*if (collision_rectangle(bbox_left+1,bbox_bottom,bbox_right-1,bbox_bottom+1,obj_block,false,false)) {
	
	with collision_rectangle(bbox_left+1,bbox_bottom,bbox_right-1,bbox_bottom+1,obj_block,false,false)
	
		instance_destroy();
		
	vspd /= 2;
	thwompstate = 2;
		
}