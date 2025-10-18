if (inactive) exit;

if (primed)
&& (my_enemy == noone)
&& ((instance_in_view(self,view_camera[0],16+32) || lined)) {
	
	my_enemy = instance_create_depth(x,y,depth,enemy_id);
	
	despawn_enemy = true;
	
	with (my_enemy) {
		
		been_in_view = false;
		
		spawner_parent = other.id;
		
		if (other.color != -1)
		
			color = other.color;
			
		if (other.palette != -1)
		
			palette = other.palette;
			
	}
	
	apply_line();
	
	primed = false;
	lined = false;
	
}

if (!instance_in_view(self,view_camera[0],26+32))
&& (!primed)
&& (my_enemy == noone) {
	
	primed = true;
	
}

if (despawn_enemy) {

	with (my_enemy) {
		
		if (instance_in_view(self,view_camera[0],-8))
		
			been_in_view = true;
	
		if (!instance_in_view(self,view_camera[0],128) && been_in_view) {
			
			oob = true;
			instance_destroy();
			
		}
	
	}
	
}