// Hover id
//hover_id = instance_place(x, y, o_Glass_Node);
hover_id = instance_place(x, y, o_Node);


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
		break;
	case 1:
		o_Drag.glowing = false;
		o_Pull.glowing = false;
		o_Rotate.glowing = true;
		break;
	case 2:
		o_Drag.glowing = false;
		o_Pull.glowing = true;
		o_Rotate.glowing = false;
		break;
}

