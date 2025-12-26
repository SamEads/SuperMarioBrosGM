/// @description hit_combo(combo, kick?, kick sound offset, life reciever)
/// @param combo
/// @param modern_combo
/// @param kick?
/// @param life reciever
/// @param offset x
/// @param offset y

function hit_combo(argument0, argument1, argument2, argument3) {
	var _x = x;
	var _y = y;
	if (argument_count > 4) _x = argument4;
	if (argument_count > 5) _y = argument5;
	
#region Classic hit combo
	if (!global.moderneffects) {
		// kicking
		if (argument2) {
			audio_play_stop_sound(snd_kick, 0, 0);
		}
		// increment score
		if (argument0 < 11) {
			var scores = [ 0, 100, 200, 400, 500, 800, 1000, 2000, 4000, 5000, 8000 ];
			add_score(scores[argument0],_x,_y,1,60);
		} else {
			// >=11 = 1up
			if (!audio_is_playing(snd_1up)) {
				audio_play_stop_sound(snd_1up, 0, 0);
			}
			
			add_score(-1, _x, _y, 1, 60);
			global.p_lives[argument3]++;
		}
		return;
	}
#endregion
	
#region Modern hit combo
	if (argument1 < 8) {
		// is a kick
		if (argument2) {
			audio_play_stop_sound(snd_kick, 0, 0);
		}
		var scores = [ 0, 200, 400, 800, 1000, 2000, 4000, 8000 ];
		add_score(scores[argument1], _x, _y, 1, 60);
	}
	else {
		audio_play_stop_sound(snd_1up, 0, 0);
		add_score(-1, _x, _y, 1, 60);
		add_score(-1);
		global.p_lives[argument3]++;
	}
#endregion
}
