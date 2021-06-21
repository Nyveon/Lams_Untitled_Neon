/// @description Increment star display.
// You can write your code in this editor
if !(stars <= 0) {
	stars--;
	displayed_stars++;
	star_time *= star_time_increment;
	
	alarm[0] = star_time;
	// Buzz sound
	audio_stop_sound(d_Star_1);
	audio_stop_sound(d_Star_2);
	audio_stop_sound(d_Star_3);
	audio_stop_sound(d_Star_4);
	audio_stop_sound(d_Star_5);
	switch (displayed_stars) {
		case 1:
			audio_play_sound(d_Chime_1, 2, 0);
			audio_play_sound(d_Star_2, 3, 1);
			break;
		case 2:
			audio_play_sound(d_Chime_2, 2, 0);
			audio_play_sound(d_Star_3, 3, 1);
			break;
		case 3:
			audio_play_sound(d_Chime_3, 2, 0);
			audio_play_sound(d_Star_4, 3, 1);
			break;
		case 4:
			audio_play_sound(d_Chime_4, 2, 0);
			audio_play_sound(d_Star_5, 3, 1);
			break;
		case 5:
			audio_play_sound(d_Chime_5, 2, 0);
			break;
	}
} else {
	audio_stop_sound(d_Star_1);
	audio_stop_sound(d_Star_2);
	audio_stop_sound(d_Star_3);
	audio_stop_sound(d_Star_4);
	audio_stop_sound(d_Star_5);
	stars_displaying = false;
}
