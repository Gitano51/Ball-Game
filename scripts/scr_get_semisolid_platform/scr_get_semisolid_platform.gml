function scr_get_semisolid_platform() {
    var _olist = ds_list_create();
    var _osize = instance_place_list(x, y + 1, obj_semisolid_mask, _olist, false);
    
    for (var _oi = 0; _oi < _osize; _oi++) {
        var _oinst = _olist[| _oi];
        if (floor(bbox_bottom) <= ceil(_oinst.bbox_top)) {
            ds_list_destroy(_olist);
            return _oinst;
        }
    }
    
    ds_list_destroy(_olist);
    return noone;
}