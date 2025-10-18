pal_swap_set(spr_pal_main,obj_controller.currenttheme);

draw_self();

if (global.smb2_mode)

	draw_sprite(spr_trampolinebase_alt,0,x,y-8);

shader_reset();