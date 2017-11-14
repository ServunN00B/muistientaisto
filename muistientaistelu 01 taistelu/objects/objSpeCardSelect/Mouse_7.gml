/// @description Selecting Card
var vuorossa;
if (objArenaController.ChoosingPlayer = 1) {
	vuorossa = objPerSave.dsP1SpecialCards; 
} else {
	vuorossa = objPerSave.dsP2SpecialCards;
}

if (!selected) {
	//If there is less then 6 cards in deck
	if (ds_list_size(vuorossa)<6) {
		objSpeCardSelect.thisID = self.id;
		selected = true;
		ds_list_add(vuorossa, sID);
		var darken = instance_create_layer(self.x, self.y, "Instances", objBlock);
		with(darken){
			sprite_index = sprCardFade;
			image_xscale = 0.2;
			image_yscale = 0.2;
			variable_instance_set(objSpeCardSelect.thisID,"myDarken",id);
			
			
		} // With darken closed
	} // How many cards in deck closed
} else {
	selected = false;
	var myDSindex = ds_list_find_index(vuorossa,sID);
	ds_list_delete(vuorossa,myDSindex);
	instance_destroy(myDarken);
}