mouse_over = position_meeting(mouse_x, mouse_y, id);

if (glow_on_mouse) {
	glowing = mouse_over;
}

if (o_Input.action_pressed && mouse_over) {
	button_action();
}