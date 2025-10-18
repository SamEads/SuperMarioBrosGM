if (!global.moderneffects) exit;

var player = instance_place(x,y+8,obj_player);

if (player) {
	
	with (player) {
		
		if (!dead)
		
			event_user(2);
			
	}
	
}