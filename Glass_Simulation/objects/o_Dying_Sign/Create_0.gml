/// @description Insert description here
// You can write your code in this editor
glowing = true;
flickering = false;
sign_sprite = s_None_Pixel;

// half life flicker
flicker = [0.5, 0.5, 1, 0.5, 1, 0.5, 0.5, 0.5, 0.5, 1, 0.5, 0.5, 1, 0.5, 1, 0.5, 1, 1, 1, 0.5, 1, 0.5, 0.5, 0.5, 1];
flicker_length = array_length(flicker);
flicker_speed = 0.2;
flicker_ticks = random_range(0,60);