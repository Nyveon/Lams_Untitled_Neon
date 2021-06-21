old_done = done;
if fullness < 100 {
	fullness = max(fullness - decay, 0);	
	timer++;
} else {
	done = true;
	fullness = 100;
}

if (!old_done and done) {
	final_time = timer;
	audio_play_sound(d_Tutorial_Success, 1, 0);
	
	var instance = instance_create_layer(0, 0, "GUI", o_Fade_Out);
	instance.target_room = r_Score;
	instance.fade_rate = 0.04;
	
	var max_score = 18000; // 5 minutes
	var anti_time = max(1, max_score - timer)
	var ratio = (anti_time)/max_score;
	
	o_Main.score_precision = anti_time;
	o_Main.score_precision_ratio = ratio;
}