// Inherit the parent event
event_inherited();

if (global.frozen || dead) exit;

touchingenemy = collision_rectangle(bbox_left-2,bbox_top,bbox_right+2,bbox_bottom,obj_shell, 0, 1);

if (touchingenemy) {
	
	if (!touchingenemy.dead && ((sign(xscale) == -sign(touchingenemy.hspd)) || touchingenemy.hspd = 0)) {
	
		if (cooldown == 0 && kicktimer == 0) {
	
			hspd = touchingenemy.hspd;
			enemyturn = false;
			image_speed = 0;
			image_index = 0;
			kicktimer = 35;
			//cooldown = 8;
			auto_xscale = false;
			edgeflip = false;
			currenttouchingenemy = touchingenemy.id;
		
		} else if (hspd != 0) {
		
			hspd += -sign(hspd)*0.125;
			touchingenemy.hspd = hspd;
			touchingenemy.x = x+(xscale*12);
			if (touchingenemy.grounded && touchingenemy.y >= y && (abs(hspd/4) > 0.1))
		
				touchingenemy.vspd = -abs(hspd)/4;
		
			if (hspd*-sign(xscale) < -1) {
		
				hspd = 0;
				touchingenemy.hspd = 0;
				touchingenemy.moving = false;
			
			}
		
		}
	
	}
	
} else if (currenttouchingenemy != noone) {
	
	if (kicktimer != 0) {
	
		kicktimer = 1;
		hspd = 0;
		
	}
	
	if (instance_exists(currenttouchingenemy)) {
		
		if (abs(hspd) < 0.125)
		
			moving = false;
		
	}
	
}

if (kicktimer > 0) {

	if (hspd == 0) {
	
		image_index = 0;
		kicktimer --;
	
		if (kicktimer == 15) {
			
			if (instance_place(x+(xscale*8),y-2,obj_shell)) {
				
				if (!other.dead) {
		
					cooldown = 8;
					sprite_index = spr_koopa_blue_kick;
					audio_play_stop_sound(snd_kick,0,0);
					currenttouchingenemy = noone;
		
					with instance_place(x+(xscale*8),y-2,obj_shell) {
			
						kicker = instance_nearest(x,y,obj_player);
						moving = true;
			
						if (sign(other.xscale) == 1)
			
							hspd = 3;
				
						else
			
							hspd = -3;
				
					}
				
				}
				
			} else {
				
				kicktimer = 0;
				
			}
		
		}
	
		if (kicktimer == 0) {
	
			hspd = sign(xscale)*0.675;
			sprite_index = spr_koopa_blue;
			image_speed = 0.125;
			auto_xscale = true;
			enemyturn = true;
			edgeflip = true;
			
		}
	
	}
	
}

if (kicktimer <= 0)

	enemyturn = true;