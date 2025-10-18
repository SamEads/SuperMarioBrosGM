/// @function player_anim(animname);
/// @param animname
function player_anim() {
	
	if (char == chara.custom) {

		switch ("spr_"+"custom"+argument[0]) {
			
			//Big
			case ("spr_custom_big_climb"): return spr_custom_big_climb;
			case ("spr_custom_big_crouch"): return spr_custom_big_crouch;
			case ("spr_custom_big_idle"): return spr_custom_big_idle;
			case ("spr_custom_big_jump"): return spr_custom_big_jump;
			case ("spr_custom_big_skid"): return spr_custom_big_skid;
			case ("spr_custom_big_swim"): return spr_custom_big_swim;
			case ("spr_custom_big_walk"): return spr_custom_big_walk;
			
			//Small
			case ("spr_custom_small_climb"): return spr_custom_small_climb;
			case ("spr_custom_small_crouch"): return spr_custom_small_crouch;
			case ("spr_custom_small_idle"): return spr_custom_small_idle;
			case ("spr_custom_small_skid"): return spr_custom_small_skid;
			case ("spr_custom_small_swim"): return spr_custom_small_swim;
			case ("spr_custom_small_walk"): return spr_custom_small_walk;
			case ("spr_custom_small_jump"): return spr_custom_small_jump;
			
			//Dead
			case ("spr_custom_dead"): return spr_custom_dead;
			case ("spr_custom_shoot"): return spr_custom_shoot;
			case ("spr_custom_transform"): return spr_custom_transform;
			
			//Level start
			case ("spr_custom_head"): return spr_custom_head;
			
			//Palette
			case ("spr_pal_custom"): return spr_pal_custom;
			case ("spr_pal_custom_alt"): return spr_pal_custom_alt;
			
		}
		
	} else {
		
		if (char == chara.luigi && powerup != itemtype.id_subcon)
	
			playername = "mario";
			
		else
		
			playername = string_lower(player_name(char));

		var asset = asset_get_index("spr_"+playername+argument[0]);

		return asset;
		
	}

}