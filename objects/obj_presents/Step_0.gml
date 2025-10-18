if (timer == 30)

	audio_play_sound(snd_coin,0,0);
	
var time_on_screen = 120;
	
if (timer < time_on_screen+30) {

	timer ++;
	
	if (timer >= time_on_screen+30) {
		
		obj_controller.fadetimer = 25;
		global.dest = global.current_title;
		
	}

}