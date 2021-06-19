ds_list_destroy(touching);
touching = ds_list_create();
with (hitbox) {
	other.num = instance_place_list(x, y, o_Node, other.touching, false);
}
hitbox.x = x;
hitbox.y = y + hitbox_offset_y;


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



