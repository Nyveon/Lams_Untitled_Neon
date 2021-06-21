/// @description Insert description here
// You can write your code in this editor

//--------Dialogue Stuff
reset_dialogue_defaults();
myPortrait			= s_YSY_Portrait;
//myVoice				= [d_Girl_1, d_Girl_2, d_Girl_3, d_Girl_4];
myVoice = [d_Woman_7]; // Younger
//myVoice = [d_Woman_6]; // Older
myName				= "Siu-Ying";
myColour = make_colour_rgb(31, 187, 210);

// Grow a bit
if o_Main.level == "cutscene 1" {
	sprite_index = s_olderSuYing;
}

// Emotions:
// 0 = very happy
// 1 = happy
// 2 = neutral
