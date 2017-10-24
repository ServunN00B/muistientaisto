//chancing turn
alarm_set(1,-1);
alarm_set(0,room_speed*objArenaController.preturnTimer); // Turn start timer
if (instance_exists(objAIdriver)){instance_destroy(objAIdriver);}
instance_create_layer(1,1,layer_get_id("Instances"),objAIdriver);
if (instance_exists(objAIdriver)) {objAIdriver.arenaAlarm0 = 1;}

//resetting table
instance_destroy(objNormalCard);
scrDealingCards();