if (global.frozen) exit;

if (instance_number(obj_bulletbill) < 1) {
	
	timer ++;
	
	if (timer >= 30) {
		
		timer = 0;
		
		_y = ceil(camera_get_view_y(view_camera[0])/16)*16;
		
		_y += (ceil(irandom_range(16,camera_get_view_height(view_camera[0])-16)/16))*16;
		
		var bill = obj_bulletbill;
		
		if (global.hardmode > 1)
		
			bill = obj_bulletbill_homing;
		
		with instance_create_depth(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])+8,_y,-3,bill) {
			
			audio_play_stop_sound(snd_explosion,0,0);
			
			if (global.moderneffects) {
			
				sprite_index = spr_bulletbill_arm;
				
			} else
			
				sprite_index = spr_bulletbill;
				
			xscale = -1;
			dir = 180;
			bullet_timer = 30;
			
		}
		
	}
	
}