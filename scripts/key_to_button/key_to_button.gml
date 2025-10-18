function key_to_button(argument0) {
	
	switch (argument0) {
		
		case (abutton): return (!global.controllertype) ? gp_face1 : gp_face2; break;
		case (bbutton): return (!global.controllertype) ? gp_face3 : gp_face1; break;
		case (left): return gp_padl; break;
		case (right): return gp_padr; break;
		case (up): return gp_padu; break;
		case (down): return gp_padd; break;
		case (start): return gp_start; break;
		case (select): return gp_select; break;
		
	}

}