//Left
if (collision_rectangle(x,y-7,x-16,y+7,obj_semisolid,0,0))

	ground_angle = 270;
	

//Right
if (collision_rectangle(x,y-7,x+16,y+7,obj_semisolid,0,0))

	ground_angle = 90;
	

//Top
if (collision_line(x,y,x,y-20,obj_semisolid,0,0))

	ground_angle = 180;
	
//Under
if (collision_line(x,y,x,y+10,obj_semisolid,0,0))

	ground_angle = 0;
	
instance_create_depth(x-8,y-8,depth,obj_solid);