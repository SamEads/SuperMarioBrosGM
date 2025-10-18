vspd += grav;
x += hspd;
y += vspd;

if (y >= ystart-16) && (vspd > 0) {

	instance_destroy();
	
	add_score(200,x,y+8,0.5,24,false);
	
}

if (mysolid != noone)

	if (!instance_place(x,y,mysolid))

		depth = -1;
		
switch (global.moderneffects) {
	
	default:

		sprite_index = spr_coin_collected; break;
		break;
		
	case (true):

		switch (obj_controller.currenttheme) {
	
			default: sprite_index = spr_coin_collected_ground; break;
			case (themetype.cave): sprite_index = spr_coin_collected_cave; break;
			case (themetype.castle): sprite_index = spr_coin_collected_castle; break;
	
		}
	
		break;
	
}