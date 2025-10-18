// Inherit the parent event
event_inherited();

visible = true;

if (instance_exists(myitem)) {

	if (myitem.item == itemtype.id_coin) {
	
		with instance_create_depth(x,y-16,depth,obj_coin_collected) mysolid = other.id;
		global.coins ++;
		audio_play_stop_sound(snd_coin,0,0);
		myitem.amount --;
	
	} else if (myitem.item == itemtype.id_coin_multi) {
	
		with instance_create_depth(x,y-16,depth,obj_coin_collected) mysolid = other.id;
		global.coins ++;
		audio_play_stop_sound(snd_coin,0,0);
		if (multitimer == 0) multitimer = 1; //Initiate multi-timer
	
	} else {
	
		giveitem = true;
		myitem.amount --;
	
	}
	
} else {
	
	giveitem = true;
	
}

var end_sequence = false;

if (!instance_exists(myitem)) {
	
	end_sequence = true;
	
}

if (instance_exists(myitem)) {

	if (myitem.amount <= 0) {
		
		end_sequence = true;
		
	}
	
}

if (end_sequence) {
	
	sprite_index = spr_block_hit;
	can_hit = false;

}