/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

button_action = function() {
	audio_play_sound(d_Credits, 2, 0);
	room_goto(r_Credits);
}