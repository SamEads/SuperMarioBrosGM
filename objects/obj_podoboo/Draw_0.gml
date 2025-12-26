if (vspd >= 0)

	yscale = -1;
	
else

	yscale = 1;

draw_sprite_custom_origin(sprite_index,image_index,x,y,sprite_width/2,sprite_height/2,1,yscale,0,-1,1);