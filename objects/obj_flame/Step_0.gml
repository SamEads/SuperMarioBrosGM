if (global.frozen) exit;

image_speed = 0.25;

var spd = 1;

if (fast) {

	spd = 1.5;
	image_speed = 0.375;
	
}

if (!flame_sound) {
	
	if (instance_in_view(self,view_camera[0],24)) {
		
		audio_play_stop_sound(snd_flame,0,0);
		flame_sound = true;
		
		if (x > camera_get_view_x(view_camera[0])+(camera_get_view_width(view_camera[0])/2)) {
			
			image_xscale = -1;
			
		} else {
			
			image_xscale = 1;
			
		}
		
	}
	
}

if (flame_sound) {

	x += sign(image_xscale)*spd;
	
	if (y > dest_y) {
		
		y --;
		
		if (y <= dest_y) {
			
			y = dest_y;
			
		}
		
	}
	
	if (y < dest_y) {
		
		y ++;
		
		if (y >= dest_y) {
			
			y = dest_y;
			
		}
		
	}
	
	if (!instance_in_view(self,view_camera[0],32)) {
		
		instance_destroy();
		
	}
	
}