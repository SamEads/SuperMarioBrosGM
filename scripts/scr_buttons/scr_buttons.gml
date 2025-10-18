function scr_buttons() {

	//Reset press & release
	ls_up_press = 0;
		
	ls_down_press = 0;
		
	ls_left_press = 0;
		
	ls_right_press = 0;
		
	ls_up_release = 0;
		
	ls_down_release = 0;
		
	ls_left_release = 0;
		
	ls_right_release = 0;

	//Up
	if (ls_up == 0) && (gamepad_axis_value(controller,gp_axislv) <= -0.425) {
            
		ls_up_press = 1;
            
		ls_up = 1;

	} else if (ls_up == 1) && (gamepad_axis_value(controller,gp_axislv) > -0.425) {

		if (ls_up == 1)
        
		    ls_up_release = 1;
    
		ls_up = 0;
        
	}

	//Down
	if (ls_down == 0) && (gamepad_axis_value(controller,gp_axislv) >= 0.425) {

		if (ls_down == 0)
        
		    ls_down_press = 1;
            
		ls_down = 1;

	} else if (ls_down == 1) && (gamepad_axis_value(controller,gp_axislv) < 0.425) {

		if (ls_down == 1)
        
		    ls_down_release = 1;
    
		ls_down = 0;
        
	}

	//Left
	if (ls_left == 0) && (gamepad_axis_value(controller,gp_axislh) <= -0.425) {

		if (ls_left == 0)
        
		    ls_left_press = 1;
    
		ls_left = 1;

	} else if (ls_left == 1) && (gamepad_axis_value(controller,gp_axislh) > -0.425) {
    
		if (ls_left == 1)
        
		    ls_left_release = 1;

		ls_left = 0;
        
	}

	//Right
	if (ls_right == 0) && (gamepad_axis_value(controller,gp_axislh) >= 0.425) {
    
		if (ls_right == 0)
        
		    ls_right_press = 1;

		ls_right = 1;

	} else if (ls_right == 1) && (gamepad_axis_value(controller,gp_axislh) < 0.425) {

		if (ls_right == 1)
        
		    ls_right_release = 1;
    
		ls_right = 0;
        
	}

}