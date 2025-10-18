/// @description Create platforms if relatively in view, otherwise continue to wait to be in view

if (global.frozen) exit;

var _x = camera_get_view_x(view_camera[0]);
var _w = camera_get_view_width(view_camera[0]);

if (platformtick == -1)

	platformtick = 1;

if (bbox_left > (_x-1512))
&& (bbox_right < (_x+_w+512))
&& (platformtick >= 0) {
	
	var dir = 1;
	
	if (y > room_height-64)
	
		dir = -1;
	
	if (platformtick > 0) {
		
		platformtick --;
		
	} else if (platformtick == 0) {
		
	    with (instance_create_layer(x,y,"Instances",obj_movingplatform)) {
    
	        vspd = dir;
			hspd = 0;
			image_xscale = other.image_xscale;
			barrier = other.barrier;
			constant_movement = true;
		
	    }
		
		platformtick = settick;
		
	}
	
}

/*if (x > (xview - 256))
&& (x < (xview + wview + 256)) {

	if (platformtick == 0) {
	
		var dir = -1;
	
		if (y < room_height-64) {
		
			dir = 1;
		
		}

	    with (instance_create_layer(x,y,"Instances",obj_movingplatform)) {
    
	        vspd = dir;
			image_xscale = other.image_xscale;
			barrier = other.barrier;
		
	    }
    
	    platformtick = settick;
	
	} else if (platformtick == -1)

		platformtick = settick;
	
	platformtick --;

}*/