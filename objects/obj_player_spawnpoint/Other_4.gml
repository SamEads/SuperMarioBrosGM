if (!active) exit;

with (deposit) {
	controllable = false;
	if (instance_place(x,bbox_bottom+2,obj_semisolid)) {
		other.starttimer = 5;
		
	} else {
		other.starttimer = 20;
	}
}