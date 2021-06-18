/// Get inputs

// Controls
action_pressed = mouse_check_button_pressed(mb_left);
action_released = mouse_check_button_released(mb_left);
action = mouse_check_button(mb_left);

alt_action_pressed = mouse_check_button_pressed(mb_right);
alt_action_released = mouse_check_button_released(mb_right);

rotation_direction = keyboard_check(ord("Q")) - keyboard_check(ord("E")); 
debug_heat_up = keyboard_check(ord("H"));