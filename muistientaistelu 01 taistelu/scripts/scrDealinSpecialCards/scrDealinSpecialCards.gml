var a = objSpecialCardHolder.x;
var b = objSpecialCardHolder.y;
var c = 152; //Sprite width
var f = 20; //padding
var e = 0;
if (argument0 > 0) { e = variable_instance_get(argument1, "spot")} //
var vuorossa;
var vuorossaHP;
if (objPerSave.isTurn = 1) {
	vuorossa = objPerSave.dsP1SpecialCards;
	vuorossaHP = objPerSave.p1Health;
} else {
	vuorossa = objPerSave.dsP2SpecialCards;
	vuorossaHP = objPerSave.p2Health;
}

switch(argument0) {
	//Creating cards in the begining of the turn
	case 0:
		for (j=0; j <3; j+=1) {
			var frontID = noone;
			var coinID = noone;
			var fvalue = noone;
			// Creating card front
			with(instance_create_depth(a+j*(c + f),b, -10, objSpecialCard)) {
				sID = ds_list_find_value(vuorossa,objArenaController.j);
				sNAME = global.specialCardData[# sID, SpecialEnum.NAME];
				sVALUE = global.specialCardData[# sID, SpecialEnum.VALUE];
				sTYPE = global.specialCardData[# sID, SpecialEnum.TYPE];
				sPRIORITY = global.specialCardData[# sID, SpecialEnum.PRIORITY];
				sSPRITE = global.specialCardData[# sID, SpecialEnum.SPRITE];
				sTEXT = global.specialCardData[# sID, SpecialEnum.TEXT];
				spot = objArenaController.j;
				spCardBack = noone;
				//Finding the right index for sprite!
				sprite_index = asset_get_index(sSPRITE);
				image_xscale = 0.3;
				image_yscale = 0.3;
				OrigScale = 0.3;
				frontID = self.id;
				fvalue = sVALUE;
				if (instance_exists(objAIdriver)) { ds_list_add(objAIdriver.speCardsOnTable,self.id); }
				if (instance_exists(objAIdriver)) { ds_list_add(objAIdriver.speValueOnTable,sPRIORITY); }
			}
			with(instance_create_depth(a+j*(c + f)+ frontID.sprite_width,b, -12, objCoin)) {
				image_xscale = 0.15;
				image_yscale = 0.15;
				self.x -= sprite_width;
				coinID = self.id;
				value = fvalue;
				variable_instance_set(frontID,"myCoin",self.id);
			}
			//Creating cardback
			with(instance_create_depth(a+j*(c + f),b, -8, objSpecialCardBack)){
				switch(string(global.specialCardData[# ds_list_find_value(vuorossa,objArenaController.j), SpecialEnum.TYPE])) {
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
				image_xscale = 0.3;
				image_yscale = 0.3;
				OrigScale = 0.3;
				spCardFront = frontID;
				myCoin = coinID;
				variable_instance_set(frontID,"spCardBack",self.id);
			}
			if (objPerSave.debugMod) {
				show_message(string(variable_instance_get(frontID,"sID")));
			}
		}
		break;
	
	//Creating new card in the place of old
	case 1:
		//Creating card front
		var frontID = noone;
		var coinID = noone;
		with(instance_create_depth(a+e*(c + f),b, -10, objSpecialCard)) {
			sID = ds_list_find_value(vuorossa,3);
			//Check to see if there is a BOMB
			if (sID < 0) {
				vuorossaHP = vuorossaHP + sID;
				with(objArenaController) {
					shake = true;
					alarm_set(3, 30);
				}
				
				if (vuorossaHP < 1) {
					show_message("Pakassasi oli POMMI! Pelaaja " + string(objPerSave.isTurn) + " kuoli!");
					room_goto(battle);
				}
				show_message("Pakassasi oli POMMI! Menetit " + string(sID) + "hp:tä");
				ds_list_delete(vuorossa, 3);
				sID = ds_list_find_value(vuorossa,3);
			}
			sNAME = global.specialCardData[# sID, SpecialEnum.NAME];
			sVALUE = global.specialCardData[# sID, SpecialEnum.VALUE];
			sTYPE = global.specialCardData[# sID, SpecialEnum.TYPE];
			sPRIORITY = global.specialCardData[# sID, SpecialEnum.PRIORITY];
			sSPRITE = global.specialCardData[# sID, SpecialEnum.SPRITE];
			sTEXT = global.specialCardData[# sID, SpecialEnum.TEXT];
			spot = e;
			spCardBack = noone;
			//Finding the right index for sprite!
			sprite_index = asset_get_index(sSPRITE);
			image_xscale = 0.3;
			image_yscale = 0.3;
			OrigScale = 0.3;
			frontID = self.id;
			fvalue = sVALUE;
		}
			with(instance_create_depth(a+e*(c + f)+ frontID.sprite_width,b, -12, objCoin)) {
				image_xscale = 0.15;
				image_yscale = 0.15;
				self.x -= sprite_width;
				coinID = self.id;
				value = fvalue;
				variable_instance_set(frontID,"myCoin",self.id);
			}
			
		//Creating cardback
		with(instance_create_depth(a+e*(c + f),b, -10, objSpecialCardBack)){
			switch(string(global.specialCardData[# ds_list_find_value(vuorossa,objArenaController.j), SpecialEnum.TYPE])) {
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
			image_xscale = 0.3;
			image_yscale = 0.3;
			OrigScale = 0.3;
			spCardFront = frontID;
			myCoin = coinID;
			variable_instance_set(frontID,"spCardBack",self.id);
		}
	break;
}

if (objPerSave.isTurn = 1) {
	objPerSave.p1Health = vuorossaHP;
} else {
	objPerSave.p2Health = vuorossaHP;
}