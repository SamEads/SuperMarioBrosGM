if (ds_map_find_value(async_load,"id") == unzip) {
	
	var status = ds_map_find_value(async_load, "status");
	
	if (status == 0) {
	
		zip_unzip("tmp/icons.zip","Icons/");
		directory_destroy("tmp");
		
	}
	
}