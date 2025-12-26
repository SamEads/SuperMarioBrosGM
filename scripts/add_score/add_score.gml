/// @description add_score(score,offset_x,offset_y,speed,distance,add_points?)
/// @param score
/// @param offsetx
/// @param offsety
/// @param speed
/// @param distance
/// @param add_points

function add_score() {
	
	var _x = x;
	var _y = y;

	if (argument_count > 1)
	
		if (argument[1] > -1)
	
			_x = argument[1];
		
	if (argument_count > 2)
	
		if (argument[2] > -1)
	
			_y = argument[2];
			
	with (obj_points)
		
		if (!global.levelcleared)
		
			instance_destroy();

	with instance_create_depth(_x,_y,-1,obj_points) {
		
		if (global.moderneffects)
		
			depth = -15;
	
		value = argument[0];
		
		if (argument_count > 3)
		
			if argument[3] != -1
		
				spd = argument[3];
			
		if (argument_count > 4)
		
			if argument[4] != -1
		
				lifespan = argument[4];
	
	}
	
	if (argument_count > 5) {
		
		if (argument[5] == true)
		
			global.points += (argument[0] >= 0) ? argument[0] : 0;
		
	} else global.points += (argument[0] >= 0) ? argument[0] : 0;
	
}