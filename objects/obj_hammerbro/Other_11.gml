/// @description Set stomp to death
event_user(0);

audio_play_stop_sound(snd_stomp,0,0);

if (global.moderneffects) other.combo ++;

hit_combo(6,other.combo,false,other.char);