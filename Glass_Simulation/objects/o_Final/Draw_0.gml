/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_middle);
draw_set_valign(fa_center);
draw_set_font(f_Silver15);
draw_text_color(room_width/2 + 1, 206 + 1, "The End.", c_black, c_black, c_black, c_black, image_alpha);
draw_text_color(room_width/2, 206, "The End.", c_white, c_white, c_white, c_white, image_alpha);

draw_set_halign(fa_middle);
draw_set_valign(fa_center);
draw_set_font(f_Silver14);

draw_text_color(room_width/2, 224, "Stars: " + string(o_Main.stars) + "/35", c_white, c_white, c_white, c_white, image_alpha);