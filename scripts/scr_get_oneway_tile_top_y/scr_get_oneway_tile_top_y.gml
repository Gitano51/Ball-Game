function scr_get_oneway_tile_top_y(_world_y) {
    var _cell_height = tilemap_get_tile_height(my_tilemap);
    return floor(_world_y / _cell_height) * _cell_height;
}