// Draw hotkey letter/number
if (hotkey != 0) {
	draw_hotkey();
}

if (glowing) {
	draw_self();
	surface_set_target(o_Glow.glow_pass_surface);
	draw_self();
	surface_reset_target();
} else {
	if (mouse_over) {
		draw_self();
	} else {
		shader_set(shader_desaturate);
		draw_self();
		shader_reset();
	}
}

