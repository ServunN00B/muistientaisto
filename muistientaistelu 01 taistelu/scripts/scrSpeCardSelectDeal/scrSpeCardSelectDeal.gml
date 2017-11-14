var a = objSpeCardSelectionHolder.x;
var b = objSpeCardSelectionHolder.y;
var c = 6; //Cards on a row
var f = 20; //padding
var g = 101; //Sprite width
var h = 147; //Sprite height

//Choosing right deck for player
var vuorossa;
if (objArenaController.ChoosingPlayer = 1) {vuorossa = objPerSave.dsP1SpecialCardsAvailable; } else {vuorossa = objPerSave.dsP2SpecialCardsAvailable}

//Darkening background
instance_create_layer(0,0, layer_get_id("Instances"), objBlock);
//
//Creating cards in the begining of the turn
for (j=0; j <ds_list_size(vuorossa); j+=1) {
	var d = j%c; // Number on a row
	var e = floor(j/c)%c; //Row number
	
	//Creating cardback
	with(instance_create_layer(a+d*(g + f),b+e*(h+f), layer_get_id("Instances"), objSpecialCardBack)){
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
		select = true;
		image_xscale = 0.2;
		image_yscale = 0.2;
	}
	// Creating card front
	with(instance_create_layer(a+d*(g + f),b+e*(h+f), layer_get_id("Instances"), objSpeCardSelect)) {
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
		image_xscale = 0.2;
		image_yscale = 0.2;
	}
	
}
var Be = floor(ds_list_size(vuorossa)/c)%c;
var Bx = (a+c*(g + f))/2;
var By = (b+Be*(h+f))+10;

with(instance_create_layer(Bx, By, layer_get_id("Instances"), objSpeCardDone)) {
		image_xscale = 0.2;
		image_yscale = 0.2;
}
	