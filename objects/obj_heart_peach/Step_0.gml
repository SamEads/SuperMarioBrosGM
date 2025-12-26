y -= 0.125;

x = xstart + (sin(timer*(0.1)) * 2);

timer ++;

if (dir == 1 && x > xstart + 4)

	dir = -1;
	
else if (dir == -1 && x < xstart-4)

	dir = 1;
	
if (y < ystart-16)

	instance_destroy();