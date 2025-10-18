function pal_swap_set_char(char,pal) {

	var spr = -1;
	var offset = 0;
	
	switch (char) {
		
		default:
			spr = (!global.moderneffects) ? spr_pal_mario : spr_pal_mario_alt;
			offset = (global.moderneffects) ? 1 : 0;
			break;
			
		case (chara.luigi):
			spr = (global.moderneffects || powerup == itemtype.id_subcon) ? spr_pal_luigi_alt_2 : spr_pal_luigi_alt;
			offset = (!global.moderneffects && powerup != itemtype.id_subcon) ? 1 : 1;
			break;
			
		case (chara.toad):
			spr = (!global.moderneffects) ? spr_pal_toad : spr_pal_toad_alt;
			offset = (global.moderneffects) ? 1 : 0;
			break;
			
		case (chara.toadette):
			spr = (!global.moderneffects) ? spr_pal_toadette : spr_pal_toadette_alt;
			offset = (global.moderneffects) ? 1 : 0;
			break;
			
		case (chara.custom):
			spr = (!global.moderneffects) ? spr_pal_custom : spr_pal_custom_alt;
			offset = (global.moderneffects) ? 1 : 0;
			break;
			
	}

	pal_swap_set(spr,pal+offset);

}