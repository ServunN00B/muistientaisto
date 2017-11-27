/// @description Insert description here
// You can write your code in this editor
if (!select) {
	var cardToNotUse;
	var vuorossa;
	var player;
	var playerCoin;
	var sID = variable_instance_get(spCardFront, "sID");
	var sTYPE = variable_instance_get(spCardFront, "sTYPE");
	// Choosing players info by whos turn it is
	if (objPerSave.isTurn = 1) {
		vuorossa = objPerSave.dsP1SpecialCards;
		player = objArenaController.p1SpeCardUsed;
		playerCoin = objPerSave.p1Coin;			
	} else {
		vuorossa = objPerSave.dsP2SpecialCards
		player = objArenaController.p2SpeCardUsed;
		playerCoin = objPerSave.p2Coin;
	}
	
	// Check if turn is Attacking and tell what card cannot be played
	if(objPerSave.isTurn = objPerSave.isAttacking) {
		cardToNotUse = "defensive";
	} else {
		cardToNotUse = "offensive";
	}
	//Check that card isn't Not to use card
	if (objPerSave.debugMod) { 
		show_message("Kortin tyyppi " + string(sTYPE) + " ja Not to use tyyppi " + string(cardToNotUse));
	}
	if (sTYPE != cardToNotUse) {
		// Checks if the player has used a special card on this turn
		if(!player) {
	/*		var value = variable_instance_get(spCardFront, "sVALUE");
			// Check if player has enough coins for the card
			if (playerCoin >= value) {
				playerCoin = playerCoin - value;
	*/			player = true;
				scrSpecialCards(sID);
				if (objPerSave.debugMod) {
					show_message("Tämän kortin sID on " + string(sID));
				}
				scrDealinSpecialCards(1, spCardFront);
	
				ds_list_delete(vuorossa, ds_list_find_index(vuorossa, sID))
				ds_list_add(vuorossa, sID);
				instance_destroy(spCardFront);
				instance_destroy(self.id);
	//		}
		}
	} //End of not to use if
	
	if (objPerSave.isTurn = 1) {
		objPerSave.dsP1SpecialCards = vuorossa;
		objArenaController.p1SpeCardUsed = player;
		objPerSave.p1Coin = playerCoin;
	} else {
		objPerSave.dsP2SpecialCards = vuorossa;
		objArenaController.p2SpeCardUsed = player;
		objPerSave.p2Coin = playerCoin;
	}
}