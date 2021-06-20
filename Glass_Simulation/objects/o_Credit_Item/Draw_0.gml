// Draw glowy self
draw_self();
surface_set_target(o_Glow.glow_pass_surface);
draw_self();
surface_reset_target();

// draw twitter handle
draw_set_color(c_gray);
draw_set_halign(fa_middle);
draw_set_valign(fa_top);
draw_set_font(f_Silver14);
draw_text(x + sprite_width/2, y + sprite_height + 4, twitter);


