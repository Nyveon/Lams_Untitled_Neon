/// @description Increment star display.
// You can write your code in this editor
if !(stars <= 0) {
	stars--;
	displayed_stars++;
	star_time *= star_time_increment;
	
	alarm[0] = star_time;
} else {
	stars_displaying = false;
}
