if (global.moderneffects) {
	
	if (!dead) sprite_index = spr_lakitu_alt;
	deathsprite = spr_lakitu_dead;
	
} else {

	if (!dead) sprite_index = spr_lakitu;
	deathsprite = sprite_index;
	
}

if (!lakitu_chosen) {
	
	var main = true;
	
	if (instance_in_view(self,view_camera[0],16)) {
		
		with (obj_lakitu) {
			
			if (lakitu_chosen && !other.dead) {
				
				main = false;
				break;
				
			}
			
		}
		
		lakitu_chosen = true;
		
	}
	
	if (main == false)
	
		instance_destroy();
	
}

if (global.frozen) {
	
	event_inherited();
	exit;
	
}

// Inherit the parent event
event_inherited();

if (dead) exit;

if (!leaving) {

	var spinycount = 0;
	
	with (obj_spiny) {
		
		if instance_in_view(self,view_camera[0],8)
		
			spinycount ++;
			
	}

	var player = instance_nearest(x,y,obj_player);

	if (throwtimer > 0) {
	
		throwtimer --;
	
	} else if (throwtimer <= 0) {
		
		if (spinycount < 3) {
		
			if (!leaving) {
			
				with (instance_create_depth(x,y-8,depth-1,obj_spiny)) {
				
					sprite_index = spr_spiny_thrown;
					vspd = -3;
			
					hspd = 0;
			
					if (global.moderneffects) {
				
						if (player) {
							
							// the player's speed, Lakitu's speed, the player's position, and a pseudo-random value
					
							if (player.hspd != 0)
					
								hspd = player.hspd*random_range(0.8,1.2);
						
							else
					
								hspd = other.hspd*random_range(0.8,1.2);
				
						}
				
					}
			
			
					thrown = true;
				
				}
		
			}
			
			throwtimer = 180;
		
			var chance = irandom_range(1,3);
		
			if (chance <= 1)
		
				throwtimer = 90;
			
		}
		
	}

	if (throwtimer > 15) {
	
		image_index = 0;
	
	} else {
	
		image_index = 1;
	
	}
	
}

if (!leaving) {

	if ((x < obj_levelcontrol.camX-128+40) && hspd < 0)
	
		hspd = 1.25;
	
	else if ((x > obj_levelcontrol.camX+128-40) && hspd > 0)

		hspd = -1.25;
	
	if (player) {
	
		if ((x < player.x-52) && (hspd < 1) && abs(player.hspd) < 1)
	
			hspd += 0.025;
	
		else if ((x > obj_player.x+52) && (hspd > -1) && abs(player.hspd) < 1)
	
			hspd -= 0.025;
	
	}
	
} else {
	
	if (hspd >= 1.2) {
		
		hspd = -abs(hspd);
		
	} else if (hspd > -1.2) {
		
		hspd -= 0.025;

	} else 
	
		hspd = -1.2;
	
}
	
if (sign(xscale) == -1)
	
	xscale = 1;
	
else

	xscale = -1;

leaver = instance_nearest(x,y,obj_lakitu_stop);

if (leaver) {
	
	if (x > leaver.x) {
		
		leaving = true;
		image_speed = 0;
		image_index = 0;
		
	}
	
}
	
x += hspd;

if (!leaving) {
	
	if (player) {
	
		if (player.hspd > 1) {
			
			random_factor --;
			
			if (random_factor <= 0) {
			
				random_factor = irandom_range(0,240);
				random_length = irandom_range(2,4)*10;
				random_number = 0;
		
			}
			
			if ((random_factor < random_length) && (random_number == 0))
			
				random_number = choose(-0.5,0.5,1);
				
			if (x < camera_get_view_x(view_camera[0])+192) && (hspd > 0)
		
				x += player.hspd+random_number;
				
			else
			
				x += camera_get_view_x(view_camera[0])-camlast;
			
		}
		
	}
	
}

if (!dead) {

	last_x = x;
	last_y = y;

}