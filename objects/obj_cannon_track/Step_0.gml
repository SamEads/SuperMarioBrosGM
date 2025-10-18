// Inherit the parent event
event_inherited();

var player = instance_nearest(x,y,obj_player);
	
if (player && cannontimer > 15 && cannontimer < 170) {
	
	var pd = point_direction(x,y,player.x,player.y);
	var dd = angle_difference(image_angle+90, pd);
	image_angle -= min(abs(dd), 2.5) * sign(dd);

}

if (image_angle <= ground_angle-90)
	
	image_angle = ground_angle-90;

if (image_angle >= ground_angle+90)

	image_angle = ground_angle+90;