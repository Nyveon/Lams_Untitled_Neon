/// @description Insert description here
// You can write your code in this editor

draw_self();


// Draw text
draw_set_color(c_white);
draw_set_halign(fa_middle);
draw_set_valign(fa_center);
draw_set_font(f_Silver14);
draw_text(x, y + 48, "Precision: " + string(o_Main.score_precision) + " points.");
//draw_text(x, y + 72, "r: " + string(o_Main.score_precision_ratio));
draw_text(x, y + 64, "Time: " + string(o_Main.score_time));

// draw star backs
for (var i = 0; i < 5; i++) {
	draw_sprite(s_offStar, 0, x + left + h_i_offset * i, y + v_offset);
}

for (var i = 0; i < displayed_stars; i++) {
	draw_sprite(s_redStar, 0, x + left + h_i_offset * i, y + v_offset);
	surface_set_target(o_Glow.glow_pass_surface);
	draw_sprite(s_redStar, 0, x + left + h_i_offset * i, y + v_offset);
	surface_reset_target();
}

if (stars_displaying && displayed_stars<=4) {
	draw_sprite_ext(s_redStar, 0, x + left + h_i_offset * displayed_stars, y + v_offset, 1, 1, 0, c_white, flicker[floor(flicker_ticks) % flicker_length]);
}