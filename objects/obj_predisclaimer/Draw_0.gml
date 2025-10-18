/// @description Draw Pre-Disclaimer

draw_set_font(global.font);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var str = "THIS IS A NON-PROFIT PROJECT MADE WITH LOVE FROM A NINTENDO FAN. BY NO MEANS IS IT SUPPOSED TO BE A REPLACEMENT OR AN ATTEMPTED IMPROVEMENT OVER THE ORIGINAL, ONLY SOMETHING I HAVE DONE FOR FUN. I HOPE YOU ENJOY.\n\n-HELLOSAMMU";

draw_text_ext(camera_get_view_width(view_camera[0])/2,camera_get_view_height(view_camera[0])/2,str,16,camera_get_view_width(view_camera[0])-32);