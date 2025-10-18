if (global.frozen) {
	
	if (imgspd == -1) {
		
		imgspd = image_speed;
		image_speed = 0;
		
	}
	
	exit;
	
} else if (!dead) {
	
	if (imgspd > 0) {
	
		image_speed = imgspd;
		imgspd = -1;
		
	}
	
}

if (stompdead)

	hspd = 0;
	
if !(dead && !stompdead) {

	if (physics) {

		// Inherit the parent event
		event_inherited();
		
	}
	
} else {
	
	if (global.moderneffects)
	
		ang += 10*sign(xscale);
		
	else
	
		ang = 0;
	
	vspd += grav;
	
	var vspcap = vspd_cap;
	
	if (instance_place(x,y,obj_liquid)) {
		
		grav = 0.1875;
		vspcap = 2;
	
	} else {
		
		grav = 0.2;
		
	}
	
	if (vspd >= vspcap)
	
		vspd = vspcap;
		
	x += hspd;
	y += vspd;
	
}

if (dead && !stompdead) exit;

if (edgeflip)

	event_user(2);

if (cooldown > 0)

	cooldown --;
	
//Change the scale depending on which way facing
if (hspd != 0)
&& (auto_xscale) {

    xscale = sign(hspd);
    
}

//Flip at enemies
var touchingenemy = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_enemyparent, 0, 1);

if (touchingenemy) && !(dead && !stompdead) {

    if (enemyturn) && (touchingenemy.enemyturn) && !(touchingenemy.dead && !touchingenemy.stompdead) {

        if ((bbox_left+bbox_right)*0.5 >= (touchingenemy.bbox_left+touchingenemy.bbox_right)*0.5) hspd = abs(hspd); else hspd = -abs(hspd);

    }
    
}

if (collision_rectangle(bbox_left,bbox_bottom-1,bbox_right,bbox_bottom+2,obj_blockparent,0,1)) {

	//Collision with the bottom of blocks
	var _l = ds_list_create();
	var _blocks = collision_rectangle_list(bbox_left+2,bbox_bottom-1,bbox_right-2,bbox_bottom+2,obj_blockparent,0,1,_l,false);

	if (_blocks > 0) {
	
		for (var i = 0; i < _blocks; i ++) {
	
			if (ds_list_find_value(_l,i).hitsequence <= 2 && ds_list_find_value(_l,i).hitsequence > 0) {
		
				with (other) {
	
					hitter = other.hitter;
					event_user(13);
			
				}
		
			}
			
		}
	
	}
	
	ds_list_destroy(_l);
	
}

//If killed normally
if (dead == true) {

    //Set up death sprite
    if (stompdead = false) && (sprite_index != deathsprite) {
    
        sprite_index = deathsprite;
        
    }
	
}

//If dead from a stomp
if (stompdead == true) {

    dead = true;
    
    sprite_index = stompsprite;
    
    hspd = 0;
    
    stompdisappear ++;
    
    if stompdisappear >= 20 {
    
        instance_destroy();
        
    }
    
}

enemy = instance_nearest(x,y,obj_enemyparent);

if (enemy) {
	
	if (start_depth == enemy.start_depth)
	
		depth = enemy.start_depth+choose(-1,1);
	
}