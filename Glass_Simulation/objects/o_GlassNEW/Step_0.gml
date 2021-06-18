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
for (var i = 0; i < ds_list_size(nodes); i++) {  // MERGE INTO NODE-STEP
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
//todo: adjust rate
if (o_Flame.num > 0) {
	for (var i = 0; i < o_Flame.num; i++) {  // MERGE INTO NODE-STEP
		nodes[| o_Flame.touching[| i].index ].changeTemperature(10);
	}
}

// Whole node array modification
if (selected != -1) {
	// Mouse relative motion for dragging
	var mouse_dx = mouse_x - mouse_relative_x;
	var mouse_dy = mouse_y - mouse_relative_y;
	mouse_relative_x =  mouse_x;
	mouse_relative_y =  mouse_y;
	
	// ---Update all nodes with new information---
	
	
	if (o_Hand.current_tool == 0) {							// DRAGGING
		for (var i = 0; i < ds_list_size(nodes); i++) {
			var n = nodes[| i];
			n.set_position(n.x + (mouse_dx), n.y + (mouse_dy));
		}
	} else if (o_Hand.current_tool == 1) {					// ROTATING
		// Find groups of heated nodes
		heated_group_midpoints = ds_list_create();
		var inside_a_heated_group = false;
		var heated_group_start = 0;
		for (var i = 0; i < ds_list_size(nodes); i++) { // MERGE INTO NODE-STEP
			var n = nodes[| i];
			
			// State switch
			if (inside_a_heated_group) {	// Currently recorriendo a heated section
				if (not n.isHeated()) {
					inside_a_heated_group = false;
					ds_list_add(heated_group_midpoints, floor((heated_group_start + i)/2));
				}
			} else {
				if (n.isHeated()) {	// Not yet recorriendo a heated section
					inside_a_heated_group = true;
					heated_group_start = i;
				}
			}
		}
		if (inside_a_heated_group) { // Edge case: first or last node is heated, last node was heated
			ds_list_add(heated_group_midpoints, floor((heated_group_start + ds_list_size(nodes) - 1)/2));
		}
		
		// If there is even something to be bent,
		if (ds_list_size(heated_group_midpoints) > 0) {
			
			// Get nearest heated midpoint to mouse (one to be bent)
			var pivot = 0;
			for (var i = 0; i < ds_list_size(heated_group_midpoints); i++) {
				var n = nodes[| heated_group_midpoints[| i]];
				var current_min = 1000000000; // no way a number will be bigger than this lol
				var pd = point_distance(n.x, n.y, mouse_x, mouse_y);
				if (pd < current_min) {
					current_min = pd;
					pivot = n.index;
				}
			}
			
			// Rotate around that point
			var pivot_node = nodes[| pivot];
			var pivot_x = pivot_node.x;
			var pivot_y = pivot_node.y;
			
			var direction_to_pivot = -angle_difference(point_direction(nodes[| selected].x, nodes[| selected].y, pivot_x, pivot_y), point_direction(mouse_x, mouse_y, pivot_x, pivot_y));
			//show_debug_message(direction_to_pivot);
			
			// Left or right of heated area to be bent
			if selected > pivot { // left
				for (var i = pivot + 1; i < ds_list_size(nodes); i++) { 
					var n = nodes[| i]
					
					var dist = point_distance(n.x, n.y, pivot_x, pivot_y);
					var rot = point_direction(pivot_x, pivot_y, n.x, n.y) + direction_to_pivot;
					var old_x = n.x;
					var old_y = n.y;
					n.set_position(pivot_x + lengthdir_x(dist, rot), pivot_y + lengthdir_y(dist, rot));
				}
				
				
			} else { // right
				for (var i = pivot - 1; i >= 0; i--) { 
					var n = nodes[| i]
					
					var dist = point_distance(n.x, n.y, pivot_x, pivot_y);
					var rot = point_direction(pivot_x, pivot_y, n.x, n.y) + direction_to_pivot;
					var old_x = n.x;
					var old_y = n.y;
					n.set_position(pivot_x + lengthdir_x(dist, rot), pivot_y + lengthdir_y(dist, rot));
				}
			}
			
		} else { // IF THERE ISN'T SOMETIHNG TO BE BENT (normal rotate);
			
			// Calculating centroid for pivot point when nothing is heated
			var centroid_x = 0;
			var centroid_y = 0;
			for (var i = 0; i < ds_list_size(nodes); i++) { 
				var n = nodes[| i];
				
				centroid_x += n.x;
				centroid_y += n.y;
			}
			centroid_x /= ds_list_size(nodes);
			centroid_y /= ds_list_size(nodes);
			
			var direction_to_pivot = -angle_difference(point_direction(nodes[| selected].x, nodes[| selected].y, centroid_x, centroid_y), point_direction(mouse_x, mouse_y, centroid_x, centroid_y));
			
			for (var i = 0; i < ds_list_size(nodes); i++) { 
				var n = nodes[| i];
				
				var dist = point_distance(n.x, n.y, centroid_x, centroid_y);
				var rot = point_direction(centroid_x, centroid_y, n.x, n.y) + direction_to_pivot;
				var old_x = n.x;
				var old_y = n.y;
				n.set_position(centroid_x + lengthdir_x(dist, rot), centroid_y + lengthdir_y(dist, rot));
			}
			
			
		}
		ds_list_destroy(heated_group_midpoints); // memory yaaay
		
		
		
	}

	
	
	
	// ---Heat up---
	if (debug_heat_up) {
		nodes[| selected].changeTemperature(1);
	}
}


