/// @description Initial camera set-up
event_user(1);

//room_goto(rm_editor) exit;

if (old_data)

	room_goto(rm_corrupt);

else if (!first_time)

	room_goto(rm_presents);
	
else {

	room_goto(rm_setup);
	visible = false;
	
}