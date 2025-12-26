if (global.frozen) exit;

var _player = collision_rectangle(bbox_left,bbox_bottom-1,bbox_right,bbox_bottom+16,obj_player,0,0);

if (_player) {
	
	if (_player.vspd <= 0)
	&& (!_player.dead)
	&& (_player.x > bbox_left)
	&& (_player.x < bbox_right)
	&& (_player.bbox_top-_player.extra_y < bbox_bottom+abs(_player.vspd))
	&& (_player.bbox_top-_player.extra_y > bbox_bottom-abs(_player.vspd)) {
		
		with (instance_create_depth(x,y,depth,obj_qblock)) {
		
			visible = false;
			has_snow = false;
			myitem = other.myitem;
			hitter = _player.id;
			hitsize = _player.powerup;
			hitsequence = 1;
			hitspr = spr_block_hit_alt;
			solid_start = true;
			
		}
		
		if instance_exists(myitem) {
			
			if (myitem.item == itemtype.id_1up) {
		
				ds_map_replace(global.data,key,1);
				
			}
			
		}
		
		instance_destroy();
		
	}
	
}