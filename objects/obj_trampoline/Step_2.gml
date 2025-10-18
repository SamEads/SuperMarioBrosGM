if (captor != noone) {
	
	if (!instance_place(x,y,captor) && captor.vspd < 0) {
		
		captor.physics = true;
		captor.canjump = true;
		captor = noone;
		
	}
	
}