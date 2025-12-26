if (instance_exists(obj_early_castle_exit)) {

	create_exit = false;
	
} else {
	
	//mysolid = instance_create_depth(x+112,y,depth,obj_solid);
	//mysolid.visible = true;
	
}

//Prevent the player from jumping over the flagpole
flagsolid = instance_create_depth(x+8,y-sprite_get_height(sprite_index)-room_height,depth,obj_solid);
flagsolid.image_yscale = room_height/16;
flagsolid.image_xscale = 0.5;