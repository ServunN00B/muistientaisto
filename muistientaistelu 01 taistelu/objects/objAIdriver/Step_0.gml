/// @description Insert description here
// You can write your code in this editor
if (arenaAlarm0 == 0 ){
		if (normalAlarm0 == 0) {
			if (go){
				file_text_write_string(AItxt, "Vuoro " + string(turn) + " alkaa");
				file_text_writeln(AItxt);
				if (turn = 2){
				//check if AI has found a pair and has only turned 1 card
					if (aiPair != undefined) {
						
						file_text_write_string(AItxt, "käytetään muistista " + string(aiPair) + " jonka arvo on " + string(variable_instance_get(aiPair, "cardValue")));
						file_text_writeln(AItxt);
						with(aiPair){
							event_perform(ev_mouse,ev_left_release);
							objAIdriver.aiCardValue = cardValue;
							
						} 
						file_text_writeln(AItxt);
						go = false;
						alarm_set(0,15);
						aiPair = undefined;
						file_text_write_string(AItxt, "Vuoro " + string(turn) + " loppuu");
						file_text_writeln(AItxt);
						file_text_writeln(AItxt);
						turn = 1;
					// AI has either turned 2 cards or hasn't found a pair
					} else {
					scrAIcheck();
					file_text_write_string(AItxt, "Vuoro " + string(turn) + " loppuu");
					file_text_writeln(AItxt);
					file_text_writeln(AItxt);
					turn = 1;
					go = false;
					alarm_set(0,15);
					}
				} else {
					scrAIcheck();
					file_text_write_string(AItxt, "Vuoro " + string(turn) + " loppuu");
					file_text_writeln(AItxt);
					file_text_writeln(AItxt);
					if(real(objAIdriver.aiCardValue) > 0) { turn = 2; } else { turn = 1; }
					go = false;
					alarm_set(0,15);
				}
			
		}
	}
}