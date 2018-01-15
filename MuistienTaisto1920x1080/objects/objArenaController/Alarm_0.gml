/// @description Start of turn alarm

objArenaController.countdown = 1;

instance_destroy(objBackFlash);
canTurn = true;
if (instance_exists(objAIdriver)) {objAIdriver.arenaAlarm0 = 0;}
scrDealinSpecialCards(0,0);
if (objPerSave.debugMod) {
	if (show_question("Kaynnistetaanko ajastin?")) {
		alarm_set(1,room_speed*turnTimer); // Turn start timer
		if (instance_exists(objAIdriver)) {
			with(objAIdriver) {
				alarm_set(1, room_speed*objArenaController.turnTimer - 60);
			}
		}
	}
} else {
	
	if (objPerSave.isAttacking != objPerSave.isTurn) {
		alarm_set(5,room_speed*turnTimer-2*room_speed);
	}
	else {
		if audio_is_playing(objSoundController.sound_pretheme) {
			audio_stop_sound(objSoundController.sound_pretheme);
		}
		if audio_is_playing(souBattle1) {
			audio_stop_sound(souBattle1);
		}
		var random_sound_theme = irandom(array_length_1d(objSoundController.sound_theme_array)-1);
		objSoundController.sound_theme = objSoundController.sound_theme_array[random_sound_theme];
		audio_play_sound(objSoundController.sound_theme, 1, true);
		if objMusic.music {
			audio_sound_gain(objSoundController.sound_theme, 0.5, 0);
		}
		else {
			audio_sound_gain(objSoundController.sound_theme, 0, 0);
		}
	}
	
	alarm_set(4,room_speed*turnTimer-3*room_speed);
	
	alarm_set(1,room_speed*turnTimer); // Turn start timer
	if (instance_exists(objAIdriver)) {
		with(objAIdriver) {
			alarm_set(1, room_speed*objArenaController.turnTimer - 60);
		}
	}
}

