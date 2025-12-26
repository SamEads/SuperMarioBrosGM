if (!global.moderneffects) {
	
	sprite_index = spr_lava_static;
	depth = 20;
	
} else {

	sprite_index = spr_lava;
	depth = -20;

}

for (var i = 0; i < image_xscale; i ++) {
	
	draw_sprite(sprite_index,image_index,x+(i*16),y);
	
}

for (var i = 0; i < image_xscale; i ++) {
	
	for (var j = 0; j < image_yscale-1; j ++) {
	
		draw_sprite(spr_lava_red,image_index,x+(i*16),y+(j*16)+16);
		
	}
	
}