timer ++;

x = xmiddle + (sin(timer*(xspd/5)) * 2);

xmiddle -= xspd;

y += yspd;

if (!global.moderneffects)
|| (y-9 >= room_height)
|| (x+9 < camera_get_view_x(view_camera[0]))

	instance_destroy();
	
if (depth <= 0 && !global.performance && image_index == 3 && global.scale > 1) {
	
	if (collision_point(x,bbox_bottom-2,obj_semisolid,0,0)) {
		
		if (collision_point(x,bbox_bottom-2,obj_semisolid,0,0).visible) {
	
			instance_destroy();
	
			with effect_create(spr_smoke,0.125,x-1,bbox_bottom-8) {
		
				image_alpha = other.image_alpha;
		
			}
			
		}
	
	}
	
}