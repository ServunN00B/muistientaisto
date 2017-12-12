/// @description Insert description here
// You can write your code in this editor
if objSound.sound {
	audio_play_sound(souButton, 1, false);
	audio_sound_gain(souButton, 1, 0);
}

if (room != rooMain) {
	audio_stop_all();
	
	var random_sound_pretheme = irandom(array_length_1d(objSoundController.sound_pretheme_array)-1);
	objSoundController.sound_pretheme = objSoundController.sound_pretheme_array[random_sound_pretheme];
	audio_play_sound(objSoundController.sound_pretheme, 1, true);
	if objMusic.music {
		audio_sound_gain(objSoundController.sound_pretheme, 0.4, 0);
	}
	else {
		audio_sound_gain(objSoundController.sound_pretheme, 0, 0);
	}
	
	objPerSave.firstTurn = true;
	ds_list_clear(objPerSave.p1Score);
	ds_list_clear(objPerSave.p2Score);
	objPerSave.p1LastingSpecialEffect = false;
	objPerSave.p2LastingSpecialEffect = false;
	objPerSave.p1SpecialEffect = -1;
	objPerSave.p2SpecialEffect = -1;
	objPerSave.isAttacking = 0;
	objPerSave.isTurn = 0;
	objPerSave.p1Health = objPerSave.basicStartHealth;
	objPerSave.p2Health = objPerSave.basicStartHealth;
	ds_list_clear(objPerSave.dsP1SpecialCards);
	ds_list_clear(objPerSave.dsP2SpecialCards);
	ds_list_clear(objPerSave.cardsInUse);
	objPerSave.AI = false;
	room_goto(rooMain);
} else {
	instance_create_depth(room_width/2,60,depth - 5, objStatsScreen);
}
		