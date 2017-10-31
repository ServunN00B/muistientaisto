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
preturnTimer = 3; // seconds
turnTimer = 20 // seconds
flipTimer = room_speed*1;//flipping timer
alarm_set(0,room_speed*preturnTimer); // Turn start timer

if (objPerSave.isAttacking = 0) {
	if (objPerSave.AI) {coinFlip = 2;} else { coinFlip = floor(random_range(1,3));}
	isAttacking = coinFlip; // Player which is Attacking
	isTurn = coinFlip; // Player which is active
	if(isTurn = 2) { 
		objPL1Glow.visible = false;
		objPL2Glow.visible = true;
		if (objPerSave.AI) {
			window_set_cursor(cr_none); 
			instance_create_layer(1,1,layer_get_id("Instances"),objAIdriver);
			if (instance_exists(objAIdriver)) {objAIdriver.arenaAlarm0 = 1;}
		}
	} else {
		objPL1Glow.visible = true;
		objPL2Glow.visible = false;
	}
	
} else {
	isAttacking = objPerSave.isAttacking;
	isTurn = objPerSave.isAttacking;
	if(isTurn = 2) { 
		objPL1Glow.visible = false;
		objPL2Glow.visible = true;
		if (objPerSave.AI) {
			window_set_cursor(cr_none); 
			instance_create_layer(1,1,layer_get_id("Instances"),objAIdriver);
			if (instance_exists(objAIdriver)) {objAIdriver.arenaAlarm0 = 1;}
		}
	}else {
		objPL1Glow.visible = true;
		objPL2Glow.visible = false;
	}
}
// Suffling and dealing cards in grid
scrDealingCards();
// for scoring
//Player One score
p1ScoreInt = 0;
//Player Two score
p2ScoreInt = 0;

aiDifficulty = 0;
aiRoundLimit = 10;
aiRoundLimitNow = aiRoundLimit -1;
aiRoundKA = 0;
alarmi1 = 0;