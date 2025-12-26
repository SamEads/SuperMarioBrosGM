/// @description Music loops

if (!global.frozen || fadealpha == 1) {
	
	displaytime = global.time;
	
}

event_user(3);

music_loops();

//In case the modern effects changes, re-index layers
if (last_modern != global.moderneffects)
		
if (keyboard_check_pressed(vk_f12)) {
	
	var minutes_vis = string_replace_all(string_format(string(current_second),2,0)," ","0");
	var seconds_vis = string_replace_all(string_format(string(current_second),2,0)," ","0");
	
	var ampm = " AM";
	var hr = string(current_hour);
	
	if (current_hour >= 12) {
	
		ampm = " PM";
		
		if (current_hour > 12)
		
			hr = hr-12;
		
	}
	
	var ret = "Screenshots\\Screen Shot "+string(current_year)+"-"+string(current_month)+"-"+string(current_day)+" at "+hr+"."+minutes_vis+"."+seconds_vis+ampm+".png";
	
	screen_save(ret);
	
}