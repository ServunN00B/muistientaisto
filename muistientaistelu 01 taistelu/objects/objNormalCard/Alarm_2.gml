/// @description Insert description here
// You can write your code in this editor

switch(objPerSave.isTurn) {
	case 1:
		
		if(objNormalCard.pairs > 3) {depth = -10;
			path2 = path_add();
			path_add_point(path2, x, y, 100);
		
			path_add_point(path2, (objPL1CardHolder.x + (objNormalCard.pairs-4) * 100), objPL1CardHolder.y+150, 100);
		
				//path_add_point(path2, objPL1CardHolder.x+(objNormalCard.pairs-1)*100, objPL1CardHolder.y, 100);
			// path_end();
			//path_insert_point(path2, 0, objPL1CardHolder.x+(objNormalCard.pairs-1)*100, objPL1CardHolder.y, 100);
			path_set_closed(path2, false);
			path_start(path2, 100, path_action_stop, false);
		
			with(objArenaController.instID){depth = -10;
				path2 = path_add();
				path_add_point(path2, x, y, 100);
				path_add_point(path2,(objPL1CardHolder.x+(objNormalCard.pairs-4)*100), objPL1CardHolder.y+150, 100);
			
				path_set_closed(path2, false);
				path_start(path2, 100, path_action_stop, false);
			}
		} else {depth = -10;
		path2 = path_add();
		path_add_point(path2, x, y, 100);
		
		path_add_point(path2, (objPL1CardHolder.x + (objNormalCard.pairs-1) * 100), objPL1CardHolder.y, 100);
		
			//path_add_point(path2, objPL1CardHolder.x+(objNormalCard.pairs-1)*100, objPL1CardHolder.y, 100);
		// path_end();
		//path_insert_point(path2, 0, objPL1CardHolder.x+(objNormalCard.pairs-1)*100, objPL1CardHolder.y, 100);
		path_set_closed(path2, false);
		path_start(path2, 100, path_action_stop, false);
		
			with(objArenaController.instID){
				depth = -10;
				path2 = path_add();
				path_add_point(path2, x, y, 100);
				path_add_point(path2,(objPL1CardHolder.x+(objNormalCard.pairs-1)*100), objPL1CardHolder.y, 100);
			
				path_set_closed(path2, false);
				path_start(path2, 100, path_action_stop, false);
			}
		}
		
		
		break;
	case 2:
		
		if(objNormalCard.pairs > 3) {
			depth = -10;
			path2 = path_add();
			path_add_point(path2, x, y, 100);
		
			path_add_point(path2, (objPL2CardHolder.x + (objNormalCard.pairs-4) * 100), objPL2CardHolder.y+150, 100);
		
				//path_add_point(path2, objPL1CardHolder.x+(objNormalCard.pairs-1)*100, objPL1CardHolder.y, 100);
			// path_end();
			//path_insert_point(path2, 0, objPL1CardHolder.x+(objNormalCard.pairs-1)*100, objPL1CardHolder.y, 100);
			path_set_closed(path2, false);
			path_start(path2, 100, path_action_stop, false);
		
			with(objArenaController.instID){
				depth = -10;
				path2 = path_add();
				path_add_point(path2, x, y, 100);
				path_add_point(path2,(objPL2CardHolder.x+(objNormalCard.pairs-4)*100), objPL2CardHolder.y+150, 100);
			
				path_set_closed(path2, false);
				path_start(path2, 100, path_action_stop, false);
			}
		} else {
		depth = -10;
		path2 = path_add();
		path_add_point(path2, x, y, 100);
		
		path_add_point(path2, (objPL2CardHolder.x + (objNormalCard.pairs-1) * 100), objPL2CardHolder.y, 100);
		
			//path_add_point(path2, objPL1CardHolder.x+(objNormalCard.pairs-1)*100, objPL1CardHolder.y, 100);
		// path_end();
		//path_insert_point(path2, 0, objPL1CardHolder.x+(objNormalCard.pairs-1)*100, objPL1CardHolder.y, 100);
		path_set_closed(path2, false);
		path_start(path2, 100, path_action_stop, false);
		
		with(objArenaController.instID){depth = -10;
			path2 = path_add();
			path_add_point(path2, x, y, 100);
			path_add_point(path2,(objPL2CardHolder.x+(objNormalCard.pairs-1)*100), objPL2CardHolder.y, 100);
			
			path_set_closed(path2, false);
			path_start(path2, 100, path_action_stop, false);
		}
		
		}
		break;
	default:
		break;
}
