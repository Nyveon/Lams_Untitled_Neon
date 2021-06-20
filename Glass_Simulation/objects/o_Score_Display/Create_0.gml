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
score_t = o_Main.score_time;


// half life flicker
flicker = [0.5, 0.5, 1, 0.5, 1, 0.5, 0.5, 0.5, 0.5, 1, 0.5, 0.5, 1, 0.5, 1, 0.5, 1, 1, 1, 0.5, 1, 0.5, 0.5, 0.5, 1];
flicker_length = array_length_1d(flicker);
flicker_speed = 0.2;
flicker_ticks = 0;

// debug settings
// time = 0

// p < 50
// 50 < p < 100
// 100 < p < 200
// 200 < p < 400
// 400 < p < 800
// 800 < p

// Stars and star display
stars = floor((o_Main.score_precision_ratio)*6) //max(0,5-floor((score_p+0.1)/100)); 
stars = 4;
displayed_stars = 0;
star_time = 30;
star_time_increment = 1.5;
alarm[0] = star_time;
stars_displaying = true;