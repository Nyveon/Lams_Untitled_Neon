var_sigma += pulse_speed;
    
shader_set(shd_glow_map);
    shader_set_uniform_f(uni_glow_blur_sigma, sin(var_sigma));
    shader_set_uniform_f(uni_glow_resolution, surface_get_width(glow_pass_surface), surface_get_height(glow_pass_surface));
    texture_set_stage(samp_glow_surface, surface_get_texture(glow_pass_surface));
    draw_surface(application_surface, 0, 0);
shader_reset();

draw_text(0, 0, string_hash_to_newline("Glow pulse speed (Mouse wheel to change) = " + string(pulse_speed)));

