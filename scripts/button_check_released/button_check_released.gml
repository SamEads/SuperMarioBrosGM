/// @description button_check_released()
function button_check_released() {

	if (!controllable) exit;
	
	if (keyboard_check_released(argument[0]))

		return keyboard_check_released(argument[0]);
		
	else {
		
		switch (argument[0]) {   
            
	        case (up):
	            if (ls_up_release == 1)
	            return true;
	            break;
            
	        case (down):
	            if (ls_down_release == 1)
	            return true;
	            break;
            
	        case (left):
	            if (ls_left_release == 1)
	            return true;
	            break;
            
	        case (right):
	            if (ls_right_release == 1)
	            return true;
	            break;

	    }
	
		return gamepad_button_check_released(controller,key_to_button(argument[0]));
		
	}
	
}