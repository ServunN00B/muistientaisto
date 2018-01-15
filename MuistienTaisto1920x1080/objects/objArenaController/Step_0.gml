/// @description Screen shake for bomb
// You can write your code in this editor
if (shake = true)
{
	var ran_x = random_range(-15,15);
	var ran_y = random_range(-15,15);
	camera_set_view_pos(view_camera[0],view_x + ran_x, view_y + ran_y);
	view_x = camera_get_view_x(view_camera[0]);
    view_y = camera_get_view_y(view_camera[0]);
}