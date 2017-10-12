					//random card from the table
					var plop = ""
					var arvo = ds_list_find_value(objAIdriver.cardsOnTable, floor(random_range(0, (ds_list_size(objAIdriver.cardsOnTable) - 1))));
					//turn card and place card value in memory
					with(arvo){
						event_perform(ev_mouse,ev_left_release);
						objAIdriver.aiCardValue = cardValue;
					} 
					plop = "Käänsi kortin " + string(arvo) + ", jonka arvo on " + string(variable_instance_get(arvo, "cardValue"));
					file_text_write_string(objAIdriver.AItxt, plop);
							file_text_writeln(objAIdriver.AItxt);
					//check if card ID is in memory
					var onko = ds_list_find_index(objAIdriver.cardsOnMemory,arvo);
					//check if card value is over 0
					if (real(objAIdriver.aiCardValue) > 0) {
						//if card ID is in memory(mark X otherwise add to memory)
						if (onko > -1) {
							objAIdriver.xMarks = onko;
							file_text_write_string(objAIdriver.AItxt, "Kortti oli muistissa");
							file_text_writeln(objAIdriver.AItxt);
						} else {
							if (ds_list_size(objAIdriver.cardsOnMemory) = 0) {
								if (objAIdriver.aiPair = undefined) {
									file_text_write_string(objAIdriver.AItxt, "Kortti on lisätty muistiin");
									file_text_writeln(objAIdriver.AItxt);
									ds_list_add(objAIdriver.cardsOnMemory, arvo);
								}
								
							} else {
								var rand = floor(random_range(0,10));
								//50/50 chance to add to list or check if pair is in memory
								if (rand < 11 && objAIdriver.turn = 1) {
									//compare card value to card value from memory
									file_text_write_string(objAIdriver.AItxt, "Tarkistetaan onko kortille paria muistissa");
									file_text_writeln(objAIdriver.AItxt);
									
									for (objAIdriver.j = 0; objAIdriver.j<ds_list_size(objAIdriver.cardsOnMemory); objAIdriver.j += 1) {
										with(ds_list_find_value(objAIdriver.cardsOnMemory, objAIdriver.j)){
										
												if (real(objAIdriver.aiCardValue) = real(cardValue)) {
													objAIdriver.aiPair = id;
													objAIdriver.j = ds_list_size(objAIdriver.cardsOnMemory);
													file_text_write_string(objAIdriver.AItxt, "Kortille löytyi pari " + string(id) + ", jonka arvo on " + string(self.cardValue));
													file_text_writeln(objAIdriver.AItxt);
												}
										
										}
									}
									// If AI doesn't find pair, it puts card in memory
									if (objAIdriver.aiPair = undefined) { 
										ds_list_add(objAIdriver.cardsOnMemory, arvo);
										file_text_write_string(objAIdriver.AItxt, "Ei löytynyt paria, lisätään muistiin");
										file_text_writeln(objAIdriver.AItxt);
									}
									
								} else {
									ds_list_add(objAIdriver.cardsOnMemory, arvo);
									file_text_write_string(objAIdriver.AItxt, "Lisätään kortti muistiin");
									file_text_writeln(objAIdriver.AItxt);
								}
							}
						}
					} else {
						file_text_write_string(objAIdriver.AItxt, "Kortti oli 0, skipataan");
						file_text_writeln(objAIdriver.AItxt);
				
					}