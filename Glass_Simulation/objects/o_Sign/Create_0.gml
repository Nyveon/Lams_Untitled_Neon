/// @description Insert description here
// You can write your code in this editor
glowing = true;
flickering = true;
sign_sprite = s_cutscene1LamLightBacking;


// half life flicker
flicker = [0.8, 0.8, 1, 0.8, 1, 0.8, 0.8, 0.8, 0.8, 1, 0.8, 0.8, 1, 0.8, 1, 0.8, 1, 1, 1, 0.8, 1, 0.8, 0.8, 0.8, 1];
flicker_length = array_length(flicker);
flicker_speed = 0.05;
flicker_ticks = random_range(0,60);