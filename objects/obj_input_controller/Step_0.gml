/// @description Input control
is_action_right_checked = keyboard_check(action_right);
is_action_left_checked = keyboard_check(action_left);
is_action_up_checked = keyboard_check(action_up);
is_action_down_checked = keyboard_check(action_down);
is_action_jump_checked = keyboard_check(action_jump);

is_action_up_pressed = keyboard_check_pressed(action_up);
is_action_jump_pressed = keyboard_check_pressed(action_jump);
is_action_down_pressed = keyboard_check_pressed(action_down);

is_action_up_released = keyboard_check_released(action_up);
is_action_jump_released = keyboard_check_released(action_jump);

is_jump_pressed = is_action_up_pressed || is_action_jump_pressed;
is_jump_released = is_action_up_released || is_action_jump_released;