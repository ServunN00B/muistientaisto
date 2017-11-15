//chancing turn
alarm_set(1,-1);
alarm_set(0,room_speed*objArenaController.preturnTimer); // Turn start timer
if (instance_exists(objAIdriver)) { objAIdriver.arenaAlarm0 = 1; }
if (objArenaController.isAttacking = 1){

	if (objArenaController.isTurn = 1){
		//show_debug_message("Player 1 turn....");
		/*objPL1Glow.visible = true;
		objPL2Glow.visible = false;*/
		if (!objPerSave.firstTurn) {
			objPerSave.p1Coin +=1;
			}
		objArenaController.isTurn = 2;
		
		if (objPerSave.AI){
			window_set_cursor(cr_none);
			instance_create_layer(1,1,layer_get_id("Instances"),objAIdriver);
		}
		if (instance_exists(objAIdriver)) {objAIdriver.arenaAlarm0 = 1;}
		
	} else {
		objPerSave.p2Coin +=1;
		objPerSave.firstTurn=false;
		objPerSave.isAttacking = 2;
		objPerSave.isTurn = 2; //Here goes animated battle scene
		if (instance_exists(objAIdriver)){instance_destroy(objAIdriver);}
		room_goto(2);
	}
} else {

	if (objArenaController.isTurn = 2){
		//show_debug_message("Player 2 turn....");
	/*	objPL1Glow.visible = false;
		objPL2Glow.visible = true;*/
		
		if (!objPerSave.firstTurn) {
			objPerSave.p2Coin +=1;
			}
		objArenaController.isTurn = 1;
		
		if (instance_exists(objAIdriver)){instance_destroy(objAIdriver);}
		if (objPerSave.AI){ 
			window_set_cursor(cr_none);
			instance_create_layer(1,1,layer_get_id("Instances"),objAIdriver);
		}
		if (instance_exists(objAIdriver)) {objAIdriver.arenaAlarm0 = 1;}
		
	} else {
		
		objPerSave.p1Coin +=1;
		objPerSave.firstTurn=false;
		objPerSave.isAttacking = 1;
		objPerSave.isTurn = 1; //Here goes animated battle scene
		if (instance_exists(objAIdriver)){instance_destroy(objAIdriver);}
		room_goto(2);
	}
}
//resetting table
instance_destroy(objNormalCard);
scrDealingCards();