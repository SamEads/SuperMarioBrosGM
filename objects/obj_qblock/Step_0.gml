sp// Inherit the parent event
event_inherited();

if (global.frozen) exit;

//If the multi-timer has been activated
if (multitimer > 0) {
	
	//Once the multi-timer has hit its max...
	if (multitimer >= 240) {
		
		//If the item still exists...
		if (instance_exists(myitem)) {
			
			//Suck the amount dry for the next hit
			if (hitsequence == 0)
			
				myitem.amount = 0;
			
		}
		
	//Otherwise, if it hasn't hit this limit, add to the timer
	} else {
		
		multitimer ++;
		
	}
	
}