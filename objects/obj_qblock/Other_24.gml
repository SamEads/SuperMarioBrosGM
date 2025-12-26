// Inherit the parent event
event_inherited();

switch (global.moderneffects) {
	
	default:

		switch (obj_controller.currenttheme) {
	
			default: sprite_index = spr_qblock; break;
			case (themetype.cave): sprite_index = spr_qblock_cave; break;
			case (themetype.castle): sprite_index = spr_qblock_castle; break;
			case (themetype.water): sprite_index = spr_qblock_water; break;
			case (themetype.snow): sprite_index = spr_qblock_snow; break;
			case (themetype.desert): sprite_index = spr_qblock_desert; break;
	
		}
	
		break;
		
	case (true):

		switch (obj_controller.currenttheme) {
	
			default: sprite_index = spr_qblock_modern; break;
			case (themetype.cave): sprite_index = spr_qblock_cave_modern; break;
			case (themetype.castle): sprite_index = spr_qblock_castle_modern; break;
			case (themetype.water): sprite_index = spr_qblock_water_modern; break;
			case (themetype.snow): sprite_index = spr_qblock_snow_modern; break;
			case (themetype.desert): sprite_index = spr_qblock_desert_modern; break;
	
		}
	
		break;
	
}