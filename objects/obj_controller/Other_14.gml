/// @description Game Over

gameover_timer = round(room_speed*audio_sound_length(bgm_gameover)+50);
audio_play_stop_sound(bgm_gameover,0,0);
global.midwaypoint = -1;
global.midwaypoint_x = -1;
global.gameover = true;
var tempP = global.points;
var tempC = global.coins;
global.points = 0;
global.coins = 0;
save_game_file(global.current_file,global.currentgame_name);
global.points = tempP;
global.coins = tempC;
timeup = false;