//Checking that special card deck is in right order
var vuorossa;
if (objPerSave.isTurn = 1) {vuorossa = objPerSave.dsP1SpecialCards; } else {vuorossa = objPerSave.dsP2SpecialCards; }
		
for (var k = 0; k < instance_number(objSpecialCard); k +=1) {
	var spotti = variable_instance_get(instance_find(objSpecialCard,k), "spot");
	var arvos = variable_instance_get(instance_find(objSpecialCard,k), "sID");
	var orig_arvo = ds_list_find_value(vuorossa, spotti);
	ds_list_replace(vuorossa,spotti,arvos);
	
}

//chancing turn
alarm_set(1,-1);
alarm_set(0,room_speed*objArenaController.preturnTimer); // Turn start timer
if (instance_exists(objAIdriver)) { objAIdriver.arenaAlarm0 = 1; }


if (objPerSave.isAttacking = 1){

	if (objPerSave.isTurn = 1){
		
		objPL1Glow.visible = true;
		objPL2Glow.visible = false;
		if (!objPerSave.firstTurn) {
			objPerSave.p1Coin +=1;
			}
		
		objPerSave.isTurn = 2;
		
		if (objPerSave.AI){
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
		
		objPL1Glow.visible = false;
		objPL2Glow.visible = true;
		
		if (!objPerSave.firstTurn) {
			objPerSave.p2Coin +=1;
			}
		objPerSave.isTurn = 1;
		
		if (instance_exists(objAIdriver)){instance_destroy(objAIdriver);}
		
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

//Deal back pairs
var scoreNum;
var vuorossaParit;
var onPareja = false;
if (objPerSave.isTurn = 1) {
	vuorossa = objPerSave.p2Score;
	if (!ds_list_empty(vuorossa)) {
		scoreNum = ds_list_size(vuorossa);
		vuorossaParit = objPL2CardHolder;
		onPareja = true;
	}
} else {
	vuorossa = objPerSave.p1Score;
	if (!ds_list_empty(vuorossa)) {
		scoreNum = ds_list_size(vuorossa);
		vuorossaParit = objPL1CardHolder;
		onPareja = true;
	}
}

if (onPareja) {
	//Going through pairs
	for (var i = 0; i < scoreNum; i += 1) {
		var pla = floor(i/3);
		if (i<3){
			var fixi = i;
		} else {
			var fixi = i - 3;
		}
		with(instance_create_layer(vuorossaParit.x + fixi * 100, vuorossaParit.y+(150*pla), layer_get_id("Instances"), objNormalCard)) {
				if (objPerSave.isAttacking != objPerSave.isTurn) {
					//Attacking turn
					switch(ds_list_find_value(vuorossa,i)){
						case 0:
							// Miss, "rock", "banana", "beer"
							var rand = floor(random_range(1,3));
							if (rand = 1) {	sprite_index = spriteStone; } else { sprite_index = sprBanana;}
							cardValue = "0";
							break;
						case 1:
							// Knife
							sprite_index = sprKnife;
							cardValue = "1";
							break;
						case 2:
							// Sword
							sprite_index = sprMace;
							cardValue = "2";
							break;
						case 3:
							// Mace
							sprite_index = sprSword;
							cardValue = "3";
							break;
					} // End of switch case
				} else {
					//Defensive turn
					switch(ds_list_find_value(vuorossa,i)){
						case 0:
							// Miss, "rock", "banana", "beer"
							var rand = floor(random_range(1,3));
							if (rand = 1) {	sprite_index = spriteStone; } else { sprite_index = sprBanana;}
							cardValue = "0";
							break;
						case 1:
							// Knife
							sprite_index = sprBark;
							cardValue = "1";
							break;
						case 2:
							// Sword
							sprite_index = sprStool;
							cardValue = "2";
							break;
						case 3:
							// Mace
							sprite_index = sprShield;
							cardValue = "3";
							break;
					}
				}
		}
	}
}
scrDealingCards();