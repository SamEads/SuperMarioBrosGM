/// @description Returns whether or not the instance is in the given view
/// @param instance
/// @param view
/// @param padding

function instance_in_view() {

	var inst = argument[0];
	
	var cam = argument[1];
	
	var pad = argument[2];

	return point_in_rectangle(inst.x,inst.y,
	camera_get_view_x(cam)-pad,
	camera_get_view_y(cam)-pad-64,
	camera_get_view_x(cam)+camera_get_view_width(cam)+pad,
	camera_get_view_y(cam)+camera_get_view_height(cam)+pad);

}