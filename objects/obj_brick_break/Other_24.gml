switch (obj_controller.currenttheme) {
	
	default: image_index = 0; break;
	case (themetype.cave): image_index = 1; break;
	case (themetype.castle): image_index = 2; break;
	case (themetype.water): image_index = 3; break;
	case (themetype.snow): image_index = 4; break;
	case (themetype.desert): image_index = 5; break;
	
}

switch (global.smb2_mode) {
	
	default:
	
		switch (global.moderneffects) {
			
			case (false):

				if (hitsequence != 0) {
	
					sprite_index = spr_brick_hit;
	
				} else {
	
					sprite_index = spr_brick;
	
				}
		
				break;
				
			case (true):
			
				sprite_index = spr_brick_modern;
				
				break;
			
		}
		
		break;
		
	case (true):
	
		if (hitsequence != 0) {
	
			sprite_index = spr_brick_alt_hit;
	
		} else {
	
			sprite_index = spr_brick_alt;
	
		}
		
}