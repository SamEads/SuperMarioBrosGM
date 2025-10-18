if (window_has_focus()) {

	if (timer > 30 && endtimer == 0) {
	
		scr_buttons();
	
		if ((timer%20 == 1) && (alp < 1)) alp += 0.2;
	
		if (alp >= 1 && endtimer == 0) {
		
			if (button_check(start))
		
				endtimer = 1;
		
		}
	
	} else if (endtimer == 0)

		alp = 0;

	if (endtimer <= 0)

		timer ++;

	else {
	
		endtimer ++;
	
		if ((endtimer%20 == 1) && (alp >= 0)) alp -= 0.2;
	
		if (alp < 0)
	
			room_goto(rm_setup);
		
	}

}