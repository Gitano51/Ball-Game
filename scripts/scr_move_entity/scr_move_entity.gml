function scr_move_entity() {
    var _steps_x = abs(move_x);
    var _dir_x = sign(move_x);
	var _slope_steps = 0;
    
    for(var _i = 0; _i < _steps_x; _i+=1) {
	    if (place_meeting(x + _dir_x, y ,my_tilemap) && !place_meeting(x + _dir_x, y - 1, my_tilemap)) {
	        y -= 1;
			_slope_steps++;
		}
	    if (!place_meeting(x + _dir_x, y, my_tilemap) 
			&& !place_meeting(x + _dir_x, y + 1, my_tilemap) 
			&& place_meeting(x + _dir_x, y + 2, my_tilemap))
	        y += 1;
	    if(!place_meeting(x+ _dir_x, y, my_tilemap))
	        x += _dir_x;  
	    else{
	        move_x = 0;
	        break;
		}
		
		if (_slope_steps > 0) {
            _slope_steps--;
            _steps_x--;
        }
	}

    var _steps_y = abs(move_y);
    var _dir_y = sign(move_y);
    
    for (var _i = 0; _i < _steps_y; _i++) {
        if (!place_meeting(x, y + _dir_y, my_tilemap))
            y += _dir_y;
        else {
            if (_dir_y == -1) {
                var _corrected = false;
                for (var _offset = 1; _offset <= head_bump_correction_pixels; _offset++) {
                    if (!place_meeting(x + _offset, y + _dir_y, my_tilemap)) {
                        x += _offset;
                        y += _dir_y;
                        _corrected = true;
                        break;
                    }
                    if (!place_meeting(x - _offset, y + _dir_y, my_tilemap)) {
                        x -= _offset;
                        y += _dir_y;
                        _corrected = true;
                        break;
                    }
                }
                if (!_corrected) {
                    move_y = 0;
                    break;
                }
            } else {
                move_y = 0;
                break;
            }
        }
    }
}