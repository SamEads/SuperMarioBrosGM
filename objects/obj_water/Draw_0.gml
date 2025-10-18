if (!global.moderneffects) {
	
	sprite_index = spr_water_light_static;
	depth = 20;
	
} else {

	sprite_index = spr_water_light;
	depth = -20;

}

var col = hex($6ecaff);

for (var i = 0; i < image_xscale; i ++) {
	
	if (tilemap_pos[i,0] == false || global.moderneffects) {
		
		var skipwater = false;
	
		if (global.moderneffects) {
			
			gpu_set_blendmode_ext(bm_src_alpha,bm_inv_src_color);
			
			if (obj_controller.currenttheme == themetype.desert) {
			
				draw_sprite_ext(sprite_index,image_index,x+(i*16),y,1,1,0,col,0.8);
				skipwater = true;
				
			}
			
		}
		
		if (!skipwater) draw_sprite(sprite_index,image_index,x+(i*16),y);
		if (global.moderneffects) gpu_set_blendmode(bm_normal);
		if (global.moderneffects) draw_sprite(spr_water_white,image_index,x+(i*16),y);
		
	}
	
}

for (var i = 0; i < image_xscale; i ++) {
	
	for (var j = 0; j < image_yscale-1; j ++) {
		
		if ((tilemap_pos[i,j] == false) || global.moderneffects) {
	
			var skipwater = false;
	
			if (global.moderneffects) {
			
				gpu_set_blendmode_ext(bm_src_alpha,bm_inv_src_color);
			
				if (obj_controller.currenttheme == themetype.desert) {
			
					skipwater = true;
					draw_sprite_ext(spr_water_light_blue,image_index,x+(i*16),y+(j*16)+16,1,1,0,col,0.8);
					
				}
			
			}
		
			if (!skipwater) draw_sprite(spr_water_light_blue,image_index,x+(i*16),y+(j*16)+16);
			if (global.moderneffects) gpu_set_blendmode(bm_normal);
			
		}
		
	}
	
}