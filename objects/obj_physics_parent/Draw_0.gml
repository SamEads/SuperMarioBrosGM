pal_swap_set(spr_pal_main,0);

draw_sprite_custom_origin(sprite_index,image_index,x,y+1+extra_y,sprite_width/2,sprite_height/2,xscale,yscale,ang,image_blend,image_alpha,0,0,0,8,round_in_retro);

shader_reset();