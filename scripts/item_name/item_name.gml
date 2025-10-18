/// @function item_name(powerup)
/// @param powerup
function item_name() {

	switch (argument[0]) {
		
		case itemtype.id_small: return "small"; break;
		case itemtype.id_subcon:
			switch (holding) {
				default:
					return "subcon"; break;
				case (1):
					return "subcon_hold"; break;
					
			} break;
		default: return "big"; break;
		
	}

}