/// @description audio_play_stop_sound(soundid, priority, loops);
/// @param soundid
/// @param priority
/// @param loops
function audio_play_stop_sound() {
	
	if (argument_count < 2)
	
		argument[2] = false;
	
	if (global.moderneffects) {
	
		switch (argument[0]) {
			
			default:
			
				audio_stop_sound(argument[0]);
		
				audio_play_sound(argument[0], argument[1], argument[2]);
			
				break;
			
			case (snd_jump):
			case (snd_break):
			case (snd_jump_small):
			case (snd_jump_subcon):
			case (snd_1up_blip):
			case (snd_1up):
			case (snd_bump):
			case (snd_coin):
			case (snd_flame):
			case (snd_growing_vine):
			case (snd_kick):
			case (snd_stomp):
			case (snd_pipe):
			case (snd_skid):
			case (snd_tail):
			case (snd_powerup):
			case (snd_powerup_reveal):
			case (snd_explosion):
			case (snd_fireball):
			case (snd_march_short):
		
				audio_play_stop_sound_at(argument[0], argument[1], argument[2],x,y);
			
				break;
			
		}
		
	} else {
		
		audio_stop_sound(argument[0]);
		
		audio_play_sound(argument[0], argument[1], argument[2]);
				
	}

}