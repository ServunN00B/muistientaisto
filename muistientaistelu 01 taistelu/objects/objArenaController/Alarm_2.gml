/// @description Specialcard choosing time
instance_destroy(objBlock);
instance_destroy(objSpeCardSelect);
instance_destroy(objSpecialCardBack);
instance_destroy(objSpeCardDone);

if (ChoosingPlayer = 1) {
	var vuorossaK = objPerSave.dsP1SpecialCards
} else {
	var vuorossaK = objPerSave.dsP2SpecialCards
}
var ra = 0;
while(ds_list_size(vuorossaK) < 6) {
	if (ds_list_find_index(vuorossaK,ra)<0) {
		ds_list_add(vuorossaK,ra)
	}
	ra += 1;
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