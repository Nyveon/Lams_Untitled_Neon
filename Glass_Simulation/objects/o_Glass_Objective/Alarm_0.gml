/// @description Creation of Objective & Piepe
// You can write your code in this editor


// letters
current_letter = [[0,0]]
anchor_x = 140;
anchor_y = 62;

node_number = array_length_1d(current_letter)
show_debug_message("Nodes for objetive: " + string(node_number));

show_debug_message(current_letter[0][1]);

for (var i = 0; i < node_number; i++) {
	var xx = current_letter[i][0];
	var yy = current_letter[i][1];
	var instance = instance_create_layer(anchor_x + xx, anchor_y + yy, "Instances_Back", o_Checker_Node);
	instance.index = i;
}

// Glass bar for level
var glass = instance_create_layer(x, y, "Instances", o_Glass);
with glass {
	//Make DA TUBE
	for (var i = 0; i < other.node_number*1.2; i++) {
		ds_list_add(nodes, new Node((room_width/2) - 144 + (joint_distance*i), room_height/2, i));
	}
}
