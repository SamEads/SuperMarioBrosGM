var _theme = obj_controller.currenttheme;

pal_swap_set(spr_pal_main,_theme);

draw_sprite_custom_origin(sprite_index,image_index,floor(x),y,sprite_width/2,sprite_height/2,xscale,yscale,ang,image_blend,image_alpha,0,0,0,8,sprite_height);

shader_reset();