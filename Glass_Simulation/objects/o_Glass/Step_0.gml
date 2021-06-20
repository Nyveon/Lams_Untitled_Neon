#region Input
// Release drag
if (o_Input.action_released) {
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
		if (o_Input.action_pressed) {
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
		heated_groups(heated_group_midpoints);

		// If there is even something to be bent,
		if (ds_list_size(heated_group_midpoints) > 0) {
			
			// Get nearest heated midpoint to mouse (one to be bent)
			var pivot = heated_nearest();
			var pivot_node = nodes[| pivot];
			var pivot_x = pivot_node.x;
			var pivot_y = pivot_node.y;
			var direction_to_pivot = -angle_difference(point_direction(nodes[| selected].x, nodes[| selected].y, pivot_x, pivot_y), point_direction(mouse_x, mouse_y, pivot_x, pivot_y));

			
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
		
		// Cleanup
		ds_list_destroy(heated_group_midpoints); 
	} else if (o_Hand.current_tool == 2) {	// PULL/PINCHING
		
		// Get groups of heated nodes
		heated_group_midpoints = ds_list_create();
		heated_groups(heated_group_midpoints);
		
		if (ds_list_size(heated_group_midpoints) > 0) {
			// Get nearest heated node group
			var pivot = heated_nearest(); // control point 2 (vertex)
			var pivot_node = nodes[| pivot];
			
			var left_most = 0; // leftmost node of the heated area
			var right_most = ds_list_size(nodes) - 1; // rightmost node of the heated area
		
			// Find left-most heated point
			for (var i = pivot - 1; i >= 0; i--) { 
				var n = nodes[| i];
				if (not n.isHeated()) {
					left_most = i + 1;
					break;
				}
			}
			
			// Find right-most heated point
			for (var i = pivot + 1; i < ds_list_size(nodes); i++) { 
				var n = nodes[| i];
				if (not n.isHeated()) {
					right_most = i - 1;
					break;
				}
			}

			// BEZIER CURVE TIME AWW YEAHHH
			var c1_x = nodes[| left_most].x;
			var c1_y = nodes[| left_most].y;
			var c3_x = nodes[| right_most].x;
			var c3_y = nodes[| right_most].y;
			var range = (right_most - left_most);
			
			// Midpoin to limit the size of the curve
			// some of these do NOT need to be local
			var mid_x = (c1_x + c3_x)/2;
			var mid_y = (c1_y + c3_y)/2;
			var range_dist = point_distance(c1_x, c1_y, c3_x, c3_y);
			var bezier_proportion = range_dist/2;
			var mouse_dir = point_direction(mid_x, mid_y, mouse_x, mouse_y);
			var c2_x = mid_x + lengthdir_x(bezier_proportion, mouse_dir);
			var c2_y = mid_y +lengthdir_y(bezier_proportion, mouse_dir);
			
			for (var i = left_most + 1; i < right_most; i++) {
				var n = nodes[| i];	
				var t = (i - left_most)/range;
				var bx = (1 - t) * (1 - t) * c1_x + 2 * (1 - t) * t * c2_x + t * t * c3_x;
				var by = (1 - t) * (1 - t) * c1_y + 2 * (1 - t) * t * c2_y + t * t * c3_y;		
				n.x = lerp(n.x, bx, 0.1);
				n.y = lerp(n.y, by, 0.1);
			}

		}
		
		// Cleanup
		ds_list_destroy(heated_group_midpoints);
	}

	// ---Heat up---
	if (o_Input.debug_heat_up) {
		nodes[| selected].changeTemperature(1);
	}
}


