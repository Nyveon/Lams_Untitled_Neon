///Draw glow map sprites to surface

surface_set_target(glow_pass_surface);
    draw_clear_alpha(c_black, 1.0);
       
    with (par_is_glow_sprite) {
        draw_sprite(__glow_texture, -1, x - camera_get_view_x(view_camera[0]), y - camera_get_view_y(view_camera[0]));
    }
    
surface_reset_target();