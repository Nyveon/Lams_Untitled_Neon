// Accelerate with gravity
speed_y = min(speed_y + gravity_y, terminal_velocity);

// Update position
y = clamp(y + speed_y, 60, 135);

// Kill speed
if (y == 135) {
	speed_y = 0;
}

