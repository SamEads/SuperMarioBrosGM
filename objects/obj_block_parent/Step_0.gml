/// @description Block parent logic

if (global.frozen || hitsequence == 0) exit;

if (hitsequence == 1) {
	
	if (has_snow) {
		
		if (obj_controller.currenttheme == themetype.snow) {
		
			has_snow = false;
			
			var snow_amount = irandom_range(4,8);
			
			for (var i = 0; i < snow_amount; i ++) {
				
				with instance_create_depth(bbox_left+(i*(16/snow_amount)),bbox_top-8,-10,obj_snow_fall) {
					
					if (x >= (other.bbox_left+other.bbox_right)/2) {
						
						hspd = abs(hspd);
						
					} else {
						
						hspd = -abs(hspd);
						
					}
					
				}
				
			}
			
		}
		
	}
	
	
	event_user(0);
	vspd = -2;
	hitsequence = 2;
	y_disp = y;
	
}

if (hitsequence == 2) {
	
	y_disp += vspd;
	vspd += 0.25;
	
	if (vspd >= 0) {
		
		hitsequence = 3;
		
	}
	
}

if (hitsequence == 3) {
	
	y_disp += 2;
	
	if (y_disp >= y) {
		
		y_disp = y;
		hitsequence = 0;
		event_user(1);
		
	}
	
}