/// @description READ ME FOR USE!

/*

Balance Platform [Left]

All you need to do is place a right balance platform, the anchor will be created itself.

If you place an anchor above THIS PLATFORM, it will change the auto-anchor height to your anchor!

Furthermore, using Creation Code to give the instance position of the buddy ID or anchor will allow
you to have custom balance platform combinations that otherwise would not be possible, as without
specifying it searches for the closest to your right and the closest above you. Experimentation is key!

*/

#region Variables to potentially change

my_buddy = noone;

anchor = noone;

#endregion

#region System variables

// Inherit the parent event
event_inherited();

has_player = false;

falling = false;

#endregion