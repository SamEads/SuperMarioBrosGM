if (instance_exists(myitem)) {

	if ((myitem.item == itemtype.id_big) || (myitem.item == itemtype.id_flower && (hitsize == itemtype.id_small || (hitter.char == chara.custom && (sign(health_based) == 1) && global.p_health[hitter.char] <= 1)))) {
	
		with instance_create_depth(x+8,y-1,30,obj_mushroom)
		
			sprouting = true;
		
		audio_play_stop_sound(snd_powerup_reveal,0,0);
	
		myitem.amount --;
	
	} else if (myitem.item == itemtype.id_flower) {
	
		with instance_create_depth(x+8,y-1,30,obj_fireflower)
		
			sprouting = true;
		
		audio_play_stop_sound(snd_powerup_reveal,0,0);
	
		myitem.amount --;
	
	} else if (myitem.item == itemtype.id_1up) {
		
		with instance_create_depth(x+8,y-1,30,obj_1up)
		
			sprouting = true;
		
		audio_play_stop_sound(snd_powerup_reveal,0,0);
	
		myitem.amount --;
		
	} else if (myitem.item == itemtype.id_poison) {
		
		with instance_create_depth(x+8,y-1,30,obj_poison_mushroom)
		
			sprouting = true;
		
		audio_play_stop_sound(snd_powerup_reveal,0,0);
	
		myitem.amount --;
		
	} else if (myitem.item == itemtype.id_star) {
		
		with instance_create_depth(x+8,y-4,30,obj_starman)
		
			sprouting = true;
		
		audio_play_stop_sound(snd_powerup_reveal,0,0);
	
		myitem.amount --;
		
	} else if (myitem.item == itemtype.id_vine) {
		
		instance_create_depth(x,y,190,obj_growing_vine)
		
		audio_play_stop_sound(snd_growing_vine,0,0);
	
		myitem.amount --;
		
	}
	
}

if (instance_exists(myitem))

	if (myitem.amount <= 0)

		with (myitem) instance_destroy();

giveitem = false;