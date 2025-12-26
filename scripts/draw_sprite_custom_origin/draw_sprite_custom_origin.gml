/// @description draw_sprite_custom_origin(sprite,subimg,x,y,rot_x,rot_y);
/// @param sprite
/// @param subimg
/// @param x
/// @param y
/// @param rot_x
/// @param rot_y
/// @param xscale
/// @param yscale
/// @param rot
/// @param col
/// @param alpha
/// @param round_in_retro
function draw_sprite_custom_origin() {
    
	var _x = argument[2];
	var _y = argument[3];
	
	if (argument_count > 15) {
		
		if (argument[15] == true && !global.moderneffects) {
			
			_x = floor(_x);
			_y = floor(_y);
			
		}
		
	}
	
	if (!global.moderneffects) {
		_y = floor(_y);
	}
	
	// no rotation, xscale & yscale are 1
	if ((argument[8] == 0 && argument[6] == 1 && argument[7] == 1)) {
	
		draw_sprite_ext(argument[0],argument[1],_x,_y,argument[6],argument[7],argument[8],argument[9],argument[10]);
	
	} else {
	
		//Build matrix
		var _mat = matrix_build(_x - sprite_get_xoffset(sprite_index) + argument[4], _y - sprite_get_yoffset( sprite_index) + argument[5], 0, 0, 0, argument[8]*argument[6], argument[6], argument[7], 1);

		//Set matrix
		matrix_set(matrix_world, _mat);
			
		//Draw sprite
		draw_sprite_ext(argument[0],argument[1],sprite_get_xoffset(sprite_index) - argument[4],sprite_get_yoffset( sprite_index) - argument[5],1,1,0,argument[9],argument[10]);

		//Set back to normal
		matrix_set(matrix_world, matrix_build_identity());
	
	}

}