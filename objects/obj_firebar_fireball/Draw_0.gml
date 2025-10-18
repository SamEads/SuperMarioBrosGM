var show_angle = ang;
var img = 0;

if (!global.moderneffects) {
	
	show_angle = 0;
	img = image_index;
	
}

draw_sprite_custom_origin(sprite_index,img,x,y,sprite_width/2,sprite_height/2,1,1,show_angle,-1,1);