/// @description Start of turn alarm

instance_destroy(objBackFlash);
canTurn = true;
if (instance_exists(objAIdriver)) {objAIdriver.arenaAlarm0 = 0;}
alarm_set(1,room_speed*turnTimer); // Turn start timer
