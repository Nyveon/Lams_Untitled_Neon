/// @description Single note instanciation

// Control properties
mouse_hover = false;
mouse_selected = false;
rotation_speed = 5;
mouse_relative_x = 0;
mouse_relative_y = 0;

// Visual
image_alpha = 1;

// Physical values
angle = 0;
joint_distance = 1;

// Linked
left = -1;
left_rel_angle = 0;
right = -1;
right_rel_angle = 0;

// Double dispatch method for updating the position
function update_position(value_x, value_y, from_left) {
	// Update own values
	x += value_x;
	y += value_y;
	
	// Update values down the chain
	if (from_left) {
		if (right != -1) {
			right.update_position(value_x, value_y, true);
		}
	} else {
		if (left != -1) {
			left.update_position(value_x, value_y, false);
		}
	}
}


// Double dispatch method for chaining a rotation (trigonometry incoming)
function update_angle(value_angle, value_x, value_y, from_left) {
	// Update visual node angle
	angle = value_angle;
	
	
	// Propagate changes
	if (from_left) {
		x = value_x + lengthdir_x(joint_distance, value_angle + left_rel_angle) * from_left;
		y = value_y + lengthdir_y(joint_distance, value_angle + left_rel_angle) * from_left;
		if (right != -1) {
			right.update_angle(value_angle + right_rel_angle, x, y, 1);
		}
	} else {
		x = value_x + lengthdir_x(joint_distance, value_angle + right_rel_angle) * from_left;
		y = value_y + lengthdir_y(joint_distance, value_angle + right_rel_angle) * from_left;
		if (left != -1) {
			left.update_angle(value_angle + left_rel_angle, x, y, -1);
		}
	}
}
