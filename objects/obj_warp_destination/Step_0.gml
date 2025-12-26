if (showtimer > 0) {
	if (showtimer-- == 0) {
		obj_controller.showtime = true;
		global.freezetime = false;
		captor.controllable = true;
	} else {
		obj_controller.showtime = false;
		global.freezetime = true;
	}
}