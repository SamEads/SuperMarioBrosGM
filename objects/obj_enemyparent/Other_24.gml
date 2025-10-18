/// @description Face the player

if (!enemyturn) exit;

if (hspd != 0) {
	
	if (instance_exists(obj_player)) {

		if (instance_nearest(x,y,obj_player).x > x)

			hspd = abs(hspd);
			
		else
		
			hspd = -abs(hspd);
			
	}
	
	if (auto_xscale)
	
		xscale = abs(xscale)*sign(hspd);
	
}