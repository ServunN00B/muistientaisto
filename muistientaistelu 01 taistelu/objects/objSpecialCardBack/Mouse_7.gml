/// @description Insert description here
// You can write your code in this editor
if (canClick) {
	if (!select) {
		var cardToNotUse;
		var vuorossa;
		var player;
		var playerCoin;
		var turnHolder;
		var sID = variable_instance_get(spCardFront, "sID");
		var myCoin = variable_instance_get(spCardFront, "myCoin");
		var sTYPE = variable_instance_get(spCardFront, "sTYPE");
		// Choosing players info by whos turn it is
		if (objPerSave.isTurn = 1) {
			vuorossa = objPerSave.dsP1SpecialCards;
			player = objArenaController.p1SpeCardUsed;
			playerCoin = objPerSave.p1Coin;
			turnHolder = objPL1CardHolder;
		} else {
			vuorossa = objPerSave.dsP2SpecialCards
			player = objArenaController.p2SpeCardUsed;
			playerCoin = objPerSave.p2Coin;
			turnHolder = objPL2CardHolder;
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
				var value = variable_instance_get(spCardFront, "sVALUE");
				// Check if player has enough coins for the card
				if (playerCoin >= value) {
					playerCoin = playerCoin - value;
					player = true;
					scrSpecialCards(sID);
					if (objPerSave.debugMod) {
						show_message("Tämän kortin sID on " + string(sID));
					}
					scrDealinSpecialCards(1, spCardFront);
					instance_destroy(myCoin);
					ds_list_delete(vuorossa, ds_list_find_index(vuorossa, sID))
					ds_list_add(vuorossa, sID);
				
					with(spCardFront) {
						event_user(0);
					}
					showDes = false;
					canClick = false;
					path2 = path_add();
					path_add_point(path2, x, y, 100);
		
					path_add_point(path2, turnHolder.x, turnHolder.y + 300, 100);
				
					path_set_closed(path2, false);
					path_start(path2, 100, path_action_stop, false);
					
				} //End of if player has coin
			} //End of if !player
		} //End of if not to use
	
		if (objPerSave.isTurn = 1) {
			objPerSave.dsP1SpecialCards = vuorossa;
			objArenaController.p1SpeCardUsed = player;
			objPerSave.p1Coin = playerCoin;
		} else {
			objPerSave.dsP2SpecialCards = vuorossa;
			objArenaController.p2SpeCardUsed = player;
			objPerSave.p2Coin = playerCoin;
		} // End of if isTurn
		
		if (objPerSave.debugMod) {
			show_message("Pelaajan " + string(objPerSave.isTurn) + " tiedot on tallennettu \n " +
			"onko pelaaja kayttanyt kortin " + string(player) + " (1 jos on, 0 jos ei) \n " +
			"mikä on käytetyn kortin id " + string(sID));
		} //End of if debugMod
	} //End of if !select
} //End of if canClick
