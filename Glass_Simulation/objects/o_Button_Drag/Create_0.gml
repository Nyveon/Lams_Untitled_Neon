/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hotkey = 1;

button_action = function() {
	o_Hand.current_tool = 0;
	audio_play_sound(d_Select, 4, 0);
}

glow_on_mouse = false;