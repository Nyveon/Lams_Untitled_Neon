/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hotkey = 2;

button_action = function() {
	audio_play_sound(d_Select, 4, 0);
	o_Hand.current_tool = 1;
}

glow_on_mouse = false;