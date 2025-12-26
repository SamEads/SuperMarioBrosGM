if (!sizecheck) {
	
	sizecheck = true;
	
	if (global.hardmode)
	
		if (image_xscale == 3)
	
			image_xscale = 2;
		
}

if (global.moderneffects) {
	
	var newsolid = false;
	
	if (!instance_exists(mysolid))
	
		newsolid = true;
	
	else if (mysolid.object_index == obj_solid)
	
		newsolid = true;
	
	if (newsolid) {
		
		with (mysolid) instance_destroy();
		mysolid = instance_create_depth(x,y,depth,obj_semisolid);
		
		with (mysolid) {
			
			image_xscale = other.image_xscale;
			image_yscale = other.image_yscale;
			
		}
		
	}
	
} else {
	
	if (instance_exists(mysolid)) {
		
		with (mysolid) instance_destroy();
		
	}
	
}

if (global.frozen) exit;

event_user(0);
	
if (instance_in_view(self,view_camera[0],128) || constant_movement) {
	
	x += hspd;
	y += vspd;
	
}

if (global.frozen) {
	
	with (mysolid)
	
		visible = false;
	
	image_speed = 0;
	exit;
	
}

with (mysolid) {
	
	x = other.x;
	y = other.y;
	
	image_speed = 0;
	image_xscale = other.image_xscale;
	image_index = other.image_index;
	sprite_index = other.sprite_index;
	
}

if (global.smb2_mode)

	image_index = 2;

else if (global.moderneffects)

	image_index = 1;
	
else

	image_index = 0;
	
image_speed = 0;