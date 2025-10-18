vspd += grav;

if (vspd >= 4)

	vspd = 4;

y += vspd;
x += hspd;

if (!instance_in_view(self,view_camera[0],8))

	instance_destroy();