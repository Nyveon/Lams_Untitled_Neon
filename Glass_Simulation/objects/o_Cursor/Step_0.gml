x = mouse_x;
y = mouse_y;

if (position_meeting(x, y, o_Button) || position_meeting(x, y, o_Pump)) {
	image_index = 1
} else {
	image_index = 0;
}