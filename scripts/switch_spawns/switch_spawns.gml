function switch_spawns(o_id) {

	if (o_id.spawner_parent != noone) {
		
		spawner_parent = o_id.spawner_parent;
		o_id.spawner_parent = noone;
		spawner_parent.my_enemy = id;
			
	}

}