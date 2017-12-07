var attacker = noone;
var winning = noone;
var myCards = objPerSave.p2Score;
var eneCards = objPerSave.p1Score;
var erotus = noone;
var erotus1 = 0;
var erotus2 = 0;
var j;
for (j = 0; j < ds_list_size(eneCards); j += 1) {
	erotus -= ds_list_find_value(eneCards, j);
}
for (j = 0; j < ds_list_size(myCards); j += 1) {
	erotus += ds_list_find_value(myCards, j);
}

var card1 = variable_instance_get(argument0, "sID");
var card2 = variable_instance_get(argument1, "sID");
var myVcards;
var eneVcards;
var myhp = objPerSave.p1Health;
var enehp = objPerSave.p2Health;
var myhpV = myhp;
var enehpV = enehp;
var myhpV1 = myhp;
var enehpV1 = enehp;
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
							erotus1 -= ds_list_find_value(eneVcards, j);
						}
						for (j = 0; j < ds_list_size(myCards); j += 1) {
							erotus1 += ds_list_find_value(myCards, j);
						}
					break;
				
					case 3:
						erotus1 = erotus;
					break;
				
					case 7:
						erotus1 = erotus + 3;
					break;
				
					case 9:
						erotus1 = erotus + 4;
					break;
				
					case 12:
						erotus1 = -1;
					break;
				
					case 14:
						erotus1 = -1;
					break;
				
				}
				
				switch(card2) {
					case 0:
						eneVcards = eneCards;
						ds_list_replace(eneVcards, 0, 0);
						for (j = 0; j < ds_list_size(eneVcards); j += 1) {
							erotus2 += ds_list_find_value(eneVcards, j);
						}
						for (j = 0; j < ds_list_size(myCards); j += 1) {
							erotus2 -= ds_list_find_value(myCards, j);
						}
					break;
				
					case 3:
						erotus2 = erotus;
					break;
				
					case 7:
						erotus2 = erotus + 3;
					break;
				
					case 9:
						erotus2 = erotus + 4;
					break;
				
					case 12:
						erotus2 = -1;
					break;
				
					case 14:
						erotus2 = -1;
					break;
			}
			
			case false:
				switch(card1) {
					case 0:
						eneVcards = eneCards;
						ds_list_replace(eneVcards, 0, 0);
						for (j = 0; j < ds_list_size(eneVcards); j += 1) {
							erotus1 -= ds_list_find_value(eneVcards, j);
						}
						for (j = 0; j < ds_list_size(myCards); j += 1) {
							erotus1 += ds_list_find_value(myCards, j);
						}
					break;
				
					case 3:
						erotus1 = erotus;
					break;
				
					case 7:
						erotus1 = erotus + 3;
					break;
				
					case 9:
						erotus1 = erotus + 4;
					break;
				
					case 12:
						erotus1 = 4;
					break;
				
					case 14:
						erotus1 = 4;
					break;
				
				}
				
				switch(card2) {
					case 0:
						eneVcards = eneCards;
						ds_list_replace(eneVcards, 0, 0);
						for (j = 0; j < ds_list_size(eneVcards); j += 1) {
							erotus2 += ds_list_find_value(eneVcards, j);
						}
						for (j = 0; j < ds_list_size(myCards); j += 1) {
							erotus2 -= ds_list_find_value(myCards, j);
						}
					break;
				
					case 3:
						erotus2 = erotus;
					break;
				
					case 7:
						erotus2 = erotus + 3;
					break;
				
					case 9:
						erotus2 = erotus + 4;
					break;
				
					case 12:
						erotus2 = 4;
					break;
				
					case 14:
						erotus2 = 4;
					break;
			}
			break;
		}
	break;
}
if (enehpV = enehpV1) {
	if (erotus1 > erotus2) {
		return argument0;
	} else {
		return argument1;
	}
} else {
	if (enehpV > enehpV1) {
		return argument0;
	} else {
		return argument1;
	}
}
