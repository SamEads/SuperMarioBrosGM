/// @description key_to_string(key)
/// @param key

function key_to_string(key){
 
	switch (key) {
		
		case vk_space:			return "Space"; break;
		case vk_left:			return "Left"; break;
		case vk_right:			return "Right";	break;
		case vk_up:				return "Up"; break;
		case vk_down:			return "Down"; break;
		case vk_add:			return "Plus"; break;
		case vk_alt:			return "Alt"; break;
		case vk_backspace:		return "Backspace"; break;
		case vk_control:		return "Control"; break;
		case vk_decimal:		return "Carrot"; break;
		case vk_delete:			return "Delete"; break;
		case vk_divide:			return "F. Slash"; break;
		case vk_end:			return "End"; break;
		case vk_enter:			return "Enter"; break;
		case vk_escape:			return "Escape"; break;
		case vk_f1:				return "F1"; break;
		case vk_f2:				return "F2"; break;
		case vk_f3:				return "F3"; break;
		case vk_f4:				return "F4"; break;
		case vk_f5:				return "F5"; break;
		case vk_f6:				return "F6"; break;
		case vk_f7:				return "F7"; break;
		case vk_f8:				return "F8"; break;
		case vk_f9:				return "F9"; break;
		case vk_f10:			return "F10"; break;
		case vk_f11:			return "F11"; break;
		case vk_f12:			return "F12"; break;
		case vk_home:			return "Home"; break;
		case vk_insert:			return "Insert"; break;
		case vk_lalt:			return "L. Alt"; break;
		case vk_lcontrol:		return "L. Ctrl"; break;
		case vk_lshift:			return "L. Shift"; break;
		case vk_multiply:		return "Multiply"; break;
		case vk_numpad0:		return "Num 0"; break;
		case vk_numpad1:		return "Num 1"; break;
		case vk_numpad2:		return "Num 2"; break;
		case vk_numpad3:		return "Num 3"; break;
		case vk_numpad4:		return "Num 4"; break;
		case vk_numpad5:		return "Num 5"; break;
		case vk_numpad6:		return "Num 6"; break;
		case vk_numpad7:		return "Num 7"; break;
		case vk_numpad8:		return "Num 8"; break;
		case vk_numpad9:		return "Num 9"; break;
		case vk_pagedown:		return "Page Down"; break;
		case vk_pageup:			return "Page Up"; break;
		case vk_pause:			return "Pause"; break;
		case vk_printscreen:	return "Prt Scr"; break;
		case vk_ralt:			return "R. Alt"; break;
		case vk_rcontrol:		return "R. Ctrl"; break;
		case vk_shift:			return "Shift"; break;
		case vk_subtract:		return "Subtract"; break;
		case vk_tab:			return "Tab"; break;
		case 20:				return "Caps Lock"; break;
		case 91:				return "Win Key"; break;
		case 92:				return "R. Win Key"; break;
		case 93:				return "Menu"; break;
		case 145:				return "Scr. Lock"; break;
		case 176:				return "Mus. Next"; break;
		case 177:				return "Mus. Prev"; break;
		case 178:				return "Mus. Stop"; break;
		case 179:				return "Mus. Pause"; break;
		case 186:				return "Colon"; break;
		case 187:				return "Plus"; break;
		case 189:				return "Minus"; break;
		case 188:				return "Comma"; break;
		case 190:				return "Period"; break;
		case 192:				return "Tilde"; break;
		case 219:				return "L. Bracket"; break;
		case 220:				return "B. Slash"; break;
		case 221:				return "R. Bracket"; break;
		case 222:				return "Quotation"; break;
		default:				return chr(string(key)); break;
		
	}
	
}