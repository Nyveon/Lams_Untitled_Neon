// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function start_minigame_1(current_letter, _x, _y, _l){
	anchor_x = _x; // 140
	anchor_y = _y;  // 62
	tube_number = _l;

	node_number = array_length(current_letter)
	show_debug_message("Nodes for objetive: " + string(node_number));

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
		for (var i = 0; i < other.tube_number; i++) {
			ds_list_add(nodes, new Node(other.anchor_x + (joint_distance*i), other.anchor_y - 32, i));
		}
	}
}