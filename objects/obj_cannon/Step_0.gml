if (global.frozen)

	exit;
	
cannontimer --;

if (instance_in_view(self,view_camera[0],16)) {

	if (cannontimer <= 0) {
	
		audio_play_stop_sound(snd_explosion,0,0);
	
		with (instance_create_depth(x,y-8,150,obj_bulletbill)) {
		
			cannon_bill = true;
			dir = other.image_angle+90;
			sprite_index = spr_cannonball;
			deathsprite = sprite_index;
		
		}
	
		cannontimer = 180;	
	
	}
	
}