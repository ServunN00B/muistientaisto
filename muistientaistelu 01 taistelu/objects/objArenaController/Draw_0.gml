/// @description Battle text
alarmi1 = alarm_get(1);


if (floor(alarm_get(0)/room_speed)> -1) {
	switch(objPerSave.isTurn) {
		case 1:
			msg = string("Player 1, Prepare!");

			//draw_text_transformed(objTimeHolder.x-string_width(msg)/2, objTimeHolder.y-string_height(msg)/2, msg, 1.5, 1.5, 0);
			break;
		case 2:
			//msg = string("Player 2, Prepare!");
			//draw_text_transformed(objTimeHolder.x-string_width(msg)/2, objTimeHolder.y-string_height(msg)/2, msg, 1.5, 1.5, 0);
			break;
	
	}
	
	time = string("Turn starts in " + string(floor(alarm_get(0)/room_speed)));
	//time.depth =-10;
	draw_text_transformed((objTimeHolder.x-40)-string_width(time)/2, objTimeHolder.y -string_height(time)/2, time, 1.5, 1.5, 0);
	//draw_text(objTimeHolder.x, objTimeHolder.y,"Vuoro alkaa " + string(floor(alarm_get(0)/room_speed)));
} else {
	time = string(floor(alarm_get(1)/room_speed));
//	time.depth =-10;
	//time.depth =-2;
	draw_text_transformed(objTimeHolder.x-string_width(time)/2, objTimeHolder.y-string_height(time)/2, time, 1.5, 1.5, 0);

//draw_text(objTimeHolder.x, objTimeHolder.y, string(floor(alarmi1/room_speed)));
}
/* Healthbar stuff...
var pc;
pc = (50 / 100) * 100;
draw_healthbar(100, 100, 500, 200, pc, c_black, c_red, c_lime, 0, true, true)
*/
/*
if (objPerSave.AI){
	draw_text(415,25,"Vaikeus " + string(objArenaController.aiDifficulty) + ". Erä " + string(objArenaController.aiRoundLimitNow +1) + "/" + string(objArenaController.aiRoundLimit));
}*/

//healths = string(objPerSave.p1Health);
p1 = objPerSave.p1Health/objPerSave.p1StartHealth;
p2 = objPerSave.p2Health/objPerSave.p2StartHealth;
//show_debug_message("scale is " + string(p1*pl1Hbar) + " : "+ string(pl1Hbar));

objPL1Healthbar.image_xscale = p1*pl1Hbar;
objPL2Healthbar.image_xscale = p2*pl2Hbar;

if(objPerSave.p1Health < 30) {
	objPlayerIcon.sprite_index = sprPL1Damaged;
	if(objPerSave.p2Health > 30) {
		objEnemyIcon.sprite_index = sprPL2Winning;
	}
}

if(objPerSave.p2Health < 30) {
	objEnemyIcon.sprite_index = sprPL2Damaged;
	if(objPerSave.p1Health > 30) {
		objPlayerIcon.sprite_index = sprPL1Winning;
	}
}

draw_text(objPL1HP.x, objPL1HP.y, string(objPerSave.p1Health));

//healths = string(objPerSave.p2Health);
draw_text(objPL2HP.x, objPL2HP.y, string(objPerSave.p2Health));


/*
draw_text(415,45, "Player " + string(objPerSave.isTurn));

draw_text(30,600, "Player1 Score:" + string(p1ScoreInt));
draw_text(30,610, "Player1 Coins:" + string(objPerSave.p1Coin));
draw_text(objPL1HP.x, objPL1HP.y, objPerSave.p1Health);

draw_text(865,600, "Player2 Score:" + string(p2ScoreInt));
draw_text(865,610, "Player2 Coins:" + string(objPerSave.p2Coin));
draw_text(objPL2HP.x, objPL2HP.y, objPerSave.p2Health);*/