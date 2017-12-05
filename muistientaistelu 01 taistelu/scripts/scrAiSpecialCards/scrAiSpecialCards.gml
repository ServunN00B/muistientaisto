var attacker = noone;
var winning = noone;
var myCards = objPerSave.p2Score;
var eneCards = objPerSave.p1Score;
var erotus = noone;
var erotus1 = 0;
var erotus2 = 0;
var j;
for (j = 0; j < ds_list_size(eneCards); j += 1) {
	erotus += ds_list_find_value(eneCards, j);
}
for (j = 0; j < ds_list_size(myCards); j += 1) {
	erotus -= ds_list_find_value(myCards, j);
}

var card1 = argument0;
var card2 = argument1;
var myVcards;
var eneVcards;
var myhp = objPerSave.p1Health;
var enehp = objPerSave.p2Health;
var myhpV;
var enehpV;
var myhpV1;
var enehpV1;
var varvo;

//Checking if AI is attacking
if (objPerSave.isAttacking = 2) {
	attacker = true;
} else {
	attacker = false;
}

//Checking if AI is winning
if (erotus > 0) {
	winning = false;
} else {
	winning = true;
}

switch(attacker) {
	case true:
		switch(card1) {
			case 1:
				myVcards = myCards;
				varvo = ds_list_find_value(myVcards, 0) * 2;
				ds_list_replace(myVcards, 0, varvo);
				for (j = 0; j < ds_list_size(myVcards); j += 1) {
					erotus1 += ds_list_find_value(myVcards, j);
				}
			break;
			
			case 2:
				myVcards = myCards;
				if (ds_list_find_value(myVcards, ds_list_size(myVcards)) < 2) {
					if (ds_list_find_value(myVcards, 0) < 2) {
					varvo = floor(random_range(1,3));
					ds_list_replace(myVcards, 0, varvo);
					}
				}
				for (j = 0; j < ds_list_size(myVcards); j += 1) {
					erotus1 += ds_list_find_value(myVcards, j);
				}
			break;
			
			case 16:
				enehpV = enehp;
				if (enehp - 5 < 1) {
					if (myhp - 5 > 0) {
						enehpV = enehp -5;
					}
				}
			break;
			
			case 17:
				enehpV = enehp;
				if (myhp - 10 > 0) {
					myVcards = myCards;
					for (j = 0; j < ds_list_size(myVcards); j += 1) {
						erotus1 += ds_list_find_value(myVcards, j);
					}
					enehpV -= erotus1 + 10;
				}
			break;
			
		}
		
		switch(card2) {
			case 1:
				myVcards = myCards;
				varvo = ds_list_find_value(myVcards, 0) * 2;
				ds_list_replace(myVcards, 0, varvo);
				for (j = 0; j < ds_list_size(myVcards); j += 1) {
					erotus2 += ds_list_find_value(myVcards, j);
				}
			break;
			
			case 2:
				myVcards = myCards;
				if (ds_list_find_value(myVcards, ds_list_size(myVcards)) < 2) {
					if (ds_list_find_value(myVcards, 0) < 2) {
					varvo = floor(random_range(1,3));
					ds_list_replace(myVcards, 0, varvo);
					}
				}
				for (j = 0; j < ds_list_size(myVcards); j += 1) {
					erotus2 += ds_list_find_value(myVcards, j);
				}
			break;
			
			case 16:
				enehpV = enehp;
				if (enehp - 5 < 1) {
					if (myhp - 5 > 0) {
						enehpV1 = enehp -5;
					}
				}
			break;
			
			case 17:
				enehpV = enehp;
				if (myhp - 10 > 0) {
					myVcards = myCards;
					for (j = 0; j < ds_list_size(myVcards); j += 1) {
						erotus2 += ds_list_find_value(myVcards, j);
					}
					enehpV1 -= erotus1 + 10;
				}
			break;
			
		}
	break;
	
	case false:
		switch(winning) {
			case true:
				switch(card1) {
					case 0:
						eneVcards = eneCards;
						ds_list_replace(eneVcards, 0, 0);
						for (j = 0; j < ds_list_size(eneVcards); j += 1) {
							erotus1 += ds_list_find_value(eneVcards, j);
						}
					break;
				
					case 7:
					
					break;
				}
				
				switch(card2) {
					case 0:
						eneVcards = eneCards;
						ds_list_replace(eneVcards, 0, 0);
						for (j = 0; j < ds_list_size(eneVcards); j += 1) {
							erotus2 += ds_list_find_value(eneVcards, j);
						}
					break;
				
					case 7:
					
					break;
				}
			
			case false:
	
			break;
		}
	break;
}
