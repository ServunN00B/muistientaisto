/// @description In the begining of a battle

// Save Health data

pl1Hbar = objPL1Healthbar.image_xscale;
pl2Hbar = objPL2Healthbar.image_xscale;

// Randomizing seed
randomize()

// Making deck of cards
var carddeck = [3,3,2,2,2,2,1,1,1,1,1,1,0,0,0,0,0,0,0,0];

// Listing deck of cards for suffle
dsCarddeck = ds_list_create();
for (i=0; i<array_length_1d(carddeck); i+=1){
ds_list_add(dsCarddeck,carddeck[i]);
}


// Variables for battle
canTurn = false; // Can cards be turned

// for checking pairs
isPair = 0; // Value of turned card
instID = 0; // ID of turned cards instance

// for drawing
draw_set_alpha(1);
draw_set_color(c_white);



// for turns
SCardSelectTimer = 15; //seconds
preturnTimer = 3; // seconds
turnTimer = 20; // seconds
flipTimer = room_speed*1;//flipping timer

//if (objPerSave.isAttacking = 0) {
	//if (objPerSave.AI) {coinFlip = 2;} else { 
	coinFlip = floor(random_range(1,3)); //}
	objPerSave.isAttacking = coinFlip; // Player which is Attacking
	objPerSave.isTurn = coinFlip; // Player which is active
	if(objPerSave.isTurn = 2) { 
		objPL1Glow.visible = false;
		objPL2Glow.visible = true;
		if (objPerSave.AI) {
			instance_create_layer(1,1,layer_get_id("Instances"),objAIdriver);
			if (instance_exists(objAIdriver)) {objAIdriver.arenaAlarm0 = 1;}
		}
	} else {
		objPL1Glow.visible = true;
		objPL2Glow.visible = false;
		if (objPerSave.AI) {
			instance_create_layer(1,1,layer_get_id("Instances"),objAIdriver);
			if (instance_exists(objAIdriver)) {objAIdriver.arenaAlarm0 = 1;}
		}
	}
// for scoring
//Player One score
p1ScoreInt = 0;
//Player Two score
p2ScoreInt = 0;
//Ai Difficulty
aiDifficulty = 0;
//AI Debugin variables
aiRoundLimit = 10;
aiRoundLimitNow = aiRoundLimit -1;
aiRoundKA = 0;
alarmi1 = 0;

if(objPerSave.firstTurn){
	//Starting count down on special card selection
	alarm_set(2,room_speed*SCardSelectTimer); 
	//SpeCard choosing variables
	ChoosingPlayer = objPerSave.isAttacking;
	//Deal Special cards for selection
	scrSpeCardSelectDeal();
} else {
	alarm_set(0,room_speed*preturnTimer);
}

