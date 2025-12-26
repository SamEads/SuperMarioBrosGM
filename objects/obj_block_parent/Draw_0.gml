/// @description Draw the block

if (hitsequence == 0)

	depth = depth_start;
	
else

	depth = depth_start-1;

var _scalemod = 0;

if (global.moderneffects)

	_scalemod = (y_disp-y)/36;
	
var _s = sprite_index;

if (global.moderneffects && (sprite_index == spr_block_hit || sprite_index == spr_block_hit_alt))

	_s = spr_block_hit_modern;

draw_sprite_custom_origin(_s,image_index,x,y_disp,sprite_width/2,sprite_height,image_xscale-(_scalemod),image_yscale-(_scalemod),0,-1,1);

if (has_snow && obj_controller.currenttheme == themetype.snow)

	draw_sprite_custom_origin(spr_snowtop,xstart/16,x,y_disp,sprite_width/2,sprite_height,image_xscale-(_scalemod),image_yscale-(_scalemod),0,-1,1);