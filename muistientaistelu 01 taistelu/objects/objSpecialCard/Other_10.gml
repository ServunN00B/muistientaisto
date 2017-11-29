/// @description Path to greatness..
var turnHolder;
		
if (objPerSave.isTurn = 1) {
		turnHolder = objPL1CardHolder;
	} else {
		turnHolder = objPL2CardHolder
	}
	
path2 = path_add();
path_add_point(path2, x, y, 100);
path_add_point(path2, turnHolder.x, turnHolder.y + 300, 100);
path_set_closed(path2, false);
path_start(path2, 100, path_action_stop, false);
				