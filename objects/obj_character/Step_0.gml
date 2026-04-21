/// @description Player Actions
// You can write your code in this editor

var _key_move = keyboard_check(vk_right) - keyboard_check(vk_left);
var _key_jump = keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_space)

var _is_in_ground = place_meeting(x, y+1, my_tilemap)

var _hor_speed = _is_in_ground ? character_ground_speed : character_air_speed
var _ver_speed = !_is_in_ground ? min(move_y + character_gravity, character_max_fall_speed) : 0
_ver_speed = _is_in_ground && _key_jump ? -character_jump_force : _ver_speed

move_x = _hor_speed * _key_move
move_y = _ver_speed

//var _visual_angle = image_angle
//image_angle = 0
scr_move_entity()
player_angle -= _key_move * character_angle_move
//image_angle = _visual_angle

//image_angle -= _key_move * character_angle_move