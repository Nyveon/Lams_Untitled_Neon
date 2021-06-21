/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

draw_hotkey = function() {
	return;
}

button_action = function() {
	audio_play_sound(d_Tutorial_Success, 1, 0);
	
	show_debug_message(o_Main.level);
	switch (o_Main.level) {
		case "tutorial 5":
		case "tutorial 6":
			room_goto(r_Dialogue_1);
			break;
	}

}