// Outer glow shader
if (glowing) {
	var_sigma += pulse_speed;

	shader_set(shd_glow_map);
	    shader_set_uniform_f(uni_glow_blur_sigma, 1.5 + sin(var_sigma)/2);
	    shader_set_uniform_f(uni_glow_resolution, surface_get_width(glow_pass_surface), surface_get_height(glow_pass_surface));
	    texture_set_stage(samp_glow_surface, surface_get_texture(glow_pass_surface));
	    draw_surface(application_surface, 0, 0);
	shader_reset();
}
