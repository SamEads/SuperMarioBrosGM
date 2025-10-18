if (global.frozen || other.dead) exit;

//Hurt the player
with (other)

	event_user(1);

instance_destroy();