vspd += grav;
x += hspd;
y += vspd;

timer ++;

if (timer >= 8 && !global.moderneffects) {

	timer = 0;
	image_angle += 90;
	
} else if (global.moderneffects) {
	
	image_angle += 10;
	
}