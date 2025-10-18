pal_swap_set(spr_pal_main,obj_controller.currenttheme);

draw_sprite_ext(sprite_index,0,x,y,1,1,image_angle,-1,1);
draw_sprite_ext(sprite_index,1,x,y,1,1,ground_angle,-1,1);

shader_reset();