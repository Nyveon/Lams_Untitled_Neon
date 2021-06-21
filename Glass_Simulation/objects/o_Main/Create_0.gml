// Settings

// Score temp
score_precision = 0;
score_precision_ratio = 1;
score_time = 0;

level = "start"; // 0 is first level

tutorial_fade = 0.02;

leave_tutorial = function() {
	var fade = instance_create_layer(0, 0, "Text", o_Fade_In);
	fade.fade_rate = tutorial_fade;
	fade.target_action = function() {
		o_Young_YY.initiate_conversation();
	}	
}

// Letter patterns
letter_line = [[0,0],[1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0],[8,0],[9,0],[10,0],[11,0],[12,0],[13,0],[14,0],[15,0],[16,0],[17,0],[18,0],[19,0],[20,0],[21,0],[22,0],[23,0],[24,0],[25,0],[26,0],[27,0],[28,0],[29,0],[30,0],[31,0],[32,0],[33,0],[34,0],[35,0],[36,0],[37,0],[38,0],[39,0],[40,0],[41,0],[42,0],[43,0],[44,0],[45,0],[46,0],[47,0],[48,0],[49,0],[50,0],[51,0],[52,0],[53,0],[54,0]];

letter_rotate = [[0,0],[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7],[0,8],[0,9],[0,10],[0,11],[0,12],[0,13],[0,14],[0,15],[0,16],[0,17],[0,18],[0,19],[0,20],[0,21],[0,22],[0,23],[0,24],[0,25],[0,26],[0,27],[0,28],[0,29],[0,30],[0,31],[0,32],[0,33],[0,34],[0,35],[0,36],[0,37],[0,38],[0,39],[0,40],[0,41],[0,42],[0,43],[0,44],[0,45],[0,46],[0,47],[0,48],[0,49],[0,50],[0,51],[0,52],[0,53],[0,54]];

letter_bend = [[0,0],[1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0],[8,0],[9,0],[10,0],[11,0],[12,0],[13,0],[14,0],[15,0],[16,0],[17,0],[18,0],[19,0],[20,0],[21,0],[22,0],[23,0],[24,0],[25,0],[26,0],[27,0],[28,0],[29,0],[30,0],[31,0],[32,0],[33,0],[34,0],[35,0],[36,0],[37,0],[38,0],[39,0],[40,0],[41,0],[42,0],[43,0],[44,0],[45,0],[46,0],[47,0],[48,0],[49,0],[50,0],[51,0],[52,0],[53,0],[54,0],[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7],[0,8],[0,9],[0,10],[0,11],[0,12],[0,13],[0,14],[0,15],[0,16],[0,17],[0,18],[0,19],[0,20],[0,21],[0,22],[0,23],[0,24],[0,25],[0,26],[0,27],[0,28],[0,29],[0,30],[0,31],[0,32],[0,33],[0,34],[0,35],[0,36],[0,37],[0,38],[0,39],[0,40],[0,41],[0,42],[0,43],[0,44],[0,45],[0,46],[0,47],[0,48],[0,49],[0,50],[0,51],[0,52],[0,53],[0,54]];

letter_pull = [[0,0],[1,0],[54,0],[2,1],[3,1],[52,1],[53,1],[4,2],[5,2],[49,2],[50,2],[51,2],[6,3],[7,3],[47,3],[48,3],[8,4],[9,4],[45,4],[46,4],[10,5],[11,5],[12,5],[42,5],[43,5],[44,5],[13,6],[14,6],[40,6],[41,6],[15,7],[16,7],[17,7],[37,7],[38,7],[39,7],[18,8],[19,8],[20,8],[34,8],[35,8],[36,8],[21,9],[22,9],[23,9],[24,9],[25,9],[26,9],[27,9],[28,9],[29,9],[30,9],[31,9],[32,9],[33,9]];


tracks = [m_Title, m_Tutorial, m_Workshop, m_Neon_is_Dead, m_Epilogue];
play_track = function(m) {
	
	for (var j = 0; j < array_length(tracks); j++) {
		if (j != m) {
			audio_stop_sound(tracks[j]);
		}
	}
	
	if !audio_is_playing(tracks[m]) {
		audio_play_sound(tracks[m], 50, 1);
	}
}

