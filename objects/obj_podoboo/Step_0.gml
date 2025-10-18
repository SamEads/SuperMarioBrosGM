if (global.frozen || !instance_in_view(self,view_camera[0],32)) exit;

if (bbox_top >= obj_controller.set_height) && (vspd >= 0) {
	
	timer --;
	
	vspd = 0;
	grav = 0;
	
	if (timer <= 0) {
		
		timer = 48+irandom_range(0,92);
		vspd = -4;
		grav = 0.1;
		goingdown = false;
		
	}
	
} else {
	
	if (instance_place(x,bbox_top-16,obj_down) && vspd < 0 && !goingdown) {
		
		goingdown = true;
		
	}
	
	if (goingdown)
	
		vspd += grav;
		
	y += vspd;
	
}