/// @description Camera parameters
// You can write your code in this editor
camera_xoffset = 120
camera_yoffset = 0
camera_speed = 20
last_camera_direction_x = 0
last_camera_direction_y = 0
current_offset_x = 0
current_offset_y = 0
camera_offset_lerp_speed = 0.05

if (instance_exists(obj_character)) {
    x = obj_character.x
    y = obj_character.y
}


