/// @description In the begining of a battle
if (objPerSave.debugMod) {
	instance_create_depth(1300,30,-10,restart);
}
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
SCardSelectTimer = objPerSave.SCardSelectTimer;
preturnTimer = objPerSave.preturnTimer;
turnTimer = objPerSave.turnTimer;
flipTimer = objPerSave.flipTimer;

//if (objPerSave.isAttacking = 0) {
	//if (objPerSave.AI) {coinFlip = 2;} else { 
if (objPerSave.firstTurn) {
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
	}
} else {
		objPL1Glow.visible = true;
		objPL2Glow.visible = false;
		if (objPerSave.AI) {
			if(objPerSave.isTurn = 2) { 
				instance_create_layer(1,1,layer_get_id("Instances"),objAIdriver);
				if (instance_exists(objAIdriver)) {objAIdriver.arenaAlarm0 = 1;}
			}
		}
} 
// for scoring
//Player One var
p1SpeCardUsed = false;
p1ScoreInt = 0;
//Player Two var
p2SpeCardUsed = false;
p2ScoreInt = 0;
//Ai Difficulty
aiDifficulty = 0;
//AI Debugin variables
aiRoundLimit = 10;
aiRoundLimitNow = aiRoundLimit -1;
aiRoundKA = 0;
alarmi1 = 0;
drawSelect = true;
aikaJ = -1;
firstDeal = true;
if(objPerSave.firstTurn){
	//Starting count down on special card selection
	alarm_set(2,room_speed*SCardSelectTimer); 
	//SpeCard choosing variables
	ChoosingPlayer = objPerSave.isAttacking;
	//Deal Special cards for selection
	scrSpeCardSelectDeal();
} else {
	drawSelect = false;
	alarm_set(0,room_speed*preturnTimer);
	ds_list_add(objSound.allSounds,sound0);
	ds_list_add(objMusic.allMusic ,sound0);
	if(sound) {
		if (music) {
			audio_play_sound(sound0,1,true);
		}
	}
	// Suffling and dealing cards in grid
	scrDealingCards();
}

