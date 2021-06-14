/// @description Node behaviour

// Mouse selecting
mouse_hover = (o_Hand.hover_id == id);

// Begin dragging
if (mouse_hover && mouse_check_button_pressed(mb_left)) {
	mouse_selected = true;
	mouse_relative_x = mouse_x - x;
	mouse_relative_y = mouse_y - y;
}

// If mouse is ever released, end dragging
if (mouse_check_button_released(mb_left)) {
	mouse_selected = false;
	mouse_relative_x = 0;
	mouse_relative_y = 0;
}

// Interaction
var delta_x = 0;
var delta_y = 0;
var delta_angle = 0

// Keep values reasonable
angle = angle % 360;
right_rel_angle = right_rel_angle % 360;
left_rel_angle = left_rel_angle % 360;


// Interaction
if (mouse_selected) {
	// Dragging
	
	delta_x = (mouse_x - mouse_relative_x) - x;
	delta_y = (mouse_y - mouse_relative_y) - y;
	
	// Rotating
	var rotation_direction = keyboard_check(ord("Q")) - keyboard_check(ord("E"));
	delta_angle += rotation_direction * rotation_speed;
	
	
	var joint_rotation_direction = keyboard_check(ord("A")) - keyboard_check(ord("D"))
	right_rel_angle += joint_rotation_direction * rotation_speed;
	var joint_rotation_direction = keyboard_check(ord("Z")) - keyboard_check(ord("C"))
	left_rel_angle -= joint_rotation_direction * rotation_speed;
	
	// Relative joint angles
	if (right != -1) {
		right.right_rel_angle = 360 - left_rel_angle;
	} 
	if (left != -1) {
		left.left_rel_angle = 360 - right_rel_angle;
	} 

	// Update own position
	x += delta_x;
	y += delta_y;
	angle += delta_angle;
	
	// Propagate updates to linked nodes
	if (right != -1) {
		right.update_position(delta_x, delta_y, 1);
		right.update_angle(angle, x, y, 1);
	}
	if (left != -1) {
		left.update_position(delta_x, delta_y, -1);
		left.update_angle(angle, x, y, -1);
	}
}


// Update values
image_angle = angle;





