image_alpha = max(image_alpha - fade_rate, 0);

if image_alpha == 0 {
	target_action();
	instance_destroy();
}
