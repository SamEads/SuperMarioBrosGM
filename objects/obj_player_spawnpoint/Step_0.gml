if (!active) {
	instance_destroy();
	exit;
}

if (starttimer > 0 && !global.frozen) {
	starttimer --;
	
	if (starttimer == 0) {
		if (instance_exists(deposit)) {
			deposit.controllable = true;
		}
	}
} else if (!global.frozen) {
	instance_destroy();
}