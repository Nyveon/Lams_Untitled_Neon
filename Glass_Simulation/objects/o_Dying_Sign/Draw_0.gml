

draw_sprite(sign_sprite, 0, x, y);
// draw backing

// Draw glowy bit
if glowing {
	if flickering {
		image_alpha = flicker[floor(flicker_ticks) % flicker_length]
	}
	draw_self();
	surface_set_target(o_Glow.glow_pass_surface);
	draw_self();
	surface_reset_target();
} else {
	image_alpha = 1;
	shader_set(shader_desaturate);
	draw_self();
	shader_reset();
}



