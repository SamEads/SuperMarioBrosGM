if (!instance_in_view(self,view_camera[0],8)) {

	active = true;
	chosenright = false;
	exit;
	
}
	
if (!active) exit;

var player = instance_nearest(x,y,obj_player);

if (player) {

	if (player.x >= x) {
	
		if (distance_to_object(obj_player) < 8) {

			if (active) {

				global.guesses ++;
				active = false;
				chosenright = true;

			}
		
		} else {
		
			active = false;
		
		}
	
	}
	
}