//Search through all layers
var a = layer_get_all();
var j = 0;

for (var i = 0; i < array_length(a); i ++) {
	
	//If the layer is a tile, index it and move up in the shadow layer array
	if (layer_tilemap_get_id(a[i]) != -1) {
		
		var skip = false;
		
		for (var k = 0; k < array_length(obj_levelmanager.modern_layer); k ++) {
			
			if (layer_get_name(a[i]) == layer_get_name(obj_levelmanager.modern_layer[k])) {
			
				skip = true;
				
			}
			
		}
		
		if (!skip) {
		
			waterlayer[j] = layer_tilemap_get_id(a[i]);
			j ++;
			
		}
		
	}
   
}

if (j == 0)

	exit;

for (var i = 0; i < image_xscale; i ++) {
		
	for (var j = 0; j < image_yscale; j ++) {
					
		tilemap_pos[i][j] = false;
				
	}
			
}

for (var l = 0; l < array_length(waterlayer); l ++) {
	
	for (var i = 0; i < image_xscale; i ++) {
		
		for (var j = 0; j < image_yscale; j ++) {
		
			if (tilemap_get_at_pixel(waterlayer[l],x+(i*16),y+(j*16))) {
					
				tilemap_pos[i][j] = true;
					
			}
				
		}
			
	}
	
}