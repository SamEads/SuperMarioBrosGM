if (global.frozen) exit;

if (hspd < 0.425)

	hspd = 0.425;

if (hspd < 0.8125)

	hspd += 0.0025;
	
else

	hspd = 0.8125;

// Inherit the parent event
event_inherited();