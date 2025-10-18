if (global.frozen || (!instance_in_view(self,view_camera[0],128) && hspd != 0)) exit;

if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_up,0,0) {
	
	dir = up;
	
}

if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_down,0,0) {
	
	dir = down;
	
}

if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_left,0,0) {
	
	dir = left;
	
}

if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_right,0,0) {
	
	dir = right;
	
}

accel = 0.01875;

if (dir == left && (hspd > -1) && vspd == 0) {
	
	hspd -= accel;
	
} else if (dir == right && (hspd < 1) && vspd == 0) {
	
	hspd += accel;
	
} else {
	
	if (abs(hspd) > accel*2) {
	
		hspd -= accel * sign(hspd);
		
	} else {
		
		hspd = 0;
		
	}
	
}

if (dir == up) && (vspd > -1.375) && (hspd == 0) {
	
	vspd -= accel;
	
} else if (dir == down) && (vspd < 1.375) && (hspd == 0) {
	
	vspd += accel;
	
} else {
	
	if abs(vspd) > accel*2 {
	
		vspd -= accel * sign(vspd);
		
	} else {
		
		vspd = 0;
		
	}
	
}

if (abs(vspd)) >= 1.375 {
	
	vspd = 1.375 * (sign(vspd));
	
}

if (abs(hspd)) >= 1 {
	
	hspd = 1 * (sign(hspd));
	
}

event_inherited();