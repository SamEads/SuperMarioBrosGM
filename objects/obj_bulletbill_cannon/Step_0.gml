if (global.frozen || obj_controller.fadetimer != 0)

	exit;

if (instance_in_view(self,view_camera[0],16)) {
	
	var player = instance_nearest(x,y,obj_player);
	
	if (!player) exit;
	
	if (distance_to_point(player.x,y) > 16) {
	
		bullet_timer --;
	
		if (instance_number(bill) < 5) {
	
			if (bullet_timer <= 0) {
		
				audio_play_stop_sound(snd_explosion,0,0);
		
				with (instance_create_depth(x+8,y,150,bill)) {
					
					if (global.moderneffects) {
					
						with (effect_create(spr_smoke_large,0.25,x,y)) {
						
							depth = 0;
						
							if (player.x > other.x)
						
								x += 12;
							
							else
						
								x -= 12;
						
						}
						
					}
					
					cannon_bill = true;
				
					if (other.billsprite != -1) {
					
						sprite_index = other.billsprite;
					
					}
			
					if (player.x > x) {
				
						xscale = 1;
						dir = 0;
						x += 2;
				
					} else {
				
						xscale = -1;
						dir = 180;
						x -= 2;
				
					}
			
				}
		
				bullet_timer = 90 + irandom_range(0,144);
				
			}
		
		}
		
	}
	
}