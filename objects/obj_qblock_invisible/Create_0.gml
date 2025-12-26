myitem = noone;
alarm[0] = 1;

key = string(bbox_left)+string(bbox_top)+room_get_name(room)+object_get_name(object_index);

if (ds_map_find_value(global.data, key) == 1) {
	
	instance_destroy();
	
	with collision_point((bbox_left+bbox_right)/2,(bbox_top+bbox_bottom)/2,obj_modifier_parent,0,0)
	
		instance_destroy();
	
}