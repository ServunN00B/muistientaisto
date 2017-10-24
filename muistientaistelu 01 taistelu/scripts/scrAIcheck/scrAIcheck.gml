					//random card from the table
					var plop = ""
					var arvo = ds_list_find_value(objAIdriver.cardsOnTable, floor(random_range(0, (ds_list_size(objAIdriver.cardsOnTable) - 1))));
					var aiPros = objAIdriver.aiDifficultyArray[objArenaController.aiDifficulty];
					var rand = floor(random_range(0,9));
					var i = 0;
						
					var isInZero = ds_list_find_index(objAIdriver.zeroOnMemory, arvo);
					
					
					if (variable_instance_get(arvo,"turned")) {
						show_message("Virhe! Kortti " + string(arvo) + " arvoltaan " + string(variable_instance_get(arvo,"cardValue")) + " on jo käännetty!");
						while (variable_instance_get(arvo,"turned")){
							arvo = ds_list_find_value(objAIdriver.cardsOnTable, floor(random_range(0, (ds_list_size(objAIdriver.cardsOnTable) - 1))));
									file_text_write_string(objAIdriver.AItxt, "Hups meinasin klikata jo käännettyä! uusi kortti *-*");
									file_text_writeln(objAIdriver.AItxt);
									if (objArenaController.alarmi1 < 10) { break; }
						}
					}
					
					//checking if card is the same as last pick or pick before that
					if (objAIdriver.aiLastPick != undefined) {
						if (objAIdriver.aiStLastPick != undefined) {
							if (arvo = objAIdriver.aiStLastPick) {
								for (i = 0; i<5; i +=1) {
									file_text_write_string(objAIdriver.AItxt, "Sama kuin edellinen tai sitä edeltävä, valitaan uusi");
									file_text_writeln(objAIdriver.AItxt);
									arvo = ds_list_find_value(objAIdriver.cardsOnTable, floor(random_range(0, (ds_list_size(objAIdriver.cardsOnTable) - 1))));
									if (arvo != objAIdriver.aiStLastPick) { if (arvo != objAIdriver.aiLastPick) {break;}}
								}
							}
						} else {
							if (arvo = objAIdriver.aiLastPick) {
								for (i = 0; i<5; i +=1) {
									file_text_write_string(objAIdriver.AItxt, "Sama kuin edellinen tai sitä edeltävä, valitaan uusi");
									file_text_writeln(objAIdriver.AItxt);
									arvo = ds_list_find_value(objAIdriver.cardsOnTable, floor(random_range(0, (ds_list_size(objAIdriver.cardsOnTable) - 1))));
									if (arvo != objAIdriver.aiStLastPick) { if (arvo != objAIdriver.aiLastPick) {break;}}
								}
							}
						}
					}
					
						
					if (random_range(0,100) < aiPros) {
						if (isInZero > -1 ) {						
							for (i = 0; i<5; i +=1) {
								file_text_write_string(objAIdriver.AItxt, "Nolla Löytynyt, uusi kortti");
								file_text_writeln(objAIdriver.AItxt);
								arvo = ds_list_find_value(objAIdriver.cardsOnTable, floor(random_range(0, (ds_list_size(objAIdriver.cardsOnTable) - 1))));
								isInZero = ds_list_find_index(objAIdriver.zeroOnMemory, arvo);
								if (isInZero < 0) { break;}
							}
						}
					}
					
					if (objAIdriver.aiLastPick != undefined){ objAIdriver.aiStLastPick = objAIdriver.aiLastPick;}
					objAIdriver.aiLastPick = arvo;
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
							if (objAIdriver.turn < 2) {
								if (random_range(0,100) < aiPros) {
									file_text_write_string(objAIdriver.AItxt, "Katsotaan onko paria muistissa");
									file_text_writeln(objAIdriver.AItxt);
									objAIdriver.aiIsSame = arvo;
									for (objAIdriver.j = 0; objAIdriver.j<ds_list_size(objAIdriver.cardsOnMemory); objAIdriver.j += 1) {
												with(ds_list_find_value(objAIdriver.cardsOnMemory, objAIdriver.j)){
													if (objAIdriver.aiIsSame != id ) {
														if (real(objAIdriver.aiCardValue) = real(cardValue)) {
															objAIdriver.aiPair = id;
															objAIdriver.j = ds_list_size(objAIdriver.cardsOnMemory);
															file_text_write_string(objAIdriver.AItxt, "Kortille löytyi pari " + string(id) + ", jonka arvo on " + string(self.cardValue));
															file_text_writeln(objAIdriver.AItxt);
														}
													}
												}
									}
								} else {
									file_text_write_string(objAIdriver.AItxt, "AI ei muistanut tarkistaa muistia");
									file_text_writeln(objAIdriver.AItxt);
								}
							}
						} else {
							if (ds_list_size(objAIdriver.cardsOnMemory) = 0) {
								if (objAIdriver.aiPair = undefined) {
									file_text_write_string(objAIdriver.AItxt, "Kortti on lisätty muistiin");
									file_text_writeln(objAIdriver.AItxt);
									ds_list_add(objAIdriver.cardsOnMemory, arvo);
								}
								
							} else {
								
								//50/50 chance to add to list or check if pair is in memory
								if (objAIdriver.turn = 1) {
									if (random_range(0,100) < aiPros) {
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
										file_text_write_string(objAIdriver.AItxt, "AI ei muistanut tarkistaa muistia.");
										file_text_writeln(objAIdriver.AItxt);
										ds_list_add(objAIdriver.cardsOnMemory, arvo);
										file_text_write_string(objAIdriver.AItxt, "Lisätään muistiin.");
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
						isInZero = ds_list_find_index(objAIdriver.zeroOnMemory, arvo);
						if (isInZero<0) {
						ds_list_add(objAIdriver.zeroOnMemory, arvo);
						file_text_write_string(objAIdriver.AItxt, "Kortti oli 0, lisätään nolla listaan");
						} else {
						file_text_write_string(objAIdriver.AItxt, "Kortti oli 0, ja oli jo listassa");
						}
						file_text_writeln(objAIdriver.AItxt);
					
					}
					