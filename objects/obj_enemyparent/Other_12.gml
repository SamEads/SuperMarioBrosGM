/// @description Flip at edges

if (!collision_rectangle(bbox_right-3, bbox_bottom-1, bbox_right-3, bbox_bottom+12, obj_semisolid, 0, 0))
&& (!collision_rectangle(bbox_right-3, bbox_bottom-4, bbox_right-3, bbox_bottom+20, obj_slopeparent, 1, 0)) {
        
    if hspd > 0 {
        
        hspd = -(abs(hspd));
		x -= 2;
            
    }
        
}
    
if (!collision_rectangle(bbox_left+3, bbox_bottom-1, bbox_left+3, bbox_bottom+12, obj_semisolid, 0, 0))
&& (!collision_rectangle(bbox_left+3, bbox_bottom-4, bbox_left+3, bbox_bottom+20, obj_slopeparent, 1, 0)) {
			
    if hspd < 0 {
        
        hspd = (abs(hspd));
		x += 2;
            
    }
        
}