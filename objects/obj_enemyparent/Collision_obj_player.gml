/// @description Interaction with the player

//Don't interact with the player if you're not alive
if (dead || stompdead || global.frozen || other.dead || other.cooldown > 0) exit;

//Don't interact with the player if you are invincible, but only if the player isn't invincible
if (invincible) && !(other.invincible) exit;

//Do different actions if the player is sliding or invincible
if (other.invincible) {
		
	other.invincible_combo ++;
		
	//Invincible dead
	full_dead = true;
		
	//Kill the enemy
	event_user(0);
	
	audio_play_stop_sound(snd_kick,0,0);
		
	//Add to the invincibility combo
	if (!global.moderneffects)
	
		add_score(alternatescore,x,y,1,60);
	
	else {
		hit_combo(other.invincible_combo,other.invincible_combo, true, other.char);
		
	}

	//Exit so you don't perform the rest of the interactions
    exit;
    
}

//Don't interact with the player if the cooldown isn't over, but only if the player isn't invincible
if (cooldown > 0) exit;

if (stompable == 0 && !(other.mount != noone && other.vspd > 0)) {
		
	event_user(15);
	exit;
		
}

//Interact with the player differently if they're above you
if (((other.vspd > 0) || ((other.vspd == 0) && (other.bbox_bottom < bbox_top-vspd))) && (other.powerup != itemtype.id_subcon || !pickup)) {
	
	if (other.mount != noone) {
		
		if (stompable == 1) {
        
			audio_play_stop_sound(snd_kick,0,0);
		
			instance_destroy();
		
			effect_create(spr_smoke_large,0.25,x,y);
			
			add_score(alternatescore,x,y,1,60);
		
			with (other)
		
				event_user(0);
		
			exit;
			
		} else {
			
			audio_play_stop_sound(snd_stomp,0,0);
			
			effect_create(spr_impact,0.5,other.x,other.y+8);
		
			with (other)
		
				event_user(0);
				
			cooldown = 8;
			
			//Editor
			if (global.editormode || global.moderneffects) other.cooldown = 4;
				
			exit;
				
		}
		
	}
		
	//If the player can stomp on the enemy
	else if (stompable == 1) {
        
		//If the enemy isn't set up to give the player a different score when stomped on, give the normal amount
		if (!differentscoring) {
			
			other.combo ++;
	        hit_combo(other.combo, other.combo, false, other.char);
			
		}
		
		//Hurt the enemy
        event_user(1);
		
		//Make the player bounce
        with (other) event_user(0);
		
		//Set up the hit delay so there's a time where the enemy can't be hurt and the player can't hurt it
		cooldown = 8;
		
		//Editor
		if (global.editormode || global.moderneffects) other.cooldown = 4;
		
		//Exit so you don't potentially do other player interactions
		exit;
            
    } 
	
	//Alternate stomp
	else if (stompable == 2) {
				
		//Bounce the player
		with (other) event_user(0);
			
		//Make the stomp sound and impact
		audio_play_stop_sound(snd_stomp,0,0);
			
		//Set up the hit delay so there's a time where the enemy can't be hurt and the player can't hurt it
		cooldown = 8;
		
		//Editor
		if (global.editormode || global.moderneffects) other.cooldown = 4;
			
		//Exit so you don't potentially do other player interactions
		exit;

	}
        
} else if ((other.vspd <= 0 && (other.powerup != itemtype.id_subcon || !pickup)) || ((other.vspd < 0 || other.grounded) && pickup && other.powerup == itemtype.id_subcon)) {
	
	event_user(15);
		
}