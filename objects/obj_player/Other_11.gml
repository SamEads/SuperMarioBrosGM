/// @description Hurt the player

if (immune || invincibletimer > 0 || warping) exit;

immune = true;

if (mount != noone) {

	mount.rider = noone;
	mount.hspd = 2*sign(xscale);
	mount = noone;
	immunetimer = 100;
	vspd = -2;
	cooldown = 30;
	exit;

} else if (char == chara.custom && (sign(health_based) == 1)) {
	
	if (global.p_health[char] > 1) {

		jumprelease = true;
		jumping = false;
	
		if (powerup == itemtype.id_big)
	
			global.p_health[char] --;
		
		immunetimer = 125;
		audio_play_stop_sound(hurt_sound,0,0);
	
		var hit_spd = 2.5;
	
		if (swimming) hit_spd = 1;
	
		if (hspd != 0) hspd = -sign(hspd)*hit_spd; else hspd = (other.x > x) ? -hit_spd : hit_spd;
		vspd -= 1.3;
		powerup = itemtype.id_big;
		exit;
		
	}

} else if (powerup != itemtype.id_small) {
	
	lastsprite = sprite_index;
	
	if (powerup == itemtype.id_subcon) {
		
		if (global.moderneffects)
		
			powerupcheck = true;
			
		if (holding || pulling_up || pull_timer > 0) {
			
			pull_object.thrown = true;
			pull_object.depth = pull_object_depth;
			pull_object.hspd = 3*xscale;
			pull_object.thrower = id;
			throw_timer = 10;
			pull_object = noone;
			holding = false;
			
		}
		
		if (pull_timer > 0 || pulling_up) {
			
			controllable = true;
			physics = true;
		
		}
		
		pull_timer = 0;
		pulling_up = false;
		pull_y_goal = 0;
		throw_timer = 0;
		extra_y = 0;
		charge = 0;
		
	}
	
	poweringdown = true;
	transforming = true;
	transformtimer = round(room_speed * (audio_sound_length(snd_powerup)));
	
	if (!global.moderneffects || powerup == itemtype.id_big)
	
		powerup = itemtype.id_small;
		
	else
	
		powerup = itemtype.id_big;
		
	global.frozen = true;
	immunetimer = 150;
	audio_play_stop_sound(snd_pipe,0,0);
	exit;
	
}

if (global.p_health[char] == 1 || powerup == itemtype.id_small)

	event_user(2);