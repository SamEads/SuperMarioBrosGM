/// @description Turn into a fuse bob-omb

instance_destroy();

audio_play_stop_sound(snd_kick,0,0);

myfuse = (instance_create_depth(x,y,depth,obj_bobomb_fuse));

with (myfuse) {
	
	hspd = other.hspd;
	vspd = other.vspd;
	xscale = other.xscale;
	
}