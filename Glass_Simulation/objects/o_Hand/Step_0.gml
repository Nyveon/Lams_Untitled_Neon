image_index = 0;
x = mouse_x;
y = mouse_y;
hover_id = instance_place(x, y, o_Node);
flame_hover_id = instance_place(x, y, o_Flame);

// 0 - drag
// 1 - rotate
// 2 - pull

var bd = 0;
var br = 0;
var bp = 0;
var ff = 0;

if instance_exists(o_Button_Drag) {
	bd = o_Button_Drag;
} else {
	bd = o_Workshop_Init;
}

if instance_exists(o_Button_Rotate) {
	br = o_Button_Rotate;
} else {
	br = o_Workshop_Init;
}

if instance_exists(o_Button_Pull) {
	bp = o_Button_Pull;
} else {
	bp = o_Workshop_Init;
}


switch (current_tool) {
	case 0:
		bd.glowing = true;
		bp.glowing = false;
		br.glowing = false;
		sprite_index = s_HandOpen;
		
		if (hover_id != noone || o_Glass.selected != -1 || flame_hover_id != noone || o_Flame.dragging) {
			image_index = 1;
			if (o_Input.action) {
				image_index = 2;
			}
		}
		
		break;
	case 1:
		bd.glowing = false;
		bp.glowing = false;
		br.glowing = true;
		sprite_index = s_HandRotate;
		
		if (hover_id != noone || o_Glass.selected != -1) {
			image_index = 1;
		}
		
		break;
	case 2:
		bd.glowing = false;
		bp.glowing = true;
		br.glowing = false;
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

