var a = objSpecialCardHolder.x;
var b = objSpecialCardHolder.y;
var c = 140; //Spire width
var f = 20; //padding
e = 0;
if (argument0 > 0) { e = variable_instance_get(argument1, "spot")} //
var vuorossa;
if (objPerSave.isTurn = 1) {vuorossa = objPerSave.dsP1SpecialCards; } else {vuorossa = objPerSave.dsP2SpecialCards}

switch(argument0) {
	//Creating cards in the begining of the turn
	case 0:
		for (j=0; j <3; j+=1) {
			with(instance_create_layer(a+j*(c + f),b, layer_get_id("Instances"), objSpecialCard)) {
				sID = ds_list_find_value(vuorossa,objArenaController.j);
				sNAME = global.specialCardData[# sID, SpecialEnum.NAME];
				sVALUE = global.specialCardData[# sID, SpecialEnum.VALUE];
				sTYPE = global.specialCardData[# sID, SpecialEnum.TYPE];
				sPRIORITY = global.specialCardData[# sID, SpecialEnum.PRIORITY];
				sSPRITE = global.specialCardData[# sID, SpecialEnum.SPRITE];
				sTEXT = global.specialCardData[# sID, SpecialEnum.TEXT];
				spot = objArenaController.j;
				//Finding the right index for sprite!
				sprite_index = asset_get_index(sSPRITE);
				show_message("ID: " + string(sID) + " Nimi: " + sNAME + " Kuva: " + sSPRITE + " jonka index on " + string(asset_get_index(sSPRITE)));
				image_xscale = 0.3;
				image_yscale = 0.3;
			}
		}
		break;
	
	//Creating new card in the place of old
	case 1:
		with(instance_create_layer(a+e*(c + f),b, layer_get_id("Instances"), objSpecialCard)) {
			spot = variable_instance_get(argument1, "spot");
			sID = ds_list_find_value(vuorossa,3);
			sNAME = global.specialCardData[# sID, SpecialEnum.NAME];
			sVALUE = global.specialCardData[# sID, SpecialEnum.VALUE];
			sTYPE = global.specialCardData[# sID, SpecialEnum.TYPE];
			sPRIORITY = global.specialCardData[# sID, SpecialEnum.PRIORITY];
			sSPRITE = global.specialCardData[# sID, SpecialEnum.SPRITE];
			sTEXT = global.specialCardData[# sID, SpecialEnum.TEXT];
			sprite_index = asset_get_index(sSPRITE);
			image_xscale = 0.3;
			image_yscale = 0.3;
		}
		break;
}
	