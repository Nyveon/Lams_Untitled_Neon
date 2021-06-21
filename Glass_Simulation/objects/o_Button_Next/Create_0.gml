/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

draw_hotkey = function() {
	return;
}

button_action = function() {
	audio_play_sound(d_Tutorial_Success, 1, 0);
	
	switch (o_Main.level) {
		case "tutorial 5":
			room_goto(r_Dialogue_1);
			break;
	}

}