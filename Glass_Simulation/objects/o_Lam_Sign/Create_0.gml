/// @description Insert description here
// You can write your code in this editor
glowing = false;
flickering = true;
sign_sprite = s_cutscene1LamLightBacking;

if o_Main.level == "start" {
	alarm[0] = 240;
} else {
	alarm[0] = 10;
}


// half life flicker
flicker = [0.8, 0.8, 1, 0.8, 1, 0.8, 0.8, 0.8, 0.8, 1, 0.8, 0.8, 1, 0.8, 1, 0.8, 1, 1, 1, 0.8, 1, 0.8, 0.8, 0.8, 1];
flicker_length = array_length(flicker);
flicker_speed = 0.05;
flicker_ticks = random_range(0,60);