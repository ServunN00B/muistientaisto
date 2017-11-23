//Checking that special card deck is in right order
var vuorossa;
if (objPerSave.isTurn = 1) {vuorossa = objPerSave.dsP1SpecialCards; } else {vuorossa = objPerSave.dsP2SpecialCards; }
		
for (var k = 0; k < instance_number(objSpecialCard); k +=1) {
	var spotti = variable_instance_get(instance_find(objSpecialCard,k), "spot");
	var arvos = variable_instance_get(instance_find(objSpecialCard,k), "sID");
	var orig_arvo = ds_list_find_value(vuorossa, spotti);
	//show_message("Korvattiin arvo " + string(orig_arvo) + " paikassa " + string(spotti) + " arvolla " + string(arvos));
	ds_list_replace(vuorossa,spotti,arvos);
	
}

//chancing turn
alarm_set(1,-1);
alarm_set(0,room_speed*objArenaController.preturnTimer); // Turn start timer
if (instance_exists(objAIdriver)) { objAIdriver.arenaAlarm0 = 1; }


if (objPerSave.isAttacking = 1){

	if (objPerSave.isTurn = 1){
		//show_debug_message("Player 1 turn....");
		objPL1Glow.visible = true;
		objPL2Glow.visible = false;
		if (!objPerSave.firstTurn) {
			objPerSave.p1Coin +=1;
			}
		
		objPerSave.isTurn = 2;
		
		if (objPerSave.AI){
			window_set_cursor(cr_none);
			instance_create_layer(1,1,layer_get_id("Instances"),objAIdriver);
		}
		if (instance_exists(objAIdriver)) {objAIdriver.arenaAlarm0 = 1;}
		
	} else {
		objPerSave.p2Coin +=1;
		objPerSave.firstTurn=false;
		//Here goes animated battle scene
		if (instance_exists(objAIdriver)){instance_destroy(objAIdriver);}
		room_goto(2);
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
		/*
		if (objPerSave.AI){ 
			window_set_cursor(cr_none);
			instance_create_layer(1,1,layer_get_id("Instances"),objAIdriver);
		}
		if (instance_exists(objAIdriver)) {objAIdriver.arenaAlarm0 = 1;}
		*/
	} else {
		
		objPerSave.p1Coin +=1;
		objPerSave.firstTurn=false;
		//Here goes animated battle scene
		if (instance_exists(objAIdriver)){instance_destroy(objAIdriver);}
		room_goto(2);
	}
}
//resetting table
instance_destroy(objNormalCard);
instance_destroy(objSpecialCard);
instance_destroy(objSpecialCardBack);
scrDealingCards();