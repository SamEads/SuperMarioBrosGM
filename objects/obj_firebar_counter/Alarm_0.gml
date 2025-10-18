/// @description Create the fireballs

var i = 0;

for (i = 0; i < length; i += 1) {
	
	buddyid[i] = 0;
	
}

for (i = 0; i < length; i += 1) {
	
	with instance_create_depth(x+(lengthdir_x(i*distance,round(updateangle))),(y+(lengthdir_y(i*distance,round(updateangle)))),depth-1,obj_firebar_fireball) {
		
		other.buddyid[i] = id;
		
	}

}