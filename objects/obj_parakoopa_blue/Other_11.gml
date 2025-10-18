instance_destroy();

audio_play_stop_sound(snd_stomp,0,0);

with instance_create_depth(x,y,depth,obj_koopa_blue) {
	
	hspd = other.xscale * 0.675;
	switch_spawns(other.id);
	
	if (!global.moderneffects)
	
		edgeflip = false;
	
}
			
other.combo += (global.moderneffects) ? 1 : 0;
			
hit_combo(3,other.combo,false, other.char);