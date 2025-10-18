function physics_collision(ignorecorners,autograv) {

	var extra_top = 0;

	if (argument_count > 2)
	
		extra_top = -argument[2];

	bouncing = false;
	wallframe = false;
	
	var _left = bbox_left;
	var _right = bbox_right;
	
	if (ignorecorners) {
		
		_left = x;
		_right = x;
		
	}
	
	//Right
	if (hspd > 0) {
		
		_left = bbox_left;
		_right = bbox_right;
	
		if (ignorecorners) {
		
			_left = x;
			_right = x;
		
		}

		if (collision_rectangle(bbox_right-abs(hspd),bbox_top+1+abs(vspd)+extra_top,bbox_right+1,bbox_bottom-1-abs(vspd),obj_solid,1,0)) {

			if (wall_flip)
			
				hspd = -abs(hspd);
				
			else

				hspd = 0;

			while collision_rectangle(bbox_right,bbox_top+1+abs(vspd)+extra_top,bbox_right,bbox_bottom-1-abs(vspd),obj_solid,1,0)
			&& !collision_point(x,bbox_top+2,obj_solid,0,0) {
		
			    x --;
		
			}
		
		}

	}

	//Left
	else if (hspd < 0) {
		
		_left = bbox_left;
		_right = bbox_right;
	
		if (ignorecorners) {
		
			_left = x;
			_right = x;
		
		}
	
		if collision_rectangle(bbox_left-1,bbox_top+1+abs(vspd)+extra_top,bbox_left,bbox_bottom-1-abs(vspd),obj_solid,1,0) {

			if (wall_flip)
			
				hspd = abs(hspd);
				
			else

				hspd = 0;

			while (collision_rectangle(bbox_left,bbox_top+1+abs(vspd)+extra_top,bbox_left,bbox_bottom-1-abs(vspd),obj_solid,1,0))
			&& (!collision_point(x,bbox_top+2+extra_top,obj_solid,0,0)) {
		
				x ++;
		
			}
		
		}

	}
	
	_left = bbox_left;
	_right = bbox_right;
	
	if (ignorecorners) {
		
		_left = x;
		_right = x;
		
	}
	
	var semisolid = collision_rectangle(_left,bbox_bottom+1,_right,bbox_bottom+1+abs(vspd),obj_semisolid,true,false);

	if (vspd >= 0) {
		
		if (semisolid) {
			
			if (bbox_bottom < semisolid.bbox_top+5) {
			
				y = (semisolid.bbox_top-(sprite_height-sprite_get_yoffset(sprite_index)));
				
				if (!bouncy) {
		
					vspd = 0;
					grounded = 1;
				
				} else {
				
					grav = 0;
					grounded = true;
					bouncing = true;
				
					vspd = -abs(vspd/2);
				
					if (abs(vspd) < 0.125)
				
						vspd = 0;
				
				}
				
			}
			
		}
		
	}
	
	//Up
	var upsolid = collision_rectangle(_left+abs(hspd),bbox_top+extra_top,_right-abs(hspd),bbox_top+abs(vspd),obj_solid,1,0);

	if (vspd < 0)
	&& (upsolid) {
		
		var canbump = true;
		
		if (x+1 < upsolid.bbox_left
		|| x-1 > upsolid.bbox_right) {
			
			if (x < upsolid.bbox_left)
			
				if (!instance_position(upsolid.bbox_left-1,upsolid.bbox_top+1,obj_solid))
			
					canbump = false;
					
			if (x > upsolid.bbox_right)
			
				if (!instance_position(upsolid.bbox_right+1,upsolid.bbox_top+1,obj_solid))
			
					canbump = false;
			
		}
		
		if (canbump) {
			
			var nudge_out = true;
		
			if (object_index == obj_player) {
		
				audio_stop_sound(snd_jump);
				audio_play_stop_sound(snd_bump,0,0);
				
				if (!swimming) {
		
					var blockparent = collision_rectangle(_left,bbox_top+extra_top,_right,bbox_top+extra_top+abs(vspd),obj_blockparent,1,0);

					if (blockparent) {
				
						blockparent.hitsize = powerup;
						blockparent.hitter = id;
				
						if (blockparent.can_hit && blockparent.hitsequence == 0) {
				
							blockparent.hitsequence = 1;
					
						}
				
					}
					
				}

			}
			
			jumprelease = true;
			
			if (nudge_out) {
	
				y = round(y);

				while (collision_rectangle(_left+abs(hspd),bbox_top-1+extra_top,_right-abs(hspd),bbox_top-1+extra_top,obj_solid,1,0))
				&& !collision_rectangle(_left,bbox_bottom+1,_right,bbox_bottom+1,obj_semisolid,0,0) {
	
				    y ++;
		
				}
	
				vspd = 0;
				
			}
		
		} else {
			
			if (x < upsolid.bbox_left) {
				
				x --;
				
			} else if (x > upsolid.bbox_right) {
				
				x ++;
				
			}
			
		}

	}

	if (vspd >= 0) {
		
		if (hspd != 0) {
			
			if (collision_rectangle(x,bbox_bottom+1,x,bbox_bottom+vspd_cap,obj_slopeparent,1,0))
			
				y += vspd_cap;
			
		}
	
		if (collision_rectangle(x,bbox_bottom,x,bbox_bottom-abs(vspd)-vspd_cap,obj_slopeparent,1,0)) {
		
			y = round(y);
		
			while (collision_rectangle(x,bbox_bottom,x,bbox_bottom-abs(vspd)-vspd_cap,obj_slopeparent,1,0)) {
			
				y --;
			
			}
		
			vspd = 0;
			grav = 0;
			grounded = true;
		
		}
		
	}
	
	if (!semisolid)
	&& (!collision_line(x,bbox_bottom+1,x,bbox_bottom+vspd_cap,obj_slopeparent,1,0)) {
		
		if (grounded > 0)
		
			grounded --;
	
	}
	
	if (autograv && !grounded) {
		
		if (!instance_place(x,y,obj_liquid)) {
		
			if (vspd < 1)
		
				grav = 0.125;
		
			else
		
				grav = 0.2;
			
		} else {
			
			grav = 0.125;
			
		}
	
	}
	
	var do_values = true;
		
	if (argument_count > 3) {
	
		if (argument[3] == false)
		
			do_values = false;
	
	}
	
	if (do_values) {
	
		if (!grounded)

			vspd += grav;
			
		if (autograv)
		
			if (vspd >= vspd_cap)
		
				vspd = vspd_cap;
			
		x += hspd;
		y += vspd;
	
	}

}