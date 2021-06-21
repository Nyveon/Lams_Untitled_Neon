if (line == -1) {
	line = instance_create_layer(line_x, 135, "Instances_Over", o_Redline);
} else {
	if (position_meeting(mouse_x, mouse_y, id) and o_Input.action_pressed) {
		audio_play_sound(choose(d_Squeak_1, d_Squeak_2, d_Squeak_3), 2, 0);
		line.jump();
	}
}


