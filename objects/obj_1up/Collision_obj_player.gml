if (global.frozen)

	exit;

global.p_lives[other.char] ++;
instance_destroy();
add_score(-1,x,y,1,60,false);
var lifesound = (global.moderneffects) ? snd_1up : snd_1up_blip;
audio_play_stop_sound(lifesound,0,0);

if (global.p_maxhealth[other.char] < 4) global.p_maxhealth[other.char] ++;

global.p_health[other.char] = global.p_maxhealth[other.char];