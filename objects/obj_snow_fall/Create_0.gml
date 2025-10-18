image_speed = 0;

hspd = (irandom_range(5,50)/100)*choose(-1,1);
vspd = -random_range(2,4);
grav = choose(0.1875,0.2);

image_alpha = random_range(0.7,0.9);

image_xscale = choose(0.5,0.75,1);
image_yscale = image_xscale;

image_index = choose(0,3);