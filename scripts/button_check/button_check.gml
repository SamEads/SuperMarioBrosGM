/// @description button_check()
function button_check(button) {
	if (!controllable) return false;
	
	if (keyboard_check(button)) {
		return keyboard_check(button);
	}
		
	switch (button) {   
	    case (up):
	        if (ls_up == 1)
	        return true;
	        break;
	    case (down):
	        if (ls_down == 1)
	        return true;
	        break;
	    case (left):
	        if (ls_left == 1)
	        return true;
	        break;
	    case (right):
	        if (ls_right == 1)
	        return true;
	        break;
	}
	
	return gamepad_button_check(controller,key_to_button(button));

}