draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(c_white);

draw_clear(c_black);

var name = string_upper(environment_get_variable("USERNAME"));

if (timer >= 30) draw_text_ext_color(256/2,240/2,"YOUR GAME CONFIGURATION DATA WAS OUTDATED OR CORRUPTED, AND HAS BEEN DELETED.\n\n\nPRESS ENTER KEY OR START BUTTON TO CONTINUE",16,200,c_red,c_red,c_red,c_red,alp);

draw_set_halign(fa_left);
draw_set_valign(fa_top);