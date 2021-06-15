gpu_set_blendenable(true);
draw_set_color(c_white);

glow_pass_surface = surface_create(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));

samp_glow_surface =   shader_get_sampler_index(shd_glow_map, "s_glow_surface");
uni_glow_blur_sigma = shader_get_uniform(shd_glow_map, "u_glow_blur_sigma");
uni_glow_resolution =   shader_get_uniform(shd_glow_map, "u_glow_resolution");

var_sigma = 0;
pulse_speed = 0.05;

