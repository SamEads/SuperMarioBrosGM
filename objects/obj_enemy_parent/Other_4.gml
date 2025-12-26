if (!global.hardmode) {

	if (instance_place(x,y,obj_hardmode_only)) {

		instance_destroy();
		exit;
		
	}
	
}

if (always_active) exit;

with (instance_create_depth(x,y,depth,obj_enemyspawner)) {
	
	if (!global.hardmode || other.alt_object == -1)
	
		enemy_id = other.object_index;
		
	else
	
		enemy_id = other.alt_object;

	sprite_index = other.sprite_index;
	
}

instance_destroy();