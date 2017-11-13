//chancing turn
alarm_set(1,-1);
alarm_set(0,room_speed*objArenaController.preturnTimer); // Turn start timer
if (instance_exists(objAIdriver)){instance_destroy(objAIdriver);}
if (objPerSave.isAttacking = 1){

	if (objPerSave.isTurn = 1){
		//show_debug_message("Player 1 turn....");
		objPL1Glow.visible = true;
		objPL2Glow.visible = false;
		if (!objPerSave.firstTurn) {
			objPerSave.p1Coin +=1;
			}
		objPerSave.isTurn = 2;
		
		if (instance_exists(objAIdriver)){instance_destroy(objAIdriver);}
		if (objPerSave.AI){
			instance_create_layer(1,1,layer_get_id("Instances"),objAIdriver);
		}
		if (instance_exists(objAIdriver)) {objAIdriver.arenaAlarm0 = 1;}
		
	} else {
		objPerSave.p2Coin +=1;
		objPerSave.firstTurn=false;
		objPerSave.isAttacking = 2; //Here goes animated battle scene
		if (instance_exists(objAIdriver)){instance_destroy(objAIdriver);}
		
		room_goto(0);
	}
} else {

	if (objPerSave.isTurn = 2){
		//show_debug_message("Player 2 turn....");
		objPL1Glow.visible = false;
		objPL2Glow.visible = true;
		
		if (!objPerSave.firstTurn) {
			objPerSave.p2Coin +=1;
			}
		objPerSave.isTurn = 1;
		
		if (instance_exists(objAIdriver)){instance_destroy(objAIdriver);}
		if (objPerSave.AI){
			instance_create_layer(1,1,layer_get_id("Instances"),objAIdriver);
		}
		if (instance_exists(objAIdriver)) {objAIdriver.arenaAlarm0 = 1;}
		
	} else {
		
		objPerSave.p1Coin +=1;
		objPerSave.firstTurn=false;
		objPerSave.isAttacking = 1;
		objPerSave.isTurn = 1; //Here goes animated battle scene
		if (instance_exists(objAIdriver)){instance_destroy(objAIdriver);}
		
		room_goto(0);
	}
}
//resetting table
instance_destroy(objNormalCard);
scrDealingCards();