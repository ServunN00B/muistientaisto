/// @description Insert description here
// You can write your code in this editor
if (objPerSave.firstTurn){
	if (objArenaController.ChoosingPlayer = 2){
			if (instance_exists(objSpeCardDone)){
				with(objSpeCardDone){
					event_perform(ev_mouse,ev_left_release);
				}
			}
	}
}
if (arenaAlarm0 == 0 ){
		if (normalAlarm0 == 0) {
				if (canUseSpecial) {
					if (!objArenaController.p2SpeCardUsed) {
						scrAIspeCardUse();
					}
				}
			
			
			if (objArenaController.alarmi1 > 5) {
					if (memfail) {
						if (objPerSave.debugMod) {
							show_debug_message("Muistihärö, tarkistetaan muisti");
						}
						var aikaNy = current_time;
						for (var i = 0; i<ds_list_size(cardsOnMemory); i+=1) {
								if(ds_list_find_index(cardsOnTable,ds_list_find_value(cardsOnMemory, i))<0){
									if (objPerSave.debugMod) {
										show_debug_message(string(ds_list_find_value(cardsOnMemory, i)) + "ei ollut pöydällä");
									}
									ds_list_delete(cardsOnMemory,i);
									memfail = false;
								}
						}
						if (objPerSave.debugMod) {
							show_debug_message("Aikaa kului: " + string(current_time - aikaNy));
						}
					}
					if (go){
						// Log files go to C:\Users\*username*\AppData\Local\muistientaistelu_01_taistelu
						if (objPerSave.debugMod) {
							file_text_write_string(AItxt, "Vuoro " + string(turn) + " alkaa");
							file_text_writeln(AItxt);
						}
						if (turn = 2){
						//check if AI has found a pair and has only turned 1 card
							if (aiPair != undefined) {
								remember = false;
								objAIdriver.aiStLastPick = objAIdriver.aiLastPick;
								objAIdriver.aiLastPick = aiPair;
								if (objPerSave.debugMod) {
									file_text_write_string(AItxt, "käytetään muistista " + string(aiPair) + " jonka arvo on " + string(variable_instance_get(aiPair, "cardValue")));
									file_text_writeln(AItxt);
								}
								with(aiPair){
									event_perform(ev_mouse,ev_left_release);
									objAIdriver.aiCardValue = cardValue;
							
								} 
								file_text_writeln(AItxt);
								go = false;
								alarm_set(0,25);
								aiPair = undefined;
								if (objPerSave.debugMod) {
									file_text_write_string(AItxt, "Vuoro " + string(turn) + " loppuu");
									file_text_writeln(AItxt);
									file_text_writeln(AItxt);
								}
								turn = 1;
							// AI has either turned 2 cards or hasn't found a pair
							} else {
							scrAIcheck();
							if (objPerSave.debugMod) {
								file_text_write_string(AItxt, "Vuoro " + string(turn) + " loppuu");
								file_text_writeln(AItxt);
								file_text_writeln(AItxt);
							}
							turn = 1;
							go = false;
							alarm_set(0,25);
							}
						} else {
							if (ds_list_size(objAIdriver.cardsOnMemory) > 1) {
								scrAiCheckMemory();
							}
							if (!objAIdriver.remember) {
								scrAIcheck();
							}
							if (objPerSave.debugMod) {
								file_text_write_string(AItxt, "Vuoro " + string(turn) + " loppuu");
								file_text_writeln(AItxt);
								file_text_writeln(AItxt);
							}
							if(real(objAIdriver.aiCardValue) > 0) { turn = 2; } else { turn = 1; }
							go = false;
							alarm_set(0,25);
						}
			
					}
				}
		}
}