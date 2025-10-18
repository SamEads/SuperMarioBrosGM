if (global.frozen) exit;

ang += 20;

vspd += grav;

if (vspd >= 4)

	vspd = 4;

x += hspd;
y += vspd;

if (y-16 > room_height)

	instance_destroy();