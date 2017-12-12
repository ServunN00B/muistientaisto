/// @description Everything that happens to normal cards
var audio_is_played = false;
var onPoint = false;
if (objPerSave.AI && objPerSave.isTurn = 2) {
		onPoint = true;
} else {
	if (point_in_rectangle(mouse_x,mouse_y, self.x - origWidth/2, self.y - origHeight/2, self.x + origWidth/2,  self.y + origHeight/2)) {
		onPoint = true;
	}
}
if (onPoint) {
	if (self.canClick) {
		if (!self.found) {
			if (!self.turned) {
				if (objArenaController.canTurn) {
					self.turned = true;
					if (objNormalCard.clicks = 0 && self.cardValue = "0") {
						audio_play_sound(souCardClickFail, 1, false);
						audio_sound_gain(souCardClickFail, 1, 0);
					
						sprite_index = turnAnim;
						depth = depth -1;
						alarm_set(1, 10);
						scaling = true;
						alarm_set(4, 1);
						//sprite_index = self.varSprite;
			
						objArenaController.instID = 0;
						objArenaController.canTurn = false;
						self.turned = false;
						alarm_set(0,objArenaController.flipTimer * room_speed);
					} else {
						objNormalCard.clicks += 1;
						if (self.cardValue = "0") {
							if objSound.sound {
								audio_play_sound(souCardClickFail, 1, false);
								audio_is_played = true;
							}
						}
						if (clicks = 1) {
							if (!audio_is_played) {
								if objSound.sound {
									audio_play_sound(souCardClick, 1, false);
									audio_sound_gain(souCardClick, 1, 0);
								}
							}
							objArenaController.isPair = self.cardValue;
							objArenaController.instID = id;
						}
						// Changing sprite
						if (self.varSprite) {
							sprite_index = turnAnim;
							alarm_set(1, 10);
							scaling = true;
							alarm_set(4, 1);
							//sprite_index = self.varSprite;
			
							objArenaController.instID = 0;
							objArenaController.canTurn = false;
							self.turned = false;
							alarm_set(0,objArenaController.flipTimer * room_speed);
						} else {
							objNormalCard.clicks += 1;
							if (self.cardValue = "0") {
								audio_play_sound(souCardClickFail, 1, false);
								audio_is_played = true;
							}
							if (clicks = 1) {
								if (!audio_is_played) {
									audio_play_sound(souCardClick, 1, false);
								}
								objArenaController.isPair = self.cardValue;
								objArenaController.instID = id;
							}
						// Changing sprite
						if (self.varSprite) {
							sprite_index = turnAnim;
							alarm_set(1, 10);
							scaling = true;
							alarm_set(4, 1);
							//sprite_index = self.varSprite;
				
							// Turning cards back
							if (objNormalCard.clicks > 1) {
								// Incase of a pair, do not turn back
								if(self.cardValue = objArenaController.isPair) {
									if (!audio_is_played) {
										audio_play_sound(souPair, 1, false);	
									}
							// Incase of a pair, do not turn back
							if(self.cardValue = objArenaController.isPair) {
								if (!audio_is_played && objSound.sound) {
									audio_play_sound(souPair, 1, false);	
								}
									if (objPerSave.AI = true && objPerSave.isTurn == 2)
									{
										effect_create_above(ef_ring,self.x,self.y,10,c_yellow);
									}
									else 
									{
										effect_create_above(ef_ring,mouse_x,mouse_y,10,c_yellow);
									}
									objNormalCard.pairs +=1;
									self.found = true;
									objArenaController.canTurn = false;
									variable_instance_set(objArenaController.instID,"found",true);
									if (instance_exists(objAIdriver)){
										var kortti = self.id;
										var kortti2 = objArenaController.instID;
										ds_list_delete(objAIdriver.cardsOnTable, ds_list_find_index(objAIdriver.cardsOnTable, kortti));
										ds_list_delete(objAIdriver.cardsOnTable, ds_list_find_index(objAIdriver.cardsOnTable, objArenaController.instID));
						
										ds_list_delete(objAIdriver.cardsOnMemory, ds_list_find_index(objAIdriver.cardsOnMemory, kortti));
										ds_list_delete(objAIdriver.cardsOnMemory, ds_list_find_index(objAIdriver.cardsOnMemory, objArenaController.instID));
							
										if (objPerSave.debugMod) {
											show_debug_message(string(kortti));
											show_debug_message(string(kortti2));
											show_debug_message("stop");
										}
									}
						
									if (objPerSave.isTurn = 1) {
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
						
									alarm_set(2, 15);
									alarm_set(5, 15);

									// When all the pairs are found, reset timer and deal new cards
									if (objNormalCard.pairs > 5) {
										objNormalCard.canClick = false;
									}
								// End finding pairs
								} else {
									if (!audio_is_played) {
										audio_play_sound(souCardClick, 1, false);	
									}
									objNormalCard.canClick = false;
								}
							// End finding pairs
							} else {
								if (!audio_is_played && objSound.sound) {
									audio_play_sound(souCardClick, 1, false);	
								}

									alarm_set(0, objArenaController.flipTimer * room_speed);
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
			} //End of if !turned
		} //End of if !found
	} //End of if canClick
} //Area of card so no miss clicks
