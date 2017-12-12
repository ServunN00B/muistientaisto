/// @description Specialcard choosing time
objArenaController.countdown = 1;

objPL2Glow.visible = false;
objPL1Glow.visible = false;

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
	
	alarm_set(4,room_speed*SCardSelectTimer-3*room_speed);
	
	//Starting count down on special card selection for other player
	alarm_set(2,room_speed*SCardSelectTimer);
	
if (ChoosingPlayer = 1) {
	objPL1Glow.visible = true;
	objPL2Glow.visible = false;
} else {
	objPL1Glow.visible = false;
	objPL2Glow.visible = true;
}
	scrSpeCardSelectDeal();
} else {
	audio_sound_gain(objSoundController.sound_pretheme, 0, 1000*preturnTimer);
	
	drawSelect = false;
	// Start pre turn timer
	alarm_set(0,room_speed*preturnTimer); 
	
if (objPerSave.isTurn = 1) {
	objPL1Glow.visible = true;
	objPL2Glow.visible = false;
} else {
	objPL1Glow.visible = false;
	objPL2Glow.visible = true;
}
	// Suffling and dealing cards in grid
	scrDealingCards();
}