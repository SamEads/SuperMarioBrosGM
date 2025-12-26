if (global.moderneffects)

	depth = 201;
	
else

	depth = 149;

if (!wave_setup) {
	
	mywave = instance_create_depth(x,y,-20,obj_waterlevel_above);
	mywave.sprite_index = sprite_index;
	mywave.blue_index = blue_index;
	mywave.dark = dark;
	mywave.image_xscale = image_xscale;
	mywave.image_yscale = image_yscale;
	mywave.image_speed = 0;
	wave_setup = true;
	
}
	
if (wave_setup) {
	
	if (dark) {
		
		mywave.sprite_index = spr_water_dark;
		mywave.blue_index = spr_water_blue_dark;
		
	}
	
	mywave.image_index = image_index;
	mywave.image_speed = 0;
	if (global.moderneffects) mywave.visible = true; else mywave.visible = false;
	
}