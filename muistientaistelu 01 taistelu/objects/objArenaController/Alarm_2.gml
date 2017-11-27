/// @description Specialcard choosing time
instance_destroy(objBlock);
instance_destroy(objSpeCardSelect);
instance_destroy(objSpecialCardBack);
instance_destroy(objSpeCardDone);
firstDeal = false;
if (ChoosingPlayer = 1) {
	var vuorossaK = objPerSave.dsP1SpecialCards
} else {
	var vuorossaK = objPerSave.dsP2SpecialCards
}

var kaytKoko = ds_list_size(objPerSave.cardsInUse) - 1;
while(ds_list_size(vuorossaK) < 6) {
	var ra = floor(random_range(0,kaytKoko));
	var ka = ds_list_find_value(objPerSave.cardsInUse,ra);
	if (ds_list_find_index(vuorossaK,ka)<0) {
		ds_list_add(vuorossaK,ka)
	}
}
//Suffling Specialcard deck
//ds_list_shuffle(vuorossaK);

//Which Player is Choosing
if (ChoosingPlayer = objPerSave.isAttacking) {
	if (ChoosingPlayer = 1) { ChoosingPlayer = 2; } else { ChoosingPlayer = 1; }
	//Starting count down on special card selection for other player
	alarm_set(2,room_speed*SCardSelectTimer);
	scrSpeCardSelectDeal();
} else {
	drawSelect = false;
	// Start pre turn timer
	alarm_set(0,room_speed*preturnTimer); 
	//Play background music
	audio_play_sound(sound0,1,true);
	// Suffling and dealing cards in grid
	scrDealingCards();
}