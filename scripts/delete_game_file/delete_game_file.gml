/// @description delete_game_file(file);
/// @param file

function delete_game_file(argument0,argument1) {

	// Choose a file depending on the argument supplied
	if (argument0 == 1) {
		
	    file = global.datafolder+argument1+"_save1.sam";
		
	} else if (argument0 == 2) {
		
	    file = global.datafolder+argument1+"_save2.sam";
		
	} else if (argument0 == 3) {
		
	    file =  global.datafolder+argument1+"_save3.sam";
		
	}

	if file_exists(file) {
	
		file_delete(file);
		return true;
		
	} else {
		
		return false;
		
	}

}