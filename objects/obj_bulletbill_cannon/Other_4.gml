if (global.hardmode > 1) {
	
	instance_destroy();
	
	with instance_create_depth(x,y,depth,obj_bulletbill_cannon_homing) {
		
		billsprite = spr_bulletbill;
		
	}
	
}