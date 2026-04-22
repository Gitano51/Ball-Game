/// @description Draw Color on Top of Sprite
var _base_color = make_color_rgb(255, 0, 0);
var _outline_color = make_color_rgb(128, 0, 0);

draw_sprite_ext(spr_character, 0, x, y, 1, 1, player_angle, _base_color, 1);
draw_set_color(_outline_color);
draw_circle(x - 1, y - 1, sprite_width/2, sprite_height/2);