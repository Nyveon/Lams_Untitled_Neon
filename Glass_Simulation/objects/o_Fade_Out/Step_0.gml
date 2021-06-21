image_alpha = min(image_alpha + fade_rate, 1);

if image_alpha == 1 {
	room_goto(target_room);
}
