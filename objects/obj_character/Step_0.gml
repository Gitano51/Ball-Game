/// @description Player Actions
// You can write your code in this editor

var _key_move = keyboard_check(vk_right) - keyboard_check(vk_left);
var _key_jump = keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_space)
var _key_jump_released = keyboard_check_released(vk_up) || keyboard_check_released(vk_space)

var _is_in_ground = place_meeting(x, y+1, my_tilemap)

current_buffer_jump_frames = _key_jump && current_buffer_jump_frames == 0 ? buffer_jump_frames : current_buffer_jump_frames
current_coyote_time_frames = !_is_in_ground && was_before_in_ground && move_y >= 0 ? coyote_time_frames : current_coyote_time_frames

var _is_going_to_fall = !_is_in_ground && current_coyote_time_frames == 0
var _is_going_to_jump = (_is_in_ground && current_buffer_jump_frames > 0) || (!_is_in_ground && current_coyote_time_frames > 0 && _key_jump)

var _hor_speed = _is_in_ground ? character_ground_speed : character_air_speed
var _ver_speed = _is_going_to_fall ? min(move_y + character_gravity, character_max_fall_speed) : 0

if (_is_going_to_jump) {
	_ver_speed =  -character_jump_force
	current_buffer_jump_frames = 0;
	current_coyote_time_frames = 0;
}

_ver_speed *= _key_jump_released && _ver_speed < 0 ? character_short_jump_multiplier : 1

move_x = _hor_speed * _key_move
move_y = _ver_speed

scr_move_entity()
player_angle -= _key_move * character_angle_move

current_buffer_jump_frames = max(current_buffer_jump_frames - 1, 0)
current_coyote_time_frames = max(current_coyote_time_frames - 1, 0)
was_before_in_ground = _is_in_ground