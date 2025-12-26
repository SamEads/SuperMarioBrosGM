with instance_create_depth(x,y,depth,obj_shell_beetle) {
	
	color = 2;
	
	return_instance = other.object_index;
	
	image_yscale = other.image_yscale;
	
	switch_spawns(other.id);
	
	inhabited = true;
	
}

instance_destroy();
audio_play_stop_sound(snd_stomp,0,0);