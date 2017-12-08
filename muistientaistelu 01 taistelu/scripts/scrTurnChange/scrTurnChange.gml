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

//Deal back found pairs & used special card
var scoreNum;
var vuorossaParit;
var vuorossaErikois;
var erikoisKayt;
var erikoisLista;
var onPareja = false;
if (objPerSave.isTurn = 1) {
	vuorossa = objPerSave.p2Score;
	vuorossaParit = objPL2CardHolder;
	if (!ds_list_empty(vuorossa)) {
		scoreNum = ds_list_size(vuorossa);
		onPareja = true;
	}
	erikoisKayt = objArenaController.p2SpeCardUsed;
	if (erikoisKayt) {
		erikoisLista = objPerSave.dsP2SpecialCards
		vuorossaErikois = objPerSave.p2SpecialEffect;
	}
} else {
	vuorossa = objPerSave.p1Score;
	vuorossaParit = objPL1CardHolder;
	if (!ds_list_empty(vuorossa)) {
		scoreNum = ds_list_size(vuorossa);
		onPareja = true;
	}
	erikoisKayt = objArenaController.p1SpeCardUsed;
	if (erikoisKayt) {
		erikoisLista = objPerSave.dsP1SpecialCards
		vuorossaErikois = objPerSave.p1SpecialEffect;
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

if (erikoisKayt) {
	var frontID = noone;
		with(instance_create_layer( vuorossaParit.x, vuorossaParit.y + 300, "Instances", objSpecialCard)) {
			sID = vuorossaErikois;
			if (objPerSave.debugMod) {
				show_message(string(sID));
			}
			sNAME = global.specialCardData[# sID, SpecialEnum.NAME];
			sVALUE = global.specialCardData[# sID, SpecialEnum.VALUE];
			sTYPE = global.specialCardData[# sID, SpecialEnum.TYPE];
			sPRIORITY = global.specialCardData[# sID, SpecialEnum.PRIORITY];
			sSPRITE = global.specialCardData[# sID, SpecialEnum.SPRITE];
			sTEXT = global.specialCardData[# sID, SpecialEnum.TEXT];
			spCardBack = noone;
			//Finding the right index for sprite!
			if (objPerSave.debugMod) {
				show_message(sSPRITE);
			}
			sprite_index = asset_get_index(sSPRITE);
			image_xscale = 0.2;
			image_yscale = 0.2;
			OrigScale = 0.2;
			frontID = self.id;
		}
			
		//Creating cardback
		with(instance_create_layer( vuorossaParit.x, vuorossaParit.y + 300, "Instances", objSpecialCardBack)){
			switch(string(global.specialCardData[# vuorossaErikois, SpecialEnum.TYPE])) {
				case "offensive":
					sprite_index = sprOffensive;
					break;
		
				case "defensive":
					sprite_index = sprDefence;
					break;

				case "neutral":
					sprite_index = sprNeutral;
					break;
			}
			select = false;
			image_xscale = 0.2;
			image_yscale = 0.2;
			OrigScale = 0.2;
			spCardFront = frontID;
			variable_instance_set(frontID,"spCardBack",self.id);
			canClick = false;
		}	
}
scrDealingCards();