/// @description Manage active/inactive image index

if (can_hit)

	event_user(14);
	
else {
	
	image_speed = 0;
	
	if (vspd == 0 && hitsequence == 0)
	
		sprite_index = hitspr;
	
	switch (obj_controller.currenttheme) {
	
		default: image_index = 0; break;
		case (themetype.cave): image_index = 1; break;
		case (themetype.castle): image_index = 2; break;
		case (themetype.water): image_index = 3; break;
		case (themetype.snow): image_index = 4; break;
		case (themetype.desert): image_index = 5; break;
	
	}

}