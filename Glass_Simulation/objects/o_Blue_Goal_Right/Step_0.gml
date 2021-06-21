/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if o_Blue_Goal_Left.touching and touching {
	o_Fullness.fullness += 0.5; // both need to be touching
	if (!audio_is_playing(d_Gas)) {
		audio_play_sound(d_Gas, 1, 0);
	}
} else {
	audio_stop_sound(d_Gas);
}