

surface_set_target(o_Glow.glow_pass_surface);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, flicker[floor(flicker_ticks) % flicker_length]);
surface_reset_target();

draw_self();