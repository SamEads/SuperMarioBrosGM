/// @function player_anim(animname);
/// @param animname
function player_anim() {
	if (char == chara.luigi && powerup != itemtype.id_subcon) {
		playername = "mario";
	}
	else {
		playername = string_lower(player_name(char));
	}
	return asset_get_index("spr_" + playername + argument[0]);
}