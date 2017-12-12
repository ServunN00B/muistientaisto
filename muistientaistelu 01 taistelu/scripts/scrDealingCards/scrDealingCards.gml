		// Suffling the deck
		ds_list_shuffle(objArenaController.dsCarddeck);
		//Dealing in grid
		var a=objCardHolder.x; //200; // Starting position X
		var b=objCardHolder.y; // Starting position Y
		var c=5; // Card on a row
		var f = 20; //Number of cards on the table
		var g = 90 //Sprite width
		var h = 130 // Sprite height
		padding = 10;
		for (i=0;i< ds_list_size(objArenaController.dsCarddeck) ;i+=1;){
			var d = i%c; // Number on a row
			var e = floor(i/c)%c; // Row number

			//Creating instances of cards with their values and sprites
			with(instance_create_layer(a+d*(g+padding),b+e*(h+padding),layer_get_id("Instances"),objNormalCard)) {
				if (instance_exists(objAIdriver)) { ds_list_add(objAIdriver.cardsOnTable, id); }
				OrigScale = 1;
				if (objPerSave.isAttacking = objPerSave.isTurn) {
					//Attacking turn
					switch(ds_list_find_value(objArenaController.dsCarddeck, objArenaController.i)){
						case 0:
							// Miss, "rock", "banana", "beer"
							var rand = floor(random_range(1,3));
							if (rand = 1) {	
								varSprite = spriteStone; 
								turnAnim = sprAnimStoneTurn;
								turnAnimRe = sprAnimStoneTurnRe;
								
							} else { 
								varSprite = sprBanana;
								turnAnim = sprAnimBananaTurn;
								turnAnimRe = sprAnimBananaTurnRe;
								
							}
							cardValue = "0";
							break;
						case 1:
							// Knife
							varSprite = sprKnife;
							turnAnim = sprAnimKnifeTurn;
							turnAnimRe = sprAnimKnifeTurnRe;
							cardValue = "1";
							break;
						case 2:
							// Sword
							varSprite = sprSword;
							turnAnim = sprAnimSwordTurn;
							turnAnimRe = sprAnimSwordTurnRe;
							cardValue = "2";
							break;
						case 3:
							// Mace
							varSprite = sprMace;
							turnAnim = sprAnimMaceTurn;
							turnAnimRe = sprAnimMaceTurnRe;
							cardValue = "3";
							break;
					} // End of switch case
				} else {
					//Defensive turn
					switch(ds_list_find_value(objArenaController.dsCarddeck, objArenaController.i)){
						case 0:
							// Miss, "rock", "banana", "beer"
							var rand = floor(random_range(1,3));
							if (rand = 1) {	
								varSprite = spriteStone; 
								turnAnim = sprAnimStoneTurn;
								turnAnimRe = sprAnimStoneTurnRe;
							} else { 
								varSprite = sprBanana;
								turnAnim = sprAnimBananaTurn;
								turnAnimRe = sprAnimBananaTurnRe;
							}
							cardValue = "0";
							break;
						case 1:
							// Bark
							varSprite = sprBark;
							turnAnim = sprAnimBarkTurn;
							turnAnimRe = sprAnimBarkTurnRe;
							cardValue = "1";
							break;
						case 2:
							// Stool
							varSprite = sprStool;
							turnAnim = sprAnimStoolTurn;
							turnAnimRe = sprAnimStoolTurnRe;
							cardValue = "2";
							break;
						case 3:
							// Shield
							varSprite = sprShield;
							turnAnim = sprAnimShieldTurn;
							turnAnimRe = sprAnimShieldTurnRe;
							cardValue = "3";
							break;
					}
				}
			} // End of instance_create
		} // End of for loop