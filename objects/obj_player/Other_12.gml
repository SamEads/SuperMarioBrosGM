/// @description Kill the player

if (dead) exit;

audio_stop_all();

//Start the death sequence
dead = true;

//Freeze the game
global.frozen = true;

//Dissipate physics
vspd = 0;
grav = 0;
hspd = 0;

//Subtract from the player lives
global.p_lives[char] --;
global.p_health[char] = 0;

//Stop the music for the remainder of the room
obj_controller.stopmusic = true;

//Set the power-up for respawning
powerup = itemtype.id_small;

//Play the death tune
audio_play_stop_sound(bgm_death,0,0);