if !place_meeting(x, y, o_Node) {
	lit = c_white;
	sprite_index = s_Node_Checker;
	is_lit = false;
} else {
	lit = make_color_hsv(100, 255, 255);
	sprite_index = s_Node_Debug;
	is_lit = true;
}

