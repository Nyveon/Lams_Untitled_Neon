old_touching = touching;
touching = place_meeting(x, y, o_Redline);

if touching {
	image_alpha = 1;
} else {
	image_alpha = 0.2;
}

// Sounds
if (old_touching != touching) {
	audio_play_sound(d_Score_Ticker, 1, 0);
}
