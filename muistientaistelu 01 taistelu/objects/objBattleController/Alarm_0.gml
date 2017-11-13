/// @description Insert description here
// You can write your code in this editor

//Get player scores
var player1Score = objPerSave.p1Score;
var player2Score = objPerSave.p2Score;

//Total scores
var player1Total = 0;
var player2Total = 0;

//Get attacking player
var attackingPlayer = objPerSave.isAttacking;

//Player HP
var p1HP = objPerSave.p1Health;
var p2HP = objPerSave.p2Health;

//Damage
var damageAmount = 0;

//Calculate total scores 
for (var i = 0; i<ds_list_size(player1Score); i+=1) {
	var player1Total = player1Total + ds_list_find_index(player1Score,i);
}

for (var i = 0; i<ds_list_size(player2Score); i+=1) {
	var player2Total = player2Total + ds_list_find_index(player2Score,i);
}

//Compare total scores with each other and decide the winner and calculate damages 
if(player1Total > player2Total)
{
	show_message("Player 1 won!");
	if(attackingPlayer = 1)
	{
		damageAmount = player1Total - player2Total;
		p2HP = p2HP - damageAmount;
	}
}
else if(player2Total > player1Total)
{
	show_message("Player 2 won!");
	if(attackingPlayer = 2)
	{
		damageAmount = player2Total - player1Total;
		p1HP = p1HP - damageAmount;
	}
}
else if(player2Total == player1Total)
{
	show_message("It's a tie!");
}

objPerSave.p1Health = p1HP;
objPerSave.p2Health = p2HP;

if(p1HP <= 0)
{
	show_message("Player 1 is dead! Game Over!");
	room_goto(rooMain);
}
else if(p2HP <= 0)
{
	show_message("Player 2 is dead! Game Over!");
	room_goto(rooMain);
}
