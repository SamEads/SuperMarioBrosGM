/// @description Enemy head count

if (cooldown > 0) exit;

if (other.moving && !other.dead) {

	if (!dead && !global.frozen) {

		other.combo ++;
		hit_combo(other.combo, other.combo, true, other.kicker.char);
		event_user(0);
		full_dead = true;
	
	}
	
}