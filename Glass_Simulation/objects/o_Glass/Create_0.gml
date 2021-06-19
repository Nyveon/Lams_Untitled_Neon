#region Interface variables
hover = false; // If mouse is hovering over any node
selected = -1; // Which node is selected
mouse_relative_x = 0;
mouse_relative_y = 0;
rotation_speed = 3;
#endregion

#region Tube and nodes
joint_distance = 1;
heat_exchange = -0.4;

// Constructor for a glass node
function Node(value_x, value_y, value_id) constructor {
	// Position
	x = value_x;
	y = value_y;
	
	// Data structure values
	instance = instance_create_layer(x, y, "Instances", o_Node);
	index = value_id;
	instance.index = index;
	
	// Physical values
	temperature = 0;
	
	// Update own position
	static set_position = function(value_x, value_y) {
		x = value_x;
		y = value_y;
	}
	
	// Update object instance position
	static update = function() {
		instance.x = x;
		instance.y = y;
	}
	
	// Draw self
	static draw = function() {
		draw_sprite_ext(s_Node_Debug, 0, x, y, 1, 1, 0, make_color_hsv(temperature/9, temperature * 2.5, 255), 0.4);
	}
	
	// Temperature setter
	static changeTemperature = function(value) {
		temperature = clamp(temperature + value, 0, 250);
	}
	
	// Check: is heated?
	static isHeated = function() {
		return (temperature > 1);
	}
}


nodes = ds_list_create();
// Debug glass tube
for (var i = 0; i < 200; i++) {
	ds_list_add(nodes, new Node((room_width/2) - 144 + (joint_distance*i), room_height/2, i));
}
#endregion

#region Animation and visual
glowing = false;
#endregion

#region Big maths

// Find groups of consecutive heated nodes
heated_groups = function(list) {
	var inside_a_heated_group = false;
	var heated_group_start = 0;
	for (var i = 0; i < ds_list_size(nodes); i++) { // MERGE INTO NODE-STEP
		var n = nodes[| i];
			
		// State switch
		if (inside_a_heated_group) {	// Currently recorriendo a heated section
			if (not n.isHeated()) {
				inside_a_heated_group = false;
				ds_list_add(list, floor((heated_group_start + i)/2));
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
}

// Find nearest group of consecutive heated nodes
heated_nearest = function() {
	var pivot = 0;
	var current_min = 1000000000; // no way a number will be bigger than this lol
	for (var i = 0; i < ds_list_size(heated_group_midpoints); i++) {
		var n = nodes[| heated_group_midpoints[| i]];
		//var pd = point_distance(n.x, n.y, mouse_x, mouse_y);
		var pd = abs(selected - n.index) //node distance
		if (pd < current_min) {
			current_min = pd;
			pivot = n.index;
		}
	}
	return pivot;
}

#endregion