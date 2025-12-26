if (myvine == noone) exit;

if (captor == noone) exit;

if (myvine.vspd == 0) {
	
	if (captor.bbox_top > myvine.bbox_bottom+8) {
	
		captor.vspd = -1;
		captor.y --;
		captor.leavetimer = 10;
		
	} else {
	
		captor.vspd = 0;
		
		if (captor.leavetimer <= 0) {
			
			if (captor.xscale == 1) {
			
				captor.xscale = -1;
				captor.leavetimer = 10;
				captor.x = round((captor.vine.bbox_left+captor.vine.bbox_right)/2) + 7;
				
			} else {
				
				captor.controllable = true;
				captor.warping = false;
				captor.climbing = false;
				captor.vine = noone;
				captor.depth = -5;
				captor.hspd = 0;
				captor.x += 4;
				captor.xscale = 1;
				captor.vinecooldown = 4;
				captor = noone;
				exit;
				
			}
			
		} else {
			
			captor.leavetimer --;
			
		}
		
	}
	
}