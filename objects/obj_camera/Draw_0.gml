/// @description Debugging camera
// You can write your code in this editor
var _view_xview = camera_get_view_x(view_camera[0])
var _view_yview = camera_get_view_y(view_camera[0])
draw_set_color(c_blue)
draw_text(_view_xview, _view_yview, x)
draw_text(_view_xview, _view_yview + 32, y)



