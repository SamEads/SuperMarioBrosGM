draw_self();

draw_sprite(spr_flagpole_tip,image_index,x+8,y-144);

if (obj_controller.currenttheme != themetype.castle)

	pal_swap_set(spr_pal_main,obj_controller.currenttheme);
	
else

	pal_swap_set(spr_pal_main,themetype.cave);
	
draw_sprite(spr_flag,image_index,x+8,y+flag_y);

shader_reset();