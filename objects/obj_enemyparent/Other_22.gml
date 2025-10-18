/// @description Fireball interaction

if (!fireballable)

	exit;

add_score(alternatescore,other.x,other.y);
event_user(0);
audio_play_stop_sound(snd_kick,0,0);

dead = true;

if (other.shooter != noone)

	hspd = ((bbox_left+bbox_right)/2 > other.shooter.x) ? sign(abs(xscale)) : -sign(abs(xscale));