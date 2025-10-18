/// @description Set up camera

var mywidth = global._gw;
var mywidth = global._gh;

if (!global.widescreen) {
	
	global._gw = 256;
	global._gh = 240;

} else {
	
	global._gw = 384;
	global._gh = 216;
	
}

var view_w = global._gw;
var view_h = global._gh;

var window_w = (view_h*global.scale);
var _rescale = (global.moderneffects) ? round(window_w/view_w) : 1;

camera_set_view_size(view_camera[0],view_w,view_h);

if (!surface_exists(application_surface) || !window_has_focus() || (_rescale < 1)) {
	
	if (!window_has_focus())
	
		draw_black = true;
	
	alarm[2] = 2;
	
	if (!window_has_focus())
	
		alarm[2] = 8;
	
	exit;
	
}

if (window_has_focus())

	draw_black = false;

if (surface_exists(hudsurf)) {

	hw = surface_get_width(hudsurf);
	
} else if (draw_hud) {
	
	alarm[2] = 2;
	
}

view_enabled = true;

view_visible[0] = true;

camera_set_view_size(view_camera[0],view_w,view_h);

surface_resize(application_surface,view_w*_rescale,view_h*_rescale);

camera_set_view_border(view_camera[0],camera_get_view_width(view_camera[0])/2,camera_get_view_height(view_camera[0])/2);

//Set window size
alarm[0] = 2;
window_set_size(view_w*global.scale,view_h*global.scale);

alarm[5] = 2;