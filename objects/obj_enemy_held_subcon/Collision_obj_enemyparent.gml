if (other.dead || global.frozen || !thrown) exit;

if (!other.dead) {
	
	if (!hit_object)
	
		hspd *= 0.8;
	
	hit_object = true;
	with (other) event_user(0);
	vspd = -2;
	combo ++;
	hit_combo(combo,combo,true,thrower.char);

}