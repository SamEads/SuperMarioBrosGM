function fade_screen(fade_in,fade_out,pause){

	obj_controller.fade_out = fade_out;
	obj_controller.fade_in = fade_in;
	if (pause != -1) obj_controller.fadetimer = pause;
	obj_controller.fade_dir = 1;

}