image_index = 0;
x = mouse_x;
y = mouse_y;
hover_id = instance_place(x, y, o_Node);
flame_hover_id = instance_place(x, y, o_Flame);

// 0 - drag
// 1 - rotate
// 2 - pull

switch (current_tool) {
	case 0:
		o_Drag.glowing = true;
		o_Pull.glowing = false;
		o_Rotate.glowing = false;
		sprite_index = s_HandOpen;
		
		if (hover_id != noone || o_Glass.selected != -1 || flame_hover_id != noone || o_Flame.dragging) {
			image_index = 1;
			if (o_Input.action) {
				image_index = 2;
			}
		}
		
		break;
	case 1:
		o_Drag.glowing = false;
		o_Pull.glowing = false;
		o_Rotate.glowing = true;
		sprite_index = s_HandRotate;
		
		if (hover_id != noone || o_Glass.selected != -1) {
			image_index = 1;
		}
		
		break;
	case 2:
		o_Drag.glowing = false;
		o_Pull.glowing = true;
		o_Rotate.glowing = false;
		sprite_index = s_HandStretch;
	
		if (hover_id != noone) {
			if (o_Glass.nodes[| hover_id.index].isHeated()) {
				image_index = 1;
			}
		} else if (o_Glass.selected != -1) {
			if (o_Glass.nodes[| o_Glass.selected].isHeated()) {
				image_index = 1;
			}
		}
		break;
}

