/// @description Cooldown between turning cards

if (found = false) {
	self.sprite_index = sprTurnAnimReverse;
	alarm_set(3, 10);
				scaling = true;
				alarm_set(4, 1);
		if (objArenaController.instID != 0) {
		with(objArenaController.instID) {
			self.sprite_index = sprTurnAnimReverse;
			alarm_set(3, 10);
				scaling = true;
				alarm_set(4, 1);
		}
			//variable_instance_set(objArenaController.instID,"sprite_index",sprBackside);
		}
	objArenaController.instID = 0;
}
objArenaController.canTurn = true;
if (instance_exists(objAIdriver)) {objAIdriver.normalAlarm0 = 0;}
