/// @description Entity Parameters
character_ground_speed = 0;
character_air_speed = 0;
character_jump_force = 0;
character_gravity = 0;
character_max_fall_speed = 0;
character_angle_move = 0;
character_short_jump_multiplier = 0;

//Variables used to control
move_x = 0;
move_y = 0;

//Other variables
head_bump_correction_pixels = 0;

//Tilemap ids
my_tilemap = layer_tilemap_get_id("Tilesets");
oneway_tile_index = 4; //OJO: ESTO PUEDE SER QUE SEA MODIFICABLE SEGUN TILE