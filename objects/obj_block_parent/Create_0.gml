/// @description Block parent

//Inherit parent event
event_inherited();

//Does the block have the brick break animation? Will enable for explosions
break_animation = false;

//Set depth to be slightly below everything
depth = 20;

//Block palette
pal = spr_pal_font;

#region System variables

//Who hit the block? Used for references in which direction for enemies/etc to go when hit
hitter = noone;

hitsize = itemtype.id_big;

//Manages whether or not the block can give an item
giveitem = false;

//Can be hit currently
can_hit = true;

//What sequence of hitting is the block currently on
hitsequence = 0;

//Modifier block ID
myitem = -1;

//Offset Y for hit animation
y_disp = y;

//Vertical speed during animation
vspd = 0;

//Has snow
has_snow = true;

//Starting depth
depth_start = depth;

#endregion