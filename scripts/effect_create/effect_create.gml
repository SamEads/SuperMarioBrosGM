/// @description effect_create(sprite, speed, x, y)
/// @param sprite
/// @param  speed
/// @param  x
/// @param  y
function effect_create() {
	
	var effect = instance_create_depth(argument[2],argument[3] + 8, -6, obj_effect);

	with (effect) {

	    x = argument[2];
	    y = argument[3];
	    sprite_index = argument[0];
	    image_speed = argument[1];
    
	}

	return effect;

}