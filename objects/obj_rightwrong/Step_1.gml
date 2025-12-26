if (!active) exit;

var _player = instance_place(x,y,obj_player);

var wrong = false;

var warper = instance_place(x,y,obj_warper);

if (_player) {

	with (_player) {
	
		if ((distance_to_object(obj_warper) < 8) || (global.guesses < other.right_guesses)) {
		
			wrong = true;
		
			if (distance_to_object(warper) >= 8) {
			
				with (warper) {
				
					player = _player.id;
					event_perform(ev_step,ev_step_begin);
					player = noone;
					active = false;
					break;
				
				}
			
			}
		
		}
	
	}

	if (global.moderneffects) {

		if (wrong) {
	
			audio_play_stop_sound(snd_incorrect,0,0);
	
		} else {
	
			audio_play_stop_sound(snd_correct,0,0);
	
		}
	
		global.guesses = 0;
	
	}
	
	active = false;
	
}