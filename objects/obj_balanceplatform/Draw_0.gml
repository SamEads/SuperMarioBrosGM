pal_swap_set(spr_pal_main,obj_controller.currenttheme);

draw_sprite(spr_balanceplatform,0,left_anchor-8,top);

var _t = abs(right_anchor+8-left_anchor-8);

for (var i = 0; i < _t-16; i += 16) {
	
	if (i < _t-32)
	
		draw_sprite(spr_balanceplatform,1,left_anchor+8+i,top);
	
	else
	
		draw_sprite_part(spr_balanceplatform,1,0,0,(_t-i-16),16,left_anchor+8+i,top);
	
}

var _l = abs((top+8)-left_y);

for (var i = 0; i < _l+16; i += 16) {
	
	if (i < _l-16)
	
		draw_sprite(spr_balanceplatform,2,left_anchor-8,top+16+i);
	
	if (!left_broken)
		
		draw_sprite_part(spr_balanceplatform,2,0,0,16,(_l-i),left_anchor-8,top+10+i);
	
}

var _r = abs((top+8)-right_y);

for (var i = 0; i < _r+16; i += 16) {
	
	if (i < _r-16)
	
		draw_sprite(spr_balanceplatform,2,right_anchor-8,top+16+i);
	
	if (!right_broken)
	
		draw_sprite_part(spr_balanceplatform,2,0,0,16,(_r-i),right_anchor-8,top+10+i);
	
}

draw_sprite_ext(spr_balanceplatform,0,right_anchor+8,top,-1,1,0,-1,1);

shader_reset();