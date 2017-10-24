/// @description Everything that happens to normal cards
if (!self.found) {
if (!self.turned) {
	if (objArenaController.canTurn) {
		self.turned = true;
		if (objNormalCard.clicks = 0 && self.cardValue = "0") {
	
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
			
				// Turning cards back
				if (objNormalCard.clicks > 1) {
				
					// Incase of a pair, do not turn back
					if(self.cardValue = objArenaController.isPair) {
						objNormalCard.pairs +=1;
						self.found = true;
						variable_instance_set(objArenaController.instID,"found",true);
						if (instance_exists(objAIdriver)){
							var kortti = self.id;
							var kortti2 = objArenaController.instID;
							ds_list_delete(objAIdriver.cardsOnTable, ds_list_find_index(objAIdriver.cardsOnTable, kortti));
							ds_list_delete(objAIdriver.cardsOnTable, ds_list_find_index(objAIdriver.cardsOnTable, objArenaController.instID));
						
							ds_list_delete(objAIdriver.cardsOnMemory, ds_list_find_index(objAIdriver.cardsOnMemory, kortti));
							ds_list_delete(objAIdriver.cardsOnMemory, ds_list_find_index(objAIdriver.cardsOnMemory, objArenaController.instID));
							show_debug_message(string(kortti));
							show_debug_message(string(kortti2));
							show_debug_message("stop");
						}
						
						if (objArenaController.isTurn = 1) {
							ds_list_add(objPerSave.p1Score, real(self.cardValue));
							objArenaController.p1ScoreInt += real(self.cardValue);
						} else {
							ds_list_add(objPerSave.p2Score, real(self.cardValue));
							objArenaController.p2ScoreInt += real(self.cardValue);
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
								alarm_set(1,1);
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