		// Suffling the deck
		ds_list_shuffle(objArenaController.dsCarddeck);
		//Dealing in grid
		var a=objCards.x; //200; // Starting position X
		var b=objCards.y; // Starting position Y
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
				switch(ds_list_find_value(objArenaController.dsCarddeck, objArenaController.i)){
					case 0:
						// Miss, "rock", "banana", "beer"
						varSprite = sprMiss;
						cardValue = "0";
						break;
					case 1:
						// Knife
						varSprite = sprKnife;
						cardValue = "1";
						break;
					case 2:
						// Sword
						varSprite = sprSword;
						cardValue = "2";
						break;
					case 3:
						// Mace
						varSprite = sprMace;
						cardValue = "3";
						break;
				} // End of switch case
			} // End of instance_create
		} // End of for loop
