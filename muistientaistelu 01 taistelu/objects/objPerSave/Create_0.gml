/// @description Insert description here
// You can write your code in this editor
randomize();
//instance_create_depth(room_width/2-219,room_height/2-100,-5, objTextboxBG)
playerName = "";
isAttacking = 0; //Tells attacking player
isTurn = 0;
p1Coin = 0;
p2Coin = 0;
firstTurn = true;
AI = false; // Is AI on
p1Health = 100;
p2Health = 100;


p1Score = ds_list_create();
p2Score = ds_list_create();

//Player1 Specialcards
var Spessu = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];

//Checking if the Special cards data file exists
if (file_exists(working_directory+"\specialcards.json")) {
	//show_message("Löytyi!");
	scrJsonToGame();
} else {
	show_message("Ei löytynyt!");
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
p1SpecialEffect = noone;
p1LastingSpecialEffect = noone;
p2SpecialEffect = noone;
p2LastingSpecialEffect = noone;