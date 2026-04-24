function scr_move_entity() {
	
	//Applying horizontal movement
    var _steps_x = abs(move_x);
    var _dir_x = sign(move_x);
	var _slope_steps = 0;
    
    for(var _i = 0; _i < _steps_x; _i+=1) {
		
		//Slope checking
	    if (place_meeting(x + _dir_x, y ,base_tilemap) && !place_meeting(x + _dir_x, y - 1, base_tilemap)) {
	        y -= 1;
			_slope_steps++;
		}
	    if (!place_meeting(x + _dir_x, y, base_tilemap) 
			&& !place_meeting(x + _dir_x, y + 1, base_tilemap) 
			&& place_meeting(x + _dir_x, y + 2, base_tilemap))
	        y += 1;
			
		//Moving horizontal
	    if(!place_meeting(x+ _dir_x, y, base_tilemap))
	        x += _dir_x;  
	    else {
	        move_x = 0;
	        break;
		}
		
		//Pixel fix when is on slope
		if (_slope_steps > 0) {
            _slope_steps--;
            _steps_x--;
        }
	}

	//Apply vertical movement
    var _steps_y = abs(move_y);
    var _dir_y = sign(move_y);
    
    for (var _i = 0; _i < _steps_y; _i++) {
		
		//Position fix on semi solid
		if (_dir_y > 0) {
	        var _olist = ds_list_create();
	        var _osize = instance_place_list(x, y + _dir_y, obj_semisolid_mask, _olist, false);
	        var _hit = noone;
        
	        for (var _oi = 0; _oi < _osize; _oi++) {
	            var _oinst = _olist[| _oi];
	            if (bbox_bottom <= _oinst.bbox_top) {
	                _hit = _oinst;
	                break;
	            }
	        }
	        ds_list_destroy(_olist);
        
	        if (_hit != noone) {
	            y = _hit.bbox_top - (bbox_bottom - y);
	            move_y = 0;
	            break;
	        }
	    }
		
		//Apply vertical movement
        if (!place_meeting(x, y + _dir_y, base_tilemap)) {
            y += _dir_y;
		} 
		else {
            if (_dir_y == -1) {				
				//Apply head bump fix
	            var _corrected = false;
	            for (var _offset = 1; _offset <= head_bump_correction_pixels; _offset++) {
	                if (!place_meeting(x + _offset, y + _dir_y, base_tilemap)) {
	                    x += _offset;
	                    y += _dir_y;
	                    _corrected = true;
	                    break;
	                }
	                if (!place_meeting(x - _offset, y + _dir_y, base_tilemap)) {
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
            } 
			else {
                move_y = 0;
                break;
            }
        }
    }
}