/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


draw_hotkey = function() {
	return;
}

// Scoring screen
button_action = function() {
	// todo: Add are you sure button
	
	// Room 
	room_goto(r_Score);
	calculate_score();
}

