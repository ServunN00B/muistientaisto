var j = 0;
var place = 0;
var thisId = 0;
var thatId = 0;
var thisValue = 0;
objAIdriver.remember = false;
var inMemoryPairs;
inMemoryPairs[3, 0] = 0;
var prosToUse = (66 + 2 * objNormalCard.pairs) + (2*ds_list_size(objAIdriver.zeroOnMemory));
// Check if there is more than 1 card in memory
	if (objPerSave.debugMod) {
		file_text_writeln(objAIdriver.AItxt);
		file_text_write_string(objAIdriver.AItxt, "AI Löysi muististaan enemmän kun yhden kortin");
		file_text_writeln(objAIdriver.AItxt);
		file_text_write_string(objAIdriver.AItxt, "Listataan kortit arrayhyn");
		file_text_writeln(objAIdriver.AItxt);
		file_text_writeln(objAIdriver.AItxt);
	}
	// List all cards from memory to array by their value
	for (j = 0; j < ds_list_size(objAIdriver.cardsOnMemory); j += 1) {
		thisId = ds_list_find_value(objAIdriver.cardsOnMemory, j);
		thisValue = real(variable_instance_get(thisId, "cardValue")) - 1;
		place = array_length_2d(inMemoryPairs, thisValue);
		inMemoryPairs[thisValue, place] = thisId;
		if (objPerSave.debugMod) {
			file_text_write_string(objAIdriver.AItxt, "inMemoryPairs[" + string(thisValue) + "," + string(place) +"] kortti " +
			string(thisId) + " arvoltaan " + string(thisValue+1));
			file_text_writeln(objAIdriver.AItxt);
		}
	}
	
	file_text_writeln(objAIdriver.AItxt);
	file_text_writeln(objAIdriver.AItxt);
	
	// Go through array highest value first
	for(thisValue = 2; thisValue > -1; thisValue -=1) {
		thisId = undefined;
		thatId = undefined;
		if (objPerSave.debugMod) {
			file_text_write_string(objAIdriver.AItxt, "Tarkistetaan arrayn pituus arvolla " + string(thisValue));
			file_text_writeln(objAIdriver.AItxt);
		}
		//if there is more than one card with this value, use them
		if (array_length_2d(inMemoryPairs, thisValue)>1) {
			if (objPerSave.debugMod) {
				file_text_write_string(objAIdriver.AItxt, "Array oli pidempi kun yksi arvolla " + string(thisValue));
				file_text_writeln(objAIdriver.AItxt);
				file_text_write_string(objAIdriver.AItxt, "Tarkistetaan muistaako AI käyttää muistia");
				file_text_writeln(objAIdriver.AItxt);
			}
			var rand = irandom_range(0,100);
			//Roll the die to see if AI can remember to use
			if (objPerSave.debugMod) {
				file_text_write_string(objAIdriver.AItxt, "Arpa sanoo " + string(rand) + " vastaan AI:n " + string(prosToUse));
				file_text_writeln(objAIdriver.AItxt);
			}
			
			if (rand <= prosToUse) {
				thisId = inMemoryPairs[thisValue, 0];
				thatId = inMemoryPairs[thisValue, 1];
				var thisPair = [thisId, thatId];
				if (!array_equals(objAIdriver.lastPair,thisPair) || memfail) {
						with(thisId){
							event_perform(ev_mouse,ev_left_release);
							objAIdriver.aiCardValue = self.cardValue;
						}
						objAIdriver.aiPair = thatId;
						objAIdriver.remember = true;
						if (objPerSave.debugMod) {
							file_text_write_string(objAIdriver.AItxt, "AI muisti ja valitsi nyt kortin " 
							+ string(thisId) + " ja seuraavalla " + string(thatId));
						
							show_debug_message("Edellinen pari: " + string(objAIdriver.lastPair[0]) + " ja " + string(objAIdriver.lastPair[1]));
							show_debug_message("Pari(erikoismuisti)");
							show_debug_message(thisId);
							show_debug_message(thatId);
						}
						objAIdriver.lastPair = [thisId, thatId];
						
						if (objPerSave.debugMod) {
							show_debug_message("stop");
						}
						file_text_writeln(objAIdriver.AItxt);
				} else { 
					if (objPerSave.debugMod) {
						show_debug_message("Aikaisempi pari	: " + string(objAIdriver.lastPair[0]) + " & " + string(objAIdriver.lastPair[1]));
						show_debug_message("Tämä pari		: " + string(thisId) + " & " + string(thatId));
						show_debug_message("stop");
					}
						objAIdriver.memfail = true;
						break;
				}
				
			} else {
				if (objPerSave.debugMod) {
					file_text_write_string(objAIdriver.AItxt, "AI ei muistanut");
					file_text_writeln(objAIdriver.AItxt);
				}
			}
			break;
		}
		
	}
	
inMemoryPairs = 0;
file_text_writeln(objAIdriver.AItxt);
