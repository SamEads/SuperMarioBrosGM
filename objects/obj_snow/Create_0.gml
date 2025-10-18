timer = irandom_range(0,100);

image_speed = 0;

image_index = 3;

var rand = irandom_range(0,5);

if (rand >= 3)

	image_index = irandom_range(0,sprite_get_number(sprite_index)-1);

xmiddle = x;

var rand = irandom_range(0,15);

if (rand >= 10) {

	depth = -20;
	image_alpha = irandom_range(4,5)/10;
	
} else {

	depth = 199;
	image_alpha = irandom_range(1,3)/10;
	
}
	
if (depth == 199) {

	image_xscale = 0.5;
	image_yscale = 0.5;
	
} else {
	
	image_xscale = 0.75;
	image_yscale = 0.75;
	
}

xspd = choose(0.4,0.5,0.8);

yspd = choose(0.5,0.7,0.9);

if (global.scale == 1) {

	image_xscale = 1;
	image_yscale = 1;
	
	if (image_index == 0 || image_index == 4)
	
		image_index = 3;
	
}