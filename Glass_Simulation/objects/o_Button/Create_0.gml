// Visual effects
mouse_over = false;
glowing = false;

// Override this function in child instances
button_action = function() {
	return; 
}

hotkey = "0";
x_offset = -17;
y_offset = -12; // 21 br


draw_hotkey = function() {
	// Draw text color
	draw_set_color(c_grey);
	draw_set_halign(fa_middle);
	draw_set_valign(fa_center);
	draw_set_font(f_Silver10);

	draw_text(x + x_offset, y + y_offset, hotkey);
}