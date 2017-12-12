/// @description In the begining of a battle
countdown = 1;

if (objPerSave.debugMod) {
	instance_create_depth(1300,30,-10,restart);
}
view_x = camera_get_view_x(view_camera[0]);
view_y = camera_get_view_y(view_camera[0]);
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
		if (objPerSave.AI) {
			instance_create_layer(1,1,layer_get_id("Instances"),objAIdriver);
			if (instance_exists(objAIdriver)) {objAIdriver.arenaAlarm0 = 1;}
		}
	}
} else {
		if (objPerSave.AI) {
			if(objPerSave.isTurn = 2) { 
				instance_create_layer(1,1,layer_get_id("Instances"),objAIdriver);
				if (instance_exists(objAIdriver)) {objAIdriver.arenaAlarm0 = 1;}
			}
		}
} 
if (objPerSave.isTurn = 1) {
	objPL1Glow.visible = true;
	objPL2Glow.visible = false;
} else {
	objPL1Glow.visible = false;
	objPL2Glow.visible = true;
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
shake = false;
if(objPerSave.firstTurn){
	alarm_set(4,room_speed*SCardSelectTimer);
	//Starting count down on special card selection
	alarm_set(2,room_speed*SCardSelectTimer); 
	//SpeCard choosing variables
	ChoosingPlayer = objPerSave.isAttacking;
	//Deal Special cards for selection
	scrSpeCardSelectDeal();
	
} else {
	if audio_is_playing(souBattle1) {
		audio_sound_gain(souBattle1, 0, 2*1000);
		alarm_set(6,room_speed*2);
	}
	drawSelect = false;
	alarm_set(0,room_speed*preturnTimer);
	// Suffling and dealing cards in grid
	scrDealingCards();
}

