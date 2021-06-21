// Visual parameters
x = room_width/2;
y = room_height/3;

var w = sprite_get_width(sprite_index)*0.8;
h_i_offset = w/4;
left = -w/2;
v_offset = -6;

//Calculate score in stars here:
// 0 score is impossible
score_p = o_Main.score_precision;
displayed_score_p = 0;
score_t = o_Main.score_time;
displayed_score_t = 0;
score_increment = 17;


// half life flicker
flicker = [0.5, 0.5, 1, 0.5, 1, 0.5, 0.5, 0.5, 0.5, 1, 0.5, 0.5, 1, 0.5, 1, 0.5, 1, 1, 1, 0.5, 1, 0.5, 0.5, 0.5, 1];
flicker_length = array_length(flicker);
flicker_speed = 0.2;
flicker_ticks = 0;

// debug settings

// Stars and star display
stars = floor((o_Main.score_precision_ratio)*6) //max(0,5-floor((score_p+0.1)/100)); 
//stars = 5; //debug stars
displayed_stars = 0;
star_time = 30;
star_time_increment = 1.5;
alarm[0] = star_time;
stars_displaying = true;

audio_play_sound(d_Star_1, 2, 1);