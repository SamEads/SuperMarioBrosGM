/// @description Vine warp logic

if (warping == 1) {
		
	warping = 2;
	global.dest_id = destination_id;
		
	if (destination != -1) {
		
		obj_controller.showtime = false;
		obj_controller.fadetimer = 15;
		global.dest = destination;
			
	} else {
			
		room_goto(room);
		global.dest = destination;
			
	}
	
}