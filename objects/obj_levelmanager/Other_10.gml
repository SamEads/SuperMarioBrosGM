/// @description Initiate BG screen fade

var a = layer_get_all();
var j = 0;
    
//Search through all layers
for (var i = 0; i < array_length_1d(a); i ++) {
	
	if (layer_background_get_id(a[i]) != -1) {
			
		if (layer_background_get_sprite(layer_background_get_id(a[i])) == -1) {
					
			memory[j,0] = a[i];
			memory[j,1] = layer_get_depth(a[i]);
			if (!global.moderneffects) layer_depth(a[i],-200+j);
			j ++;
				
		}
					
	}
				
}
	
if (j == 0)
	
	bg_fade_set = -1;