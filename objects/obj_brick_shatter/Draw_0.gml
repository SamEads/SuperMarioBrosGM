if (instance_exists(obj_levelcontrol))

	pal_swap_set(spr_pal_main,obj_controller.currenttheme);

draw_sprite_ext(sprite_index,image_index,x,y,1,1,image_angle,-1,1);

shader_reset();