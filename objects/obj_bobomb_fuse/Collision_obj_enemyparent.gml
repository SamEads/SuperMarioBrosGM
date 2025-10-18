if (hspd != 0 && !dead) {

	if (!other.dead && !global.frozen) {

		hit_combo(1, 1, true, -1);
		with (other) event_user(0);
		other.full_dead = true;
	
	}
	
}