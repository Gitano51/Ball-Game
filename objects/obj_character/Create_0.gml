/// @description Character Parameters
character_ground_speed = 7;
character_air_speed = 4;
character_jump_force = 10;
character_gravity = 0.5;
character_max_fall_speed = 10;
character_angle_move = 12;
character_short_jump_multiplier = 0.45;

//Variables used to control
move_x = 0;
move_y = 0;
player_angle = 0;
was_before_in_ground = false;

//Variables used in gameplay imporvements
coyote_time_frames = 5;
buffer_jump_frames = 7;
head_bump_correction_pixels = 4;

current_coyote_time_frames = 0;
current_buffer_jump_frames = 0;

//Tilemap ids
my_tilemap = layer_tilemap_get_id("Tilesets");