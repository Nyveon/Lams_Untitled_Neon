// Increment flicker animation tick
flicker_ticks += flicker_speed;


if (displayed_score_p >= score_p and !instance_exists(o_Button_Next)) {
	instance_create_layer(282, 205, "GUI", o_Button_Next);
	instance_create_layer(0, 0, "GUI", o_Cursor);
}