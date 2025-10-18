/// @description Pause Manager

//Freeze game
global.frozen = true;

//Current menu
menu = 0;

//Current selection
selection = 0;

//Unpausing
pausing = true;
unpausing = false;

//Finished & going to title
finished = false;

max_w = 136;
max_h = 104;
adjusting = false;

ww = 0;
hh = 0;

arrow_index = 0;

unpausetimer = 0;

scr_buttons_init();

enum menustate {
	
	pause,
	options
	
}

changehud = global.hudstyle;

#region Make the pause screen and save some information

pbs = surface_create(surface_get_width(application_surface),surface_get_height(application_surface));

surface_set_target(application_surface);
gpu_set_blendmode(bm_add);
draw_set_colour(c_black);
draw_set_alpha(1);
draw_rectangle(0, 0, surface_get_width(application_surface), surface_get_height(application_surface), false);
surface_reset_target();
gpu_set_blendmode(bm_normal);

surface_copy(pbs, 0, 0, application_surface);
global.pausebgsurface = sprite_create_from_surface(pbs,0,0,surface_get_width(pbs),surface_get_height(pbs),false,0,0,0);
surface_free(pbs);

audio_sound_gain(obj_controller.bgm_sound,0,0);
returntime = audio_sound_get_track_position(obj_controller.bgm_sound);
audio_play_stop_sound(snd_pause,0,0);

instance_deactivate_all(true);
instance_activate_object(obj_controller);
instance_activate_object(obj_active);

#endregion