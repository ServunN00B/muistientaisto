/// @description Insert description here
// You can write your code in this editor
if (arenaAlarm0 == 0 ){
		if (normalAlarm0 == 0) {
			if (go){
				//random card from the table
				var arvo = ds_list_find_value(cardsOnTable, floor(random_range(0, (ds_list_size(cardsOnTable) - 1))));
				//turn card and place card value in memory
				with(arvo){
					event_perform(ev_mouse,ev_left_release);
					objAIdriver.aiCardValue = cardValue;
				} 
				
				//check if card ID is in memory
				var onko = ds_list_find_index(cardsOnMemory,arvo);
				//check if card value is over 0
				if (real(aiCardValue) > 0) {
					//if card ID is in memory(mark X otherwise add to memory)
					if (onko > -1) {
						xMarks = onko;
						
						
					} else {
						ds_list_add(cardsOnMemory, arvo);
					}
				}
				go = false;
				alarm_set(0,15);
			}
		}
}