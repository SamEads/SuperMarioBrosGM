function scr_buttons_init() {
	
	controllable = true;

	left = global.lkey;
		
	right = global.rkey;
		
	up = global.ukey;
		
	down = global.dkey;
    
	abutton = global.abutton;
		
	bbutton = global.bbutton;
		
	select = global.select;
		
	start = global.start;
	
	ls_up = 0;
	
	ls_down = 0;
	
	ls_left = 0;
	
	ls_right = 0;
	
	ls_up_press = 0;
	
	ls_down_press = 0;
	
	ls_left_press = 0;
	
	ls_right_press = 0;
	
	ls_up_release = 0;
	
	ls_down_release = 0;
	
	ls_left_release = 0;
	
	ls_right_release = 0;
	
	controller = 0;
	
	//0: Keyboard & Controller
	for (var i = 0; i < gamepad_get_device_count(); i ++) {
		
		if gamepad_is_connected(i)
		
			controller = i;
		
	}

}