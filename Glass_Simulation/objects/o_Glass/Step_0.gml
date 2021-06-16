#region Input
// Controls
action_pressed = mouse_check_button_pressed(mb_left);
action_released = mouse_check_button_released(mb_left);

alt_action_pressed = mouse_check_button_pressed(mb_right);
alt_action_released = mouse_check_button_released(mb_right);

rotation_direction = keyboard_check(ord("Q")) - keyboard_check(ord("E")); 
debug_heat_up = keyboard_check(ord("H"));



// Release drag
if (action_released) {
	selected = -1;
	mouse_relative_x = 0;
	mouse_relative_y = 0;
	
}
#endregion

// Start node step
for (var i = 0; i < ds_list_size(nodes); i++) {
	var n = nodes[| i]
	
	
	// Update all positions
	n.update();
	n.changeTemperature(heat_exchange);
	
	// Check nodes for mouse interaction
	var inst = n.instance;
	hover = hover || false; 
	if (o_Hand.hover_id == inst) {
		hover = true;
		
		// Pressed
		if (action_pressed) {
			selected = inst.index;
			mouse_relative_x =  mouse_x;
			mouse_relative_y =  mouse_y;
		}
	}
}

// Temperature because of flame
if (o_Flame.num > 0) {
	for (var i = 0; i < o_Flame.num; i++) {
		nodes[| o_Flame.touching[| i].index ].changeTemperature(10);
	}
}


// Whole array drag
if (selected != -1) {
	// Mouse relative motion for dragging
	var mouse_dx = mouse_x - mouse_relative_x;
	var mouse_dy = mouse_y - mouse_relative_y;
	mouse_relative_x =  mouse_x;
	mouse_relative_y =  mouse_y;
	
	// Update all nodes with new information
	for (var i = 0; i < ds_list_size(nodes); i++) {
		var n = nodes[| i];
		n.set_position(n.x + (mouse_dx), n.y + (mouse_dy));
	}
	
	// Full rotation
	// NOTE: can be optimized by combining with above is a switch statement
	// ALSO NOTE: possible problems with floating point imprecision and the bar getting longer and longer
	if (rotation_direction != 0) {
		var selected_node = nodes[| selected]
		var rotation_point_x = selected_node.x;
		var rotation_point_y = selected_node.y;
		var rotation_angle = rotation_speed * rotation_direction;
		var rotating;
		
		// Propagate left
		var selected_node = nodes[| selected]
		var rotation_point_x = selected_node.x;
		var rotation_point_y = selected_node.y;
		var rotation_angle = rotation_speed * rotation_direction;
		var rotating = true;
		for (var i = selected + 1; i < ds_list_size(nodes); i++) { 
			var n = nodes[| i]
			
			if (rotating) {
				var dist = point_distance(n.x, n.y, rotation_point_x, rotation_point_y);
				var rot = point_direction(rotation_point_x, rotation_point_y, n.x, n.y) + rotation_angle;
				var old_x = n.x;
				var old_y = n.y;
				n.set_position(rotation_point_x + lengthdir_x(dist, rot), rotation_point_y + lengthdir_y(dist, rot));
			
				// If heated, stop
				if (n.temperature > 1) {
					rotating = false;
					var dx = n.x - old_x;
					var dy = n.y - old_y;
				}
			} else {
				n.set_position(n.x + dx, n.y + dy);
			}	
		}
		
		
		// Propagate right
		rotating = true;
		for (var i = selected - 1; i >= 0; i--) { 
			var n = nodes[| i]
			
			if (rotating) {
				var dist = point_distance(n.x, n.y, rotation_point_x, rotation_point_y);
				var rot = point_direction(rotation_point_x, rotation_point_y, n.x, n.y) + rotation_angle;
				var old_x = n.x;
				var old_y = n.y;
				n.set_position(rotation_point_x + lengthdir_x(dist, rot), rotation_point_y + lengthdir_y(dist, rot));
			
				// If heated, stop
				if (n.temperature > 1) {
					rotating = false;
					var dx = n.x - old_x;
					var dy = n.y - old_y;
				}
			} else {
				n.set_position(n.x + dx, n.y + dy);
			}	
		}
		
	}
	
	// Heat up
	if (debug_heat_up) {
		nodes[| selected].changeTemperature(1);
	}
}


