if (item == -1 && instance_position(bbox_top+4,bbox_left+4,obj_modifier_parent))

	item = instance_position(bbox_top+4,bbox_left+4,obj_modifier_parent).object_index;

	if (instance_in_view(self,view_camera[0],32)) {
	
		if (myblock == noone) {
	
			myblock = instance_create_depth(x,y,depth,obj_qblock_invisible);
	
		if (item != -1)
	
			myblock.myitem = instance_create_depth(other.x,other.y,0,item);
			
	}
	
} else {
	
	if (myblock != noone) {
		
		if (instance_position(xstart+4,ystart+4,obj_blockparent))
		
			with (instance_position(xstart+4,ystart+4,obj_blockparent))
			
				instance_destroy();
	
		if (instance_exists(myblock)) {
	
			with (myblock) {
			
				if (instance_exists(myitem)) {
				
					with (myitem)
				
						instance_destroy();
					
				}
			
				instance_destroy();
			
			}
			
		}
		
		myblock = noone;
		
	}
	
}