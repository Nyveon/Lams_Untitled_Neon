draw_self();

if (mouse_over) {
	surface_set_target(o_Glow.glow_pass_surface);
	draw_self();
	surface_reset_target();
}