var show_angle = ang;

if (!global.moderneffects) {
	
	show_angle = round(ang/90)*90;
	
}

pal_swap_set(spr_pal_main,obj_controller.currenttheme);

draw_sprite_custom_origin(spr_hammer,0,x,y,sprite_width/2,sprite_height/2,xscale,yscale,show_angle,-1,1);

shader_reset();