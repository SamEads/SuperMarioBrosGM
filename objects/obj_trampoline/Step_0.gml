if (global.frozen) {
	
	if (image_speed != 0)
	
		retspd = image_speed;
		
	image_speed = 0;
		
} else if (retspd != 0) {

	image_speed = retspd;
	retspd = 0;
	
}

player = instance_nearest(x,y,obj_player);

if (image_speed < 0) exit;

if (player) {

	if (instance_place(x,bbox_top-1-player.vspd,player)
	&& player.vspd >= 0
	&& !player.dead) {
	
		if (player.bbox_bottom >= bbox_top-1-player.vspd) {
		
			captor = player.id;
			captor.physics = false;
		
		}
	
	}
	
}

if (captor != noone && captor.vspd >= 0) {

	if (captor.dead) {
		
		captor.canjump = true;
		captor = noone;
		exit;
		
	}

	if (captor.canjump) {
		
		with (captor) {
			
			if (hspd != 0)
			
				stored_hspd = hspd;
				
			else
			
				stored_hspd = 0;
			
			if (button_check(abutton)) {
				
				can_highjump = false;
				
			} else {
				
				can_highjump = true;
				
			}
			
		}
		
	}
	
	captor.grounded = true;
	captor.physics = false;
	captor.canjump = false;
	captor.hspd = 0;
	captor.vspd = 0;
	
	if (image_speed == 0)
	
		image_speed = 0.375;
	
	if (instance_exists(mysolid)) mysolid.image_yscale = 1;
	
	captor.y = bbox_top-16-(image_index*-5);
	
} else {
	
	if (captor != noone) {
			
		if (instance_exists(captor) && !instance_place(x,y,captor)) {
	
			captor.physics = true;
			captor.canjump = true;
			captor = noone;
				
		}
		
	}
	
	if (instance_exists(mysolid))
	
		mysolid.image_yscale = 1;
	
}