if (myflag.pointdisp >= 0) {

	draw_set_halign(fa_left);
	draw_set_font(global.pointfont);
	draw_text_custom(x+12,y-16-myflag.flag_y-143,myflag.pointdisp);
	draw_set_font(global.currentfont);
	
} else {
	
	draw_sprite_ext(spr_text_1up,global.smb2_mode,x+12,y-16-myflag.flag_y-143,1,1,0,-1,image_alpha);
	
}