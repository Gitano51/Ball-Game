/// @description Camera Behaviour
if (instance_exists(obj_character)) {
    var _char_pos_x = obj_character.x;
    var _char_pos_y = obj_character.y;
    
    var _char_movement_x = sign(obj_character.move_x);
    var _char_movement_y = sign(obj_character.move_y);
    
    last_camera_direction_x = _char_movement_x != 0 ? _char_movement_x : last_camera_direction_x;
    last_camera_direction_y = _char_movement_y != 0 ? _char_movement_y : last_camera_direction_y;
    
    var _target_offset_x = last_camera_direction_x * camera_xoffset;
    var _target_offset_y = last_camera_direction_y * camera_yoffset;
    current_offset_x = lerp(current_offset_x, _target_offset_x, camera_offset_lerp_speed);
    current_offset_y = lerp(current_offset_y, _target_offset_y, camera_offset_lerp_speed);
    
    var _pos_x = _char_pos_x + current_offset_x;
    var _pos_y = _char_pos_y + current_offset_y;
    
    if (distance_to_point(_pos_x, _pos_y) > camera_speed * 2)
        move_towards_point(_pos_x, _pos_y, camera_speed);
    else {
        x = _pos_x;
        y = _pos_y;
    }
    
    x = floor(x);
    y = floor(y);
}

