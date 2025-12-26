y -= 1;

timer ++;

y_wave = sin(timer*0.25);

if (!collision_line(x,bbox_top,y,bbox_top,obj_liquid,false,false))

	instance_destroy();