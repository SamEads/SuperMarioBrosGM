/// @description Castle Ending NPC

#region Creation Code variables

//Which Toad to display in modern effects
//1-8 are valid options, any other number will play the SMBDX Toad animation
toad = 0;

//Set this to "true" or "false" in the Creation Code to play in either modern or retro mode!
do_toad_animation = global.moderneffects;

if (do_toad_animation == false)

	do_toad_animation = global.smb2_mode;

//Extra timer after points
point_timer = 0;

//Toad timer
toad_timer = 0;

//Is the ending character Peach?
peach = false;

#endregion

#region System Variables

#region Toad

toad_x = 0;
toad2sprite = spr_toad;

bag_sprite = spr_bag;
bag_index = 0;
bag_position = 1;

do_toad_animation = true;//global.moderneffects;
draw_toad = true;

toadindex = 0;
toadjump = 0;

#endregion

#region Peach

peachsprite = spr_peach;
peach_x_extra = 20;
hardtext = global.hardmode;
peachindex = 0;
peach_x = 0;
peach_y = 0;

#endregion

#region Progression Variables

active = false;
cam_hspd = 1.5625;
endtimer = 0;
done = false;
ang = 0;
ready = false;
show_thankyou = false;

#endregion

#region Physics

hspd = 0;
vspd = 0;
grav = 0;

#endregion

#region Controls

scr_buttons_init();
controllable = true;

#endregion

#endregion