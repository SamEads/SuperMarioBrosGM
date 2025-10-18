if (cooldown > 0 || global.frozen) exit;

hspd = (obj_player.x > x) ? -2 : 2;
xscale = (hspd < 0) ? -sign(xscale) : sign(xscale);

cooldown = 20;

if (vspd <= 0)

	vspd = -2;

audio_play_stop_sound(snd_kick,0,0);