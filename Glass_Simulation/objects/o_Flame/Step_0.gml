ds_list_destroy(touching);
touching = ds_list_create();
old_num = num;

if o_Hand.current_tool == 0 { // only heat when in drag mode
	sprite_index = s_Torch;
	with (hitbox) {
		other.num = instance_place_list(x, y, o_Node, other.touching, false);
	}
	
	// Play sounds
	if (num != 0) {
		if (!audio_is_playing(d_Heating)) {
			audio_play_sound(d_Heating, 5, true);
		}
	} else {
		audio_stop_sound(d_Heating);
		if (!muted and !audio_is_playing(d_Burner)) {
			audio_play_sound(d_Burner, 5, true);
		}
	}
	if (old_num == 0 && num != 0) {
		if (!audio_is_playing(d_Into_Fire)) {
			audio_play_sound(d_Into_Fire, 5, false);
		}
	}


} else {
	audio_stop_sound(d_Burner);
	num = 0;
	sprite_index = s_Torch_Off;
}

hitbox.x = x;
hitbox.y = y + hitbox_offset_y;

// Done dragging
if (o_Input.action_released) {
	dragging = false
}

if (o_Input.action_pressed and o_Hand.current_tool == 0 and o_Hand.flame_hover_id != noone) {
	dragging = true;
	mouse_relative_x = mouse_x;
	mouse_relative_y = mouse_y;
}

if dragging {
	var delta_x = mouse_x - mouse_relative_x;
	var delta_y = mouse_y - mouse_relative_y;
	mouse_relative_x = mouse_x;
	mouse_relative_y = mouse_y;
	
	x = clamp(x + delta_x, 18, 284);
	y = clamp(y + delta_y, 26, 160);
}



