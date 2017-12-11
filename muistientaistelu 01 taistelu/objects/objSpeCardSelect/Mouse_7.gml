/// @description Selecting Card
var audio_is_played = false;

if (sCHOSEN = 1) {
	var vuorossa;
	if (objArenaController.ChoosingPlayer = 1) {
		vuorossa = objPerSave.dsP1SpecialCards; 
	} else {
		vuorossa = objPerSave.dsP2SpecialCards;
	}

	if (!selected) {
		//If there is less then 6 cards in deck
		if (ds_list_size(vuorossa)<6) {
			audio_play_sound(souCardClick, 1, false);
			audio_sound_gain(souCardClick, 1, 0);
			audio_is_played = true;
			
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
		
		if (!audio_is_played) {
			audio_play_sound(souCardClickFail, 1, false);
			audio_sound_gain(souCardClickFail, 1, 0);
		}
	} else {
		audio_play_sound(souButton, 1, false);
		audio_sound_gain(souButton, 1, 0);
		
		selected = false;
		var myDSindex = ds_list_find_index(vuorossa,sID);
		ds_list_delete(vuorossa,myDSindex);
		instance_destroy(myDarken);
	}
}