#region Copy this region's code into the creation code in-room to set up custom warps!

//Room to be sent to. If kept at -1, it will warp to the same room!
destination = -1;

//The corresponding warp exit to send to (i.e. warp node/pipe exits, default is 0)
destination_id = 0;

#endregion

#region System variables

visible = false;

warper = noone;

warptime = round(audio_sound_length(snd_pipe)*room_speed);
timer = 0;

warp_y = y;

#endregion