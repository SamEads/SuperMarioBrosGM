if (!active)

	exit;

with (deposit) {
	
	if (instance_place(x,bbox_bottom+2,obj_semisolid)) {
		
		controllable = false;
		other.starttimer = 5;
		
	} else {
		
		controllable = false;
		other.starttimer = 20;
		
	}
	
}