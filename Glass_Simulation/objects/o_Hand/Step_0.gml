image_index = 0;

// Hover id
//hover_id = instance_place(x, y, o_Glass_Node);

// PLEASE DON'T READ THIS CODE I KNOW IT'S AWFUL T_T
hover_id = instance_place(x, y, o_Node);
if (hover_id != noone) {
	image_index = 1;
	if (current_tool == 0) {
		if o_Input.action {
			image_index = 2;
		}
	} else if (current_tool == 2) {
		image_index = 0;
		if (o_Glass.nodes[| hover_id.index].isHeated()) {
			image_index = 1;
		}
	}
} else if (o_Glass.selected != -1) {
	image_index = 1;
	if (current_tool == 2) {
		image_index = 0;
		if (o_Glass.nodes[| o_Glass.selected].isHeated()) {
			image_index = 1;
		}
	}
}

x = mouse_x;
y = mouse_y;

// 0 - drag
// 1 - rotate
// 2 - pull

switch (current_tool) {
	case 0:
		o_Drag.glowing = true;
		o_Pull.glowing = false;
		o_Rotate.glowing = false;
		sprite_index = s_HandOpen;
		break;
	case 1:
		o_Drag.glowing = false;
		o_Pull.glowing = false;
		o_Rotate.glowing = true;
		sprite_index = s_HandRotate;
		break;
	case 2:
		o_Drag.glowing = false;
		o_Pull.glowing = true;
		o_Rotate.glowing = false;
		sprite_index = s_HandStretch;
		break;
}

