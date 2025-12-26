/// @description Stomp script

hspd = 0;
cooldown = 8;
moving = false;
audio_play_stop_sound(snd_stomp,0,0);

if (extracooldown <= 0) {

	if (extra_points) {
		
		if (global.moderneffects) other.combo ++;
		hit_combo(10,other.combo,false,other.char);
		
	} else {
		
		if (combo == 0) {

			other.combo ++;
			hit_combo(other.combo+2,other.combo,false,other.char);
			
		} else {
			
			combo ++;
			hit_combo(combo,combo,false,other.char);
			
		}
		
	}
	
}