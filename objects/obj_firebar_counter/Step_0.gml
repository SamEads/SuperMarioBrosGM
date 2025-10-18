/// @description Firebar logic

if (global.frozen) exit;

if (instance_in_view(self,view_camera[0],(distance * length) + 8) || always_active) {

	updatecounter ++;

	image_angle += firespd;

	if (updatecounter >= 6 || (global.moderneffects && updatecounter >= 2)) {
		
		for (var i = 0; i < length; i += 1) {
	
			if (instance_exists(buddyid[i])) {
	
				buddyid[i].x = x+(lengthdir_x(i*distance,round(updateangle)));
	
				buddyid[i].y = y+(lengthdir_y(i*distance,round(updateangle)));
				
			}
				
		}
		
		updatecounter = 0;
		updateangle = image_angle;
		
	}

	imagespd += 0.25;

}