/// @description Start of turn alarm

instance_destroy(objBackFlash);
canTurn = true;
if (instance_exists(objAIdriver)) {objAIdriver.arenaAlarm0 = 0;}
scrDealinSpecialCards(0,0);
if (objPerSave.debugMod) {
	if (show_question("Kaynnistetaanko ajastin?")) {
		alarm_set(1,room_speed*turnTimer); // Turn start timer
	}
} else {
	alarm_set(1,room_speed*turnTimer); // Turn start timer
}
