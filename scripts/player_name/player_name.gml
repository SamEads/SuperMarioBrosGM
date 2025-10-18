function player_name() {

	switch (argument[0]) {
		
		case (chara.mario): return "Mario"; break;
		case (chara.luigi): return "Luigi"; break;
		case (chara.toad): return "Toad"; break;
		case (chara.toadette): return "Toadette"; break;
		case (chara.custom): return custom_name; break;
		
	}

}