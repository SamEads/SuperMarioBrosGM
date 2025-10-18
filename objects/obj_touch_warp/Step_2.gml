/// @description Touch warp logic

if (warping == 1) {
		
	warptimer ++;
	
	if (warptimer >= 120) {
	
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
	
}

player = instance_place(x,y+16,obj_player);

if (player) {
	
	if (warping != 0 || !player.controllable) exit;

	if (player.bbox_top-12 >= bbox_top) {
	
		warping = 1;
		player.controllable = false;
		player.warping = true;
	
	}

}