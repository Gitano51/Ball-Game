/// @description Player Actions
var _key_move = obj_input_controller.is_action_right_checked - obj_input_controller.is_action_left_checked;
var _key_jump = obj_input_controller.is_action_up_pressed || obj_input_controller.is_action_jump_pressed;
var _key_jump_released = obj_input_controller.is_action_up_released || obj_input_controller.is_action_jump_released;

var _is_in_ground = place_meeting(x, y+1, my_tilemap);

if (_key_jump && current_buffer_jump_frames == 0)
    current_buffer_jump_frames = buffer_jump_frames;
if (!_is_in_ground && was_before_in_ground && move_y >= 0)
    current_coyote_time_frames = coyote_time_frames;

var _can_jump  = (_is_in_ground && current_buffer_jump_frames > 0)
              || (!_is_in_ground && current_coyote_time_frames > 0 && _key_jump);
var _is_free = !_is_in_ground && current_coyote_time_frames == 0;

var _hor_speed = _is_in_ground ? character_ground_speed : character_air_speed;
move_x = _hor_speed * _key_move;

move_y = _is_free ? min(move_y + character_gravity, character_max_fall_speed) : 0;

if (_can_jump) {
    move_y = -character_jump_force;
    current_buffer_jump_frames = 0;
    current_coyote_time_frames = 0;
}

if (_key_jump_released && move_y < 0)
    move_y *= character_short_jump_multiplier;

scr_move_entity();

player_angle -= _key_move * character_angle_move;

current_buffer_jump_frames = max(current_buffer_jump_frames - 1, 0);
current_coyote_time_frames = max(current_coyote_time_frames - 1, 0);
was_before_in_ground = _is_in_ground;