if (!instance_in_view(self,view_camera[0],32)) exit;

if (dead || falling_out || xscale == 1)

	throwing = false;

if (falling_out) {
	
	dying_animation = false;
	grav = 0.2;
	vspd += grav;
	
	if (global.moderneffects)
	
		sprite_index = spr_bowser_hurt;
	
	if (vspd >= 2.5)
	
		vspd = 2.5;
		
	if (instance_place(x,y,obj_lava) && global.moderneffects)
	
		if (vspd >= 1)
		
			vspd = 1;
	
	y += vspd;
	
	if (!instance_in_view(self,view_camera[0],16) && !global.moderneffects)
	|| (!instance_in_view(self,view_camera[0],-20) && global.moderneffects) {
		
		with (obj_axe)
		
			if (hit < 2)
		
				hit = 2;
				
		if (!instance_in_view(self,view_camera[0],16))
		
			instance_destroy();
		
	}
	
}

if (global.frozen) {
	
	if (!dying_animation) {
	
		image_speed = 0;
		
	} else {
		
		if (!dead) {
			
			if (global.moderneffects)
			
				sprite_index = spr_bowser_hurt;
				
			else
			
				sprite_index = spr_bowser;
				
			image_speed = 0.25;
			
		}
		
	}
	
	exit;
	
}

if (!falling_out) event_inherited();

if (dead) {
	
	sprite_index = deathsprite;
	
	image_index = 1;
	
	ang = 0;
	
	vspd_cap = 4;

	if (vspd < 0)
	
		grav = 0.2;
		
	else
	
		grav = 0.2;

}

if (dead || falling_out) exit;

image_speed = 0.0375;

player = instance_nearest(x,y,obj_player);

if (player && hurttimer <= 0) {
	
	if ((x < xstart-80) && (hspd < 0)) {
	
		hspd = abs(hspd);
		random_turnaround = irandom_range(90,360);
	
	}
	
	if ((abs(hspd) <= 0.25 && abs(hspd) != 0) && x < xstart-72 && x > xstart) {
		
		random_turnaround --;
		
		if (random_turnaround <= 0) {
			
			hspd = -hspd;
			random_turnaround = irandom_range(90,270);
			
		}
		
	}
	
	if (x > xstart+48 && abs(hspd) <= 0.25) {
		
		hspd = -abs(hspd);
		random_turnaround = irandom_range(90,360);
		
	}

	if ((player.bbox_left > x+32) && (abs(hspd) != 0 || global.moderneffects) && (abs(hspd) != 0.5)) {
	
		xscale = 1;
		hspd = 0.5;
		
		if (!global.moderneffects)
		
			x -= 16;
	
	} else if ((player.bbox_right < x-16) && (abs(hspd) != 0.25)) {
	
		xscale = -1;
		hspd = -0.25;
	
	}
	
	if (jumptimer > 0 && grounded && abs(hspd) <= 0.25 && abs(hspd) != 0) {
	
		jumptimer --;
	
		if (jumptimer == 0) {
		
			jumptimer = irandom_range(30,70);
			vspd = -2;
		
		}
	
	}
	
	if (shoot_fire) {
	
		if (breathetimer > 0 && xscale == -1 && hurttimer <= 0) {
	
			breathetimer --;
	
			if (breathetimer < 30) {
		
				sprite_index = spr_bowser_breathe;
			
				if (hspd != 0) {
				
					walk_hspd = hspd;
					hspd = 0;
				
				}
		
			} else {
		
				sprite_index = spr_bowser;
		
			}

			if (breathetimer == 0) {

				if (vspd >= 0) {
			
					with instance_create_depth(x+(32*xscale),y-2,depth-1,obj_flame) {
				
						image_xscale = other.xscale;
						flame_sound = true;
						audio_play_stop_sound(snd_flame,0,0);
				
						if (instance_exists(obj_player)) {
				
							if (obj_player.y >= other.y) {
					
								dest_y = y+12;
						
							} else if (obj_player.bbox_top <= other.bbox_top) {
						
								dest_y = y-12;
						
							}
					
						}
				
					}
			
				}

				breathetimer = irandom_range(90,270);
				hspd = walk_hspd;
		
			}
	
		} else {
		
			sprite_index = spr_bowser;
		
		}
	
	}
	
	if (throw_hammers) {
		
		if (player && hurttimer <= 0) {
	
			if (xscale == -1) {
		
				if (throwing) {
		
					if (canthrowtimer > 0) {
		
						if (throwtimer > 0) {
			
							throwtimer --;
				
							if (throwtimer <= 0) {
			
								if (hammersleft > 0) {
			
									hammersleft --;
									throwtimer = 6;
							
									with (instance_create_depth(x+(sign(xscale)*8),y-8,depth-3,obj_hammer)) {
					
										hspd = other.xscale*1;
										vspd = -3;
										xscale = other.xscale;
										grav = 0.125;
					
									}
			
								} else {
						
									hammersleft = irandom_range(1,10);
									throwtimer = irandom_range(15,40);
						
								}
					
							}
			
						}
			
						canthrowtimer --;
		
					} else {
			
						throwing = false;
						canthrowtimer = irandom_range(20,80);
			
					}
			
				} else if (canthrowtimer > 0) {
			
					canthrowtimer --;
			
					if (canthrowtimer <= 0) {
				
						throwing = true;
						canthrowtimer = irandom_range(60,120);
				
					}
			
				}
		
			}
	
		}

	}

} else if (hurttimer > 0) {
	
	hurttimer --;
	
	if (!global.moderneffects)
	
		hurttimer = 0;
		
	else {
	
		sprite_index = spr_bowser_hurt;
		image_speed = 0.25;
		if (abs(hspd) > 0.5) hspd = 0.5*sign(hspd);
		
	}
	
	if (hurttimer <= 0) {
		
		sprite_index = spr_bowser;
		
	}
	
}

if (!grounded) {
		
	if (vspd < 1)
		
		grav = 0.0675;
		
	else
		
		grav = 0.2;
		
	if (vspd >= vspd_cap)
	
		vspd = vspd_cap;
	
}