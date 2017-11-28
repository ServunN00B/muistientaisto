var speCards = objAIdriver.speCardsOnTable;
var spePriot = objAIdriver.speValueOnTable;
var kaytjono = objAIdriver.spePriority;

//Checking what type cannot be used
if (objPerSave.isAttacking = 2) {
	var canNotUse = "defensive";
} else {
	var canNotUse = "offensive"
}
	
// Check what cards are on the table and que them by priority
for (var i = 0; i < 3; i += 1) {
	var arvo = ds_list_find_value(speCards,i);		// Getting card instance id
	var prio = ds_list_find_value(spePriot,i);		// Getting card priority
	var type = variable_instance_get(arvo, "sTYPE"); // Getting card type
	if (type != canNotUse) {						//Check if card type can be used this turn
		if (ds_list_empty(kaytjono)) {				//if there is nothing in que add to it,
			ds_list_add(kaytjono,arvo);
		} else {									// else go through the que to see where card goes
			var jonoPituus = ds_list_size(kaytjono);
			for (var j = 0; j < jonoPituus; j += 1) {
				var jonoArvo = ds_list_find_value(kaytjono, j);
				var jonoPrio = ds_list_find_value(spePriot, ds_list_find_index(speCards,jonoArvo));
				if (jonoPrio > prio) {
					ds_list_insert(kaytjono, j, arvo);
					j = jonoPituus
				}
			}
		}
	}
}

if (ds_list_empty(kaytjono)) {
	objAIdriver.canUseSpecial = false;
} else {
	var SpeCardChosen = ds_list_find_value(kaytjono,0);
	var kortinEtu = variable_instance_get(SpeCardChosen, "spCardFront");
	var nimi = variable_instance_get(kortinEtu, "sNAME");
	if (objPerSave.debugMod) {
		show_message("AI kaytti erikoiskortin " + string(nimi));
	}
	objAIdriver.canUseSpecial = false;
	with(SpeCardChosen){
		event_perform(ev_mouse,ev_left_release);
	}
}

objAIdriver.spePriority = kaytjono;
