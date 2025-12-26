/// @description Turn into a shell

with instance_create_depth(x,y,depth,obj_shell) {
	
	color = other.color;
	inhabited = true;
	return_instance = other.object_index;
	image_index = 0;
	
	switch_spawns(other.id);
	
	switch (color) {
		
		case (0): sprite_index = spr_shell; break;
		case (1): sprite_index = spr_shell_red; swap_palette = false; break;
		case (2): sprite_index = spr_shell_blue; swap_palette = false; break;
		
	}
	
}

instance_destroy();
audio_play_stop_sound(snd_stomp,0,0);