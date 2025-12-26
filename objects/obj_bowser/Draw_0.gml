if (!dead
|| deathsprite == spr_shell
|| deathsprite == spr_lakitu
|| deathsprite == spr_hammerbro
|| deathsprite == spr_bowser
|| deathsprite == spr_bowser_breathe)

	draw_sprite_custom_origin(sprite_index,image_index,x,y+2,sprite_width/2,sprite_height/2,xscale,yscale,ang,image_blend,image_alpha,true);
	
else

	event_inherited();
	
if (!dead && !falling_out && throwing) {
	
	pal_swap_set(spr_pal_main,obj_controller.currenttheme);
	
	draw_sprite_ext(spr_hammer,0,x+(sign(xscale)*8),y-8,xscale,1,0,-1,1);
	
	shader_reset();
	
}