/// @description Draw Presentation

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

draw_set_font(global.currentfont);

if (timer >= 30) {

	draw_text_custom(camera_get_view_width(view_camera[0])/2,camera_get_view_height(view_camera[0])/2,present_text);
	
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);