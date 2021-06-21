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
		case "level 1":
			o_Main.level = "level 2";
			room_goto(r_Workshop);
			break;
		case "level 2":
			o_Main.level = "level 3";
			room_goto(r_Workshop);
			break;	
		case "level 3":
			o_Main.level = "level 4";
			room_goto(r_Workshop);
			break;
		case "level 4":
			o_Main.level = "cutscene 2";
			room_goto(r_Dialogue_3);
			break;
		case "level 5":
			o_Main.level = "cutscene 3";
			break;
	}

}