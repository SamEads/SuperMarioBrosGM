function level_list() {

	switch (currentgame) {
		
		case (game.smb1):
		
			global.current_title = rm_title_smb1;
			global.currentgame_name = "smb1";

			//World 1
			global.worldlevel[1,1] = rm_1_1_a;
			global.worldlevel[1,2] = rm_1_2_a;
			global.worldlevel[1,3] = rm_1_3;
			global.worldlevel[1,4] = rm_1_4;
	
			//World 2
			global.worldlevel[2,1] = rm_2_1_a;
			global.worldlevel[2,2] = rm_2_2_a;
			global.worldlevel[2,3] = rm_2_3;
			global.worldlevel[2,4] = rm_2_4;
	
			//World 3
			global.worldlevel[3,1] = rm_3_1_a;
			global.worldlevel[3,2] = rm_3_2;
			global.worldlevel[3,3] = rm_3_3;
			global.worldlevel[3,4] = rm_3_4;
	
			//World 4
			global.worldlevel[4,1] = rm_4_1_a;
			global.worldlevel[4,2] = rm_4_2_a;
			global.worldlevel[4,3] = rm_4_3;
			global.worldlevel[4,4] = rm_4_4;
	
			//World 5
			global.worldlevel[5,1] = rm_5_1_a;
			global.worldlevel[5,2] = rm_5_2_a;
			global.worldlevel[5,3] = rm_5_3;
			global.worldlevel[5,4] = rm_5_4;
	
			//World 6
			global.worldlevel[6,1] = rm_6_1;
			global.worldlevel[6,2] = rm_6_2_a;
			global.worldlevel[6,3] = rm_6_3;
			global.worldlevel[6,4] = rm_6_4;
	
			//World 7
			global.worldlevel[7,1] = rm_7_1_a;
			global.worldlevel[7,2] = rm_7_2_a;
			global.worldlevel[7,3] = rm_7_3;
			global.worldlevel[7,4] = rm_7_4;
	
			//World 8
			global.worldlevel[8,1] = rm_8_1_a;
			global.worldlevel[8,2] = rm_8_2_a;
			global.worldlevel[8,3] = rm_8_3;
			global.worldlevel[8,4] = rm_8_4_a;
			
			break;
			
		case (game.smb2):
		
			global.current_title = rm_title_smb2;
			global.currentgame_name = "smb2";
			global.smb2_mode = true;
		
			//World 1
			global.worldlevel[1,1] = smb2_1_1_a;
			global.worldlevel[1,2] = smb2_1_2_a;
			global.worldlevel[1,3] = smb2_1_3;
			global.worldlevel[1,4] = smb2_1_4;
	
			//World 2
			global.worldlevel[2,1] = smb2_2_1_a;
			global.worldlevel[2,2] = smb2_2_2_a;
			global.worldlevel[2,3] = rm_2_3;
			global.worldlevel[2,4] = rm_2_4;
	
			//World 3
			global.worldlevel[3,1] = rm_3_1_a;
			global.worldlevel[3,2] = rm_3_2;
			global.worldlevel[3,3] = rm_3_3;
			global.worldlevel[3,4] = rm_3_4;
	
			//World 4
			global.worldlevel[4,1] = rm_4_1_a;
			global.worldlevel[4,2] = rm_4_2_a;
			global.worldlevel[4,3] = rm_4_3;
			global.worldlevel[4,4] = rm_4_4;
	
			//World 5
			global.worldlevel[5,1] = rm_5_1_a;
			global.worldlevel[5,2] = rm_5_2_a;
			global.worldlevel[5,3] = rm_5_3;
			global.worldlevel[5,4] = rm_5_4;
	
			//World 6
			global.worldlevel[6,1] = rm_6_1;
			global.worldlevel[6,2] = rm_6_2_a;
			global.worldlevel[6,3] = rm_6_3;
			global.worldlevel[6,4] = rm_6_4;
	
			//World 7
			global.worldlevel[7,1] = rm_7_1_a;
			global.worldlevel[7,2] = rm_7_2_a;
			global.worldlevel[7,3] = rm_7_3;
			global.worldlevel[7,4] = rm_7_4;
	
			//World 8
			global.worldlevel[8,1] = rm_8_1_a;
			global.worldlevel[8,2] = rm_8_2_a;
			global.worldlevel[8,3] = rm_8_3;
			global.worldlevel[8,4] = rm_8_4_a;
			
			break;
	
	}
	
	//World -1
	global.worldlevel[0,1] = rm_minus_1;

}