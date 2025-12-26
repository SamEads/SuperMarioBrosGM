/// @description Extra control checks

scr_buttons();

if (!global.moderneffects) {

	if ((controllable)
	&& (controllable_check == false)) {
				
		var repress_check = false;
				
		if ((keyboard_check(bbutton))
		|| gamepad_button_check(controller,key_to_button(bbutton)))
				
			repress_check = true;
						
		if (repress_check) {
				
			keyboard_key_release(bbutton);
			keyboard_key_press(bbutton);
						
		}
		
		controllable_check = true;

	}

}

if (!controllable)

	controllable_check = controllable;
	
if (global.debugmode) {
	
	if (keyboard_check_pressed(ord("C"))) {
	
		stunned = !stunned;
	
		if (stunned) {
	
			hspd = 0;
			controllable = false;
		
		} else
	
			controllable = true;
	
	}

}