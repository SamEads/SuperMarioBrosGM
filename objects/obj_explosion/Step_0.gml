var dist = 8;

if (collision_rectangle(bbox_left-dist,bbox_top-dist,bbox_right+dist,bbox_bottom+dist,obj_block_parent,0,1)) {

	//Destroy all blocks in the distance provided
	var _l = ds_list_create();
	var _blocks = collision_rectangle_list(bbox_left-dist,bbox_top-dist,bbox_right+dist,bbox_bottom+dist,obj_block_parent,0,1,_l,false);

	if (_blocks > 0) {
	
		for (var i = 0; i < _blocks; i ++) {
		
			with (ds_list_find_value(_l,i)) {

				break_animation = true;
				instance_destroy();
	
			}
			
		}
	
	}
	
	ds_list_destroy(_l);
	
}

if (collision_rectangle(bbox_left-dist,bbox_top-dist,bbox_right+dist,bbox_bottom+dist,obj_enemy_parent,0,1)) {

	//Kill all enemies in the distance provided
	var _l = ds_list_create();
	var _enemies = collision_rectangle_list(bbox_left-dist,bbox_top-dist,bbox_right+dist,bbox_bottom+dist,obj_enemy_parent,0,1,_l,false);

	if (_enemies > 0) {
	
		for (var i = 0; i < _enemies; i ++) {
		
			with (ds_list_find_value(_l,i)) {

				event_user(0);
				audio_play_stop_sound(snd_kick,0,0);
				add_score(100);
	
			}
			
		}
	
	}
	
	ds_list_destroy(_l);
	
}

if (image_index >= 3 && !global.moderneffects)

	instance_destroy();