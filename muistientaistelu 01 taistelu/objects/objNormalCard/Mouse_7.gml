/// @description Everything that happens to normal cards
if (!self.found) {
if (!self.turned) {
	if (objArenaController.canTurn) {

		self.turned = true;
		ds_list_add(testiNappi1.cardDebug, self.cardValue);
		if (objNormalCard.clicks = 0 && self.cardValue = "0") {
			//sprite_index = sprTurnAnim;
			//alarm_set(1, 15);
			sprite_index = self.varSprite;
			objArenaController.instID = 0;
			objArenaController.canTurn = false;
			self.turned = false;
			alarm_set(0,objArenaController.flipTimer);
		} else {
			objNormalCard.clicks += 1;
			if (clicks = 1) {
				objArenaController.isPair = self.cardValue;
				objArenaController.instID = id;
			}
			// Changing sprite
			if (self.varSprite) {
				sprite_index = self.varSprite;
				//sprite_index = sprTurnAnim;
				//alarm_set(1, 15);
				//alarm_set(0, 15);
				// Turning cards back
				if (objNormalCard.clicks > 1) {
				
					// Incase of a pair, do not turn back
					if(self.cardValue = objArenaController.isPair) {
						objNormalCard.pairs +=1;
						self.found = true;
						variable_instance_set(objArenaController.instID,"found",true);
						if (instance_exists(objAIdriver)){
						ds_list_delete(objAIdriver.cardsOnTable, ds_list_find_index(objAIdriver.cardsOnTable, self.id));
						ds_list_delete(objAIdriver.cardsOnTable, ds_list_find_index(objAIdriver.cardsOnTable, objArenaController.instID));
						
						ds_list_delete(objAIdriver.cardsOnMemory, ds_list_find_index(objAIdriver.cardsOnMemory, self.id));
						ds_list_delete(objAIdriver.cardsOnMemory, ds_list_find_index(objAIdriver.cardsOnMemory, objArenaController.instID));
						}
						if (objArenaController.isTurn = 1) {
							ds_list_add(objArenaController.p1Score, real(self.cardValue));
						} else {
							ds_list_add(objArenaController.p2Score, real(self.cardValue));
						}
						objNormalCard.clicks = 0;
						
						with(instance_create_layer(self.x,self.y,"Instances", objBackFlash)){
							sprite_index = sprite9;
							alarm_set(0, 15);
						}
						with(instance_create_layer(objArenaController.instID.x,objArenaController.instID.y,"Instances", objBackFlash)){
							sprite_index = sprite9;
							alarm_set(0, 15);
						}
						// When all the pairs are found, reset timer and deal new cards
						if (objNormalCard.pairs > 5) {
							with(objArenaController) {
								var debudi = file_text_open_append("debudit.txt");
								var plop = "Pelaaja " + string(objArenaController.isTurn) + ". Parien määrä " + string(objNormalCard.pairs) + " : ";
								var plop2 = 0;
								var vuorossa;
								if (objArenaController.isTurn = 1) { vuorossa = objArenaController.p1Score } else { vuorossa = objArenaController.p2Score }

								for (var i = 0; i<ds_list_size(vuorossa); i+=1) {
									plop = plop + string(ds_list_find_value(vuorossa, i)) + ", ";
									plop2 = plop2 + ds_list_find_value(vuorossa, i);
								}
								plop = plop + " = " + string(plop2);
								file_text_write_string(debudi, plop);
								file_text_writeln(debudi);
								show_message(objNormalCard.pairs);
								file_text_close(debudi);
								scrTurnChange();
							}
						}
					// End finding pairs
					} else {

						alarm_set(0, objArenaController.flipTimer);
						if (instance_exists(objAIdriver)) {objAIdriver.normalAlarm0 = 1;}
						objArenaController.canTurn=false;
						self.turned = false;
						variable_instance_set(objArenaController.instID,"turned",false);
						with(instance_create_layer(self.x,self.y,"Instances", objBackFlash)){
							sprite_index = sprite8;
							alarm_set(0, 15);
						}
						with(instance_create_layer(objArenaController.instID.x,objArenaController.instID.y,"Instances", objBackFlash)){
							sprite_index = sprite8;
							alarm_set(0, 15);
						}
					}
				
					objNormalCard.clicks = 0;
					objArenaController.isPair = 0;
	
				}


			}
		}
	}
}
}