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
							sprite_index = sprSword;
							cardValue = "2";
							break;
						case 3:
							// Mace
							sprite_index = sprMace;
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