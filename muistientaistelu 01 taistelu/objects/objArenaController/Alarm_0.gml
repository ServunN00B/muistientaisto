/// @description Start of turn alarm

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
	alarm_set(1,room_speed*turnTimer); // Turn start timer
	if (instance_exists(objAIdriver)) {
		with(objAIdriver) {
			alarm_set(1, room_speed*objArenaController.turnTimer - 60);
		}
	}
}
