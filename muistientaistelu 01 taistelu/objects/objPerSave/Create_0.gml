/// @description Insert description here
// You can write your code in this editor
randomize();
//Enums used thourgh the game
enum spShortCut { SpecialEffect, LastingSpecialEffect, dsScore, SpeCardUsed, SpecialCards };

//Players stats
playerName = "";
playerCards = [];
playerWins = 0;
playerLose = 0;
playerTotal = 0;

//Player Profile
instance_create_depth(room_width/2-219,room_height/2-100,-5, objTextboxBG)

isAttacking = 0; //Tells attacking player
isTurn = 0;
p1Coin = 0;
p2Coin = 0;
firstTurn = true;
AI = false; // Is AI on
debugMod = false;

//Basic Options for game
	basicStartHealth = 20;
	// for turns
	SCardSelectTimer = 15; //seconds
	preturnTimer = 3; // seconds
	turnTimer = 20; // seconds
	flipTimer = 0.7;//flipping timer
	aiDifficulty = 0; //AI default difficulty
	aiDifficultyArray = [20, 40, 60, 80, 100]; //Difficulty levels for AI
	
//Checking for Options ini for modified options
scrOptionsini();
p1StartHealth = basicStartHealth;
p2StartHealth = basicStartHealth;
p1Health = basicStartHealth;
p2Health = basicStartHealth;


p1Score = ds_list_create();
p2Score = ds_list_create();

//Creating list of cards Available in game
cardsInUse = ds_list_create();


//All Specialcards
var Spessu = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];

//Checking if the Special cards data file exists
if (file_exists(working_directory+"\specialcards.json")) {
	if (objPerSave.debugMod) {
		show_message("Löytyi!");
	}
	scrJsonToGame();
} else {
	if (objPerSave.debugMod) {
		show_message("Ei löytynyt!");
	}
}



dsP1SpecialCardsAvailable = ds_list_create();
dsP1SpecialCards = ds_list_create();
for (var j=0; j<array_length_1d(Spessu); j+=1){
ds_list_add(dsP1SpecialCardsAvailable,Spessu[j]);
}

//Player2 Specialcards
dsP2SpecialCardsAvailable = ds_list_create();
dsP2SpecialCards = ds_list_create();
for (j=0; j<array_length_1d(Spessu); j+=1){
ds_list_add(dsP2SpecialCardsAvailable,Spessu[j]);
}

//Special card effects
p1SpecialEffect = -1;
p1LastingSpecialEffect = false;
p2SpecialEffect = -1;
p2LastingSpecialEffect = false;
vortex = false;
scriptDone = true;