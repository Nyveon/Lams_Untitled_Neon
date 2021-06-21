if fade_direction {
	image_alpha = max(image_alpha - fade_rate, 0);

	if image_alpha == 0 {
		target_action_b();
		instance_destroy();
	}
} else {
	image_alpha = min(image_alpha + fade_rate, 1);

	if image_alpha == 1 {
		fade_direction = true;
		target_action_a();
	}
}

