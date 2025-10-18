/// @description Turn into a shell when flipped at a block

event_inherited();

with instance_create_depth(x,y,depth,obj_shell) {
	
	extra_points = true;
	color = other.color;
	inhabited = true;
	grounded = false;
	vspd = -2.5;
	
	var player = instance_nearest(x,y,obj_player);

	if (player)

		hspd = (x > player.x) ? 0.75 : -0.75;
	
	yscale = -1;
	image_index = 1;
	image_speed = 0.5;
	return_instance = other.object_index;
	
	switch_spawns(other.id);
	
	switch (color) {
		
		case (0): sprite_index = spr_shell; break;
		case (1): sprite_index = spr_shell_red; swap_palette = false; break;
		case (2): sprite_index = spr_shell_blue; swap_palette = false; break;
		
	}
	
}

instance_destroy();