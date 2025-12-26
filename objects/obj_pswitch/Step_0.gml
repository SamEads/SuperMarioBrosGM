// Inherit the parent event
event_inherited();

image_index = global.tick;

var player = instance_nearest(x,y,obj_player);

if (player) {
	
	if (collision_rectangle(bbox_left-2,bbox_top+2,bbox_right+2,bbox_top-4,player,0,0)) {
		
		if (player.vspd >= 0)
		&& (player.bbox_bottom < bbox_top+1+abs(player.vspd)) {
		
			global.pswitch = 720;
			instance_destroy();
			instance_create_depth(x,y,depth,obj_pswitch_pressed);
			screen_shake(15);
			audio_play_stop_sound(snd_bump,0,0);
			
			with (player)
			
				event_user(0);
			
		}

	}
	
}