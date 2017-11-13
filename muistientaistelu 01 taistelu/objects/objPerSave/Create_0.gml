/// @description Insert description here
// You can write your code in this editor

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
var Spessu = [0,1,2,3,4,5];
SpessuSpr = [sprChicken, sprDouble, sprWeakSpot, sprPoison, sprCurse, sprVortex];
dsP1SpecialCards = ds_list_create();
for (var j=0; j<array_length_1d(Spessu); j+=1){
ds_list_add(dsP1SpecialCards,Spessu[j]);
}
ds_list_shuffle(dsP1SpecialCards);

//Player2 Specialcards
dsP2SpecialCards = ds_list_create();
for (j=0; j<array_length_1d(Spessu); j+=1){
ds_list_add(dsP2SpecialCards,Spessu[j]);
}
ds_list_shuffle(dsP1SpecialCards);

//Special card effects
p1SpecialEffect = 0;
p1LastingSpecialEffect = 0;
p2SpecialEffect = 0;
p2LastingSpecialEffect = 0;