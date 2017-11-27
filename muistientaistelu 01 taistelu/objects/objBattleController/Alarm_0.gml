/// @description Insert description here
// You can write your code in this editor

//Get Specialcard effect that effect after battle
var p1LastEffect = objPerSave.p1LastingSpecialEffect;
var p2LastEffect = objPerSave.p2LastingSpecialEffect;

//Get index of played Specialcard
var p1Specialcard = objPerSave.p1SpecialEffect;
var p2Specialcard = objPerSave.p2SpecialEffect;

// Damage modifiers

var p1damage = 0;
var p2damage = 0;
//Checking if there is effects that effect the score calculation
if (p1LastEffect){
	switch (p1Specialcard) {
				case 14:
					var ol = ds_list_size(objPerSave.p2Score);
					if (ol < 0) {
						var rand = floor(random_range(1,ol))-1;
						var sco = ds_list_find_value(objPerSave.p2Score,rand);
						ds_list_delete(objPerSave.p2Score,rand);
						ds_list_add(objPerSave.p1Score,sco);
						objPerSave.p1LastingSpecialEffect = false;
					}
				break;
				
				case 17:
					for (var i = 0; i<ds_list_size(objPerSave.p2Score); i+=1) {
						p2damage = p2damage + ds_list_find_value(objPerSave.p2Score,i);
					}
					ds_list_clear(objPerSave.p2Score);
					objPerSave.p1LastingSpecialEffect = false;
					break;
				
				default:
					objPerSave.isTurn = 1;
					objPerSave.scriptDone = false;
					scrSpecialCards(p1Specialcard);
					while(!objPerSave.scriptDone) {
						
					}
					break;
	}
}
if (p2LastEffect){
	switch (p2Specialcard) {
				case 14:
					var ol = ds_list_size(objPerSave.p1Score);
					if (ol < 0) {
						var rand = floor(random_range(1,ol))-1;
						var sco = ds_list_find_value(objPerSave.p1Score,rand);
						ds_list_delete(objPerSave.p1Score,rand);
						ds_list_add(objPerSave.p2Score,sco);
						objPerSave.p2LastingSpecialEffect = false;
					}
				break;
				
				case 17:
					for (var i = 0; i<ds_list_size(objPerSave.p1Score); i+=1) {
						p1damage = p1damage + ds_list_find_value(objPerSave.p1Score,i);
					}
					ds_list_clear(objPerSave.p1Score);
					objPerSave.p2LastingSpecialEffect = false;
					break;
				
				default:
					objPerSave.isTurn = 2;
					objPerSave.scriptDone = false;
					scrSpecialCards(p2Specialcard);
					while(!objPerSave.scriptDone) {
						
					}
					break;
	}	
}

//Getting last effect again incase it has changed
p1LastEffect = objPerSave.p1LastingSpecialEffect;
p2LastEffect = objPerSave.p2LastingSpecialEffect;

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
var p1Highest = 0;
var p2Highest = 0;

//Calculate total scores 
for (var i = 0; i<ds_list_size(player1Score); i+=1) {
	if (ds_list_find_value(player1Score,i) > p1Highest) {
		p1Highest = ds_list_find_value(player1Score,i);
	}
	player1Total = player1Total + ds_list_find_value(player1Score,i);
}

for (var i = 0; i<ds_list_size(player2Score); i+=1) {
	if (ds_list_find_value(player2Score,i) > p2Highest) {
		p2Highest = ds_list_find_value(player2Score,i);
	}
	player2Total = player2Total + ds_list_find_value(player2Score,i);
}
//(Debug)Show highest scores from both
if (objPerSave.debugMod) {
	var highest = @"Player 1 highest point was " + string(p1Highest) + ". " +
					"Player 2 highest point was " + string(p2Highest) + ".";
	show_message(highest);
}

//Sprites
p1sprite = noone;
p2sprite = noone;
var p1spriteIdle = noone;
var p2spriteIdle = noone;
var spriteSize = 0.3;

//Player Battle animations
if (attackingPlayer = 1) {
	// Player 1 Attacking animation
		switch(p1Highest) {
			case 0: 
				p1sprite = sprAnimIdleMace;
				p1spriteIdle = sprAnimIdle;
				break;
					
			case 1:
				p1sprite = sprAnimAttackDagger;
				p1spriteIdle = sprAnimIdleMace;
				break;
					
			case 2:
				p1sprite = sprAnimAttackSword;
				p1spriteIdle = sprAnimIdleMace;
				break;	
				
			default:
				p1sprite = sprAnimAttackMace;
				p1spriteIdle = sprAnimIdleMace;
				break;
		}
		
		//Player 2 defence animation
		switch(p2Highest) {
			case 0: 
				p2sprite = sprAnimEnemyAttackDaggerIdle;
				p2spriteIdle = sprAnimEnemyAttackDaggerIdle;
				break;
				
			default:
				p2sprite = sprAnimEnemyAttackDaggerIdle;
				p2spriteIdle = sprAnimEnemyAttackDaggerIdle;
				break;
		}
		
} else {
		// Player 2 Attacking animation
		switch(p2Highest) {
			case 0: 
				p2sprite = sprAnimEnemyAttackDaggerIdle;
				p2spriteIdle = sprAnimEnemyAttackDaggerIdle;
				break;
					
			case 1:
				p2sprite = sprAnimEnemyAttackDagger;
				p2spriteIdle = sprAnimEnemyAttackDaggerIdle;
				break;
					
			case 2:
				p2sprite = sprAnimEnemyAttackSword;
				p2spriteIdle = sprAnimEnemyAttackSwordIdle;
				break;	
				
			default:
				p2sprite = sprAnimEnemyAttackSword;
				p2spriteIdle = sprAnimEnemyAttackSwordIdle;
				break;
		}
		
		//Player 1 defence animation
		switch(p1Highest) {
			case 0: 
				p1sprite = sprAnimIdleDefence;
				p1spriteIdle = sprAnimIdle;
				break;
				
			default:
				p1sprite = sprAnimIdleDefence;
				p1spriteIdle = sprAnimIdle;
				break;
		}
}

with(objP1Fight) {
	sprite_index = p1spriteIdle;
	image_xscale = spriteSize;
	image_yscale = spriteSize;
}
with(objP2Fight) {
	sprite_index = p2spriteIdle;
	image_xscale = spriteSize;
	image_yscale = spriteSize;
}

alarm_set(2,28);

//Compare total scores with each other and decide the winner and calculate damages 
if(player1Total > player2Total)
{
	show_message("Player 1 won!");
	if(attackingPlayer = 1)
	{
		if (p1LastEffect)
		{
			if(p1Specialcard = 4) 
			{
				damageAmount = player1Total - player2Total;
				damageAmount += 2;
				p2HP = p2HP - damageAmount;
			}
		}
		else
		{
			damageAmount = player1Total - player2Total;
			p2HP = p2HP - damageAmount;
		}
		
	} 
	else 
	{
		if (p1LastEffect)
		{
			switch (p1Specialcard) {
				case 3:
					damageAmount = player1Total - player2Total;
					p2HP = p2HP + damageAmount;
					break;
				case 6:
					damageAmount = player1Total - player2Total;
					p2HP = p2HP - damageAmount;
					break;
			}
		}
	}
}
else if(player2Total > player1Total)
{
	show_message("Player 2 won!");
	if(attackingPlayer = 2)
	{
		if (p2LastEffect)
		{
			if(p2Specialcard = 4) 
			{
				damageAmount = player2Total - player1Total;
				damageAmount += 2;
				p1HP = p1HP - damageAmount;
			}
		}
		else
		{
		damageAmount = player2Total - player1Total;
		p1HP = p1HP - damageAmount;
		}
		
	} 
	else 
	{
		if (p2LastEffect)
		{
			switch (p2Specialcard) {
				case 3:
					damageAmount = player2Total - player1Total;
					p2HP = p2HP + damageAmount;
					break;
				case 6:
					damageAmount = player2Total - player1Total;
					p1HP = p1HP - damageAmount;
					break;
			}
		}
	}
}
else if(player2Total == player1Total)
{
	show_message("It's a tie!");
}
objPerSave.p1Health = p1HP - p2damage;
objPerSave.p2Health = p2HP - p1damage;

if(p1HP <= 0)
{
	show_message("Player 1 is dead! Game Over!");
	objPerSave.firstTurn = true;
	ds_list_clear(objPerSave.p1Score);
	ds_list_clear(objPerSave.p2Score);
	objPerSave.p1LastingSpecialEffect = false;
	objPerSave.p2LastingSpecialEffect = false;
	objPerSave.p1SpecialEffect = -1;
	objPerSave.p2SpecialEffect = -1;
	objPerSave.isAttacking = 0;
	ds_list_clear(objPerSave.dsP1SpecialCards);
	ds_list_clear(objPerSave.dsP2SpecialCards);
	room_goto(rooMain);
}
else if(p2HP <= 0)
{
	show_message("Player 2 is dead! Game Over!");
	objPerSave.firstTurn = true;
	ds_list_clear(objPerSave.p1Score);
	ds_list_clear(objPerSave.p2Score);
	objPerSave.p1LastingSpecialEffect = false;
	objPerSave.p2LastingSpecialEffect = false;
	objPerSave.p1SpecialEffect = -1;
	objPerSave.p2SpecialEffect = -1;
	objPerSave.isAttacking = 0;
	ds_list_clear(objPerSave.dsP1SpecialCards);
	ds_list_clear(objPerSave.dsP2SpecialCards);
	room_goto(rooMain);
}

ds_list_clear(objPerSave.p1Score);
ds_list_clear(objPerSave.p2Score);
objPerSave.p1LastingSpecialEffect = false;
objPerSave.p2LastingSpecialEffect = false;
objPerSave.p1SpecialEffect = -1;
objPerSave.p2SpecialEffect = -1;

if (objPerSave.isAttacking = 1) {
	objPerSave.isAttacking = 2;
	objPerSave.isTurn = 2;
} else {
	objPerSave.isAttacking = 1;
	objPerSave.isTurn = 1;
}