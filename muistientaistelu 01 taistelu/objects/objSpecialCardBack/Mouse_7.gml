/// @description Insert description here
// You can write your code in this editor
if (!select) {
	var vuorossa;
	var player;
	var playerCoin;
	var sID = variable_instance_get(spCardFront, "sID");
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
	
	// Checks if the player has used a special card on this turn
	if(!player) {
/*		var value = variable_instance_get(spCardFront, "sVALUE");
		// Check if player has enough coins for the card
		if (playerCoin >= value) {
			player = true;
			playerCoin = playerCoin - value;
*/			scrSpecialCards(sID);
			show_message("Tämän kortin sID on " + string(sID));
			scrDealinSpecialCards(1, spCardFront);
	
			ds_list_delete(vuorossa, ds_list_find_index(vuorossa, sID))
			ds_list_add(vuorossa, sID);
			instance_destroy(spCardFront);
			instance_destroy(self.id);
//		}
	}
}