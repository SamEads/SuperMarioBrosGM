/// @description button_check_pressed()
function button_check_pressed() {

	if (!controllable) return false;
	
	if (keyboard_check_pressed(argument[0]))

		return keyboard_check_pressed(argument[0]);
		
	else {
		
		switch (argument[0]) {
            
	        case (up):
	            if (ls_up_press == 1)
	            return true;
	            break;
            
	        case (down):
	            if (ls_down_press == 1)
	            return true;
	            break;
            
	        case (left):
	            if (ls_left_press == 1)
	            return true;
	            break;
            
	        case (right):
	            if (ls_right_press == 1)
	            return true;
	            break;

	    }
	
		return gamepad_button_check_pressed(controller,key_to_button(argument[0]));
		
	}

}