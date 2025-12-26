if (global.frozen) exit;

distance_traveled += vspd;

if ((distance_traveled%16 == 0) && (vspd != 0)) {
	
	with instance_create_depth(x,ystart,190,obj_vine) {
		
		parent = other.id;
		
	}
	
	if (instance_place(x,y+(8*sign(vspd)),obj_stop)) {
		
		vspd = 0;
		
	}
	
}

y += vspd;