if (global.frozen || warping != 0) exit;

var player = (collision_rectangle(bbox_left+4,bbox_top,bbox_right-4,bbox_bottom,obj_player,0,1));

if (player) {
	
	if (player.climbing) {
		
		if (player.y <= bbox_bottom) {
		
			warping = 1;
			global.frozen = true;
			
		}
		
	}
	
}