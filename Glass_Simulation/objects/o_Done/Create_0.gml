/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


draw_hotkey = function() {
	return;
}

// Scoring screen
button_action = function() {
	// Add are you sure button
	
	// Room L
	if (room == r_M_1_L) {
		room_goto(r_Scoring_Screen);
		calculate_score();
	}
	
}

