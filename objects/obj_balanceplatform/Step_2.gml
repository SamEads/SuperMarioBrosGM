if (right != noone) {
	
	if (instance_exists(right)) {
		
		if (!right.falling)
		
			right_y = right.bbox_top;
			
		else
		
			right_broken = true;
		
	}
	
}

if (left != noone) {
	
	if (instance_exists(left)) {
		
		if (!left.falling)
		
			left_y = left.bbox_top;
			
		else
		
			left_broken = true;
		
	}
	
}