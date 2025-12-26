// Inherit the parent event
event_inherited();

physics = true;

hspd = 0;

vspd = 0;

if (global.moderneffects) {

	with (instance_create_depth(x,y,depth-1,obj_lakitu_cloud)) {
	
		destroyed = true;
	
	}
	
}