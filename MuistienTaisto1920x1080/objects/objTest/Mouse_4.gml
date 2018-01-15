/// @description Insert description here
// You can write your code in this editor

path2 = path_add();
path_add_point(path2, x, y, 100);
		
path_add_point(path2, x + 100, y + 100, 100);
path_set_closed(path2, false);

path_start(path2, 50, path_action_stop, 1);