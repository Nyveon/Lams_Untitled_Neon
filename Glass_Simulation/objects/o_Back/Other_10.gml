/// @description Insert description here
// You can write your code in this editor

reset_dialogue_defaults();
/// Dialogue 1

// SY portrait
// 0 Sad
// 1 Angry
// 2 Neutral
// 3 Very happy
// 4 Happy

// YY portrait
// 0 neutral
// 1 angry
// 2 happy

if state == 0 {
	i = 0;
	line(o_SYEpilogue, "Yeye! Thanks for coming.");
	myEmotion[i] = 3;
	i++;

	line(id, "I wouldn't miss the grand opening of my granddaughter's business for the world.");
	myEmotion[i] = 2;
	i++;
	line(id, "I brought a |4gift|0 for you. Let me know what you think.");
	myEmotion[i] = 2;
	myScripts[i] = [epilogue, 0];
	i++;

	line(o_SYEpilogue, ". . .");
	myEmotion[i] = 3;
	i++;
	line(o_SYEpilogue, "This is perfect. Let's put it up tonight for the grand opening.");
	myEmotion[i] = 3;
	myScripts[i] = [epilogue, 1];
	i++;
} else if state == 1 {
	
	
}
