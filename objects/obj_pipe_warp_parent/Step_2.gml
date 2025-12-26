/// @description All pipe warp logic

if (timer > 0 && !global.levelcleared) {
	
	timer --;
	
	if (timer <= 0) {
		
		global.dest_id = destination_id;
		
		if (destination != -1) {
		
			event_user(0);
			
		} else {
			
			destination = room;
			event_user(0);
			
		}
		
	}
	
}