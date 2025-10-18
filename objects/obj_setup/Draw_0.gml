draw_sprite_ext(player_spr,player_img,player_x,player_y+1,player_xscale,1,0,-1,1);

draw_set_font(global.font_smb2);
//draw_set_halign(fa_right);

var ktd = "";

for (var i = 0; i < keyselection; i ++) {
	
	ktd += string_upper(key_to_string(key[i]))+"\n";
	
}

for (var i = keyselection; i < 8; i ++) {
	
	ktd += "\n";
	
}

if (keyselection < 8) {

	draw_set_valign(fa_top);
	draw_text_ext(48,32,"KEYBOARD KEY SET-UP",16,-1);
	draw_sprite_ext(spr_hud_arrow,arrow_index,128-48-16-16+1,64+(keyselection*16)+1,-1,1,0,c_black,1);
	draw_sprite_ext(spr_hud_arrow,arrow_index,128-48-16-16,64+(keyselection*16),-1,1,0,-1,1);
	draw_set_halign(fa_left);
	
} else {

	draw_set_valign(fa_top);
	draw_text_ext(32,32,"PRESS ENTER TO CONTINUE\nPRESS ESC. TO START OVER",16,-1);
	draw_set_halign(fa_left);
	
}
	
var ttd = "LEFT		-";
ttd += "\nRIGHT		-";
ttd += "\nUP		-";
ttd += "\nDOWN		-";
ttd += "\nA		-";
ttd += "\nB		-";
ttd += "\nSTART		-";
ttd += "\nSELECT	-";

draw_set_valign(fa_middle);

draw_text_ext(48,128,ttd,16,-1);

draw_set_halign(fa_right);
draw_text_ext(208,128,ktd,16,-1);
draw_set_halign(fa_left);

draw_set_valign(fa_top);