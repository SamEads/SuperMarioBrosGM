if instance_position(bbox_left+2,bbox_top+2,obj_modifier_parent)
	
	myitem = instance_position(bbox_left+2,bbox_top+2,obj_modifier_parent);

if (myitem == noone)
	
	myitem = instance_create_depth(x,y,depth,obj_modifier_coin);