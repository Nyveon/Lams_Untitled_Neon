#region Interface variables
hover = false; // If mouse is hovering over any node
selected = -1; // Which node is selected
mouse_relative_x = 0;
mouse_relative_y = 0;
rotation_speed = 3;
#endregion

#region Tube and nodes
joint_distance = 1;
heat_exchange = -0.5;

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
		draw_sprite_ext(s_Node_Debug, 0, x, y, 1, 1, 0, make_color_hsv(temperature/6, temperature * 2.5, 255), 0.4);
	}
	
	// Temperature setter
	static changeTemperature = function(value) {
		temperature = clamp(temperature + value, 0, 100);
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