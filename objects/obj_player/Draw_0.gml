/// @description Draw the player

if (mount == noone) {
	
	/*var i = 0;
	var amount = 1;
	var alp = image_alpha;
	
	if (global.moderneffects && invincibletimer > 0)
	
		amount = 2;
		
	else
	
		image_blend = c_white;
	
	repeat (amount) {
		
		if (i == 1) {
		
			gpu_set_blendmode(bm_add);
			
			image_alpha = invincibility_alpha;
			
			image_blend = make_colour_hsv((get_timer()/1500)%255, 190*invincibility_alpha, 255);
			
		}*/
	
		var extra_y_offset = 0;
	
		if (powerup == itemtype.id_subcon)
	
			extra_y_offset = -1;
	
		pal_swap_set_char(char,floor(pal));

		draw_sprite_custom_origin(sprite_index,image_index,(x+manual_x_offset),(y+manual_y_offset)+1+extra_y_offset,sprite_width/2,sprite_height,xscale,yscale,0,image_blend,image_alpha);

		shader_reset();

		if (shaketimer > 0) {
	
			var off_y = (powerup == itemtype.id_small) ? 0: -8;
	
			draw_sprite_custom_origin(spr_shake,shaketimer/2,(x+manual_x_offset),(y+manual_y_offset)+1+off_y+extra_y_offset,sprite_width/2,sprite_height,xscale,yscale,0,image_blend,image_alpha);
	
		}/*
		
		i ++;
		
		gpu_set_blendmode(bm_normal);
		
		image_alpha = alp;
		
	}*/
	
}