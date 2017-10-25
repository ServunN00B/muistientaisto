/// @description Battle text
alarmi1 = alarm_get(1);
if (floor(alarm_get(0)/room_speed)> 0) {
	switch(isTurn) {
		case 1:
			msg = string("Player 1, Prepare!");
			
			draw_text_transformed(objTimeHolder.x-string_width(msg)/2, objTimeHolder.y-string_height(msg)/2, msg, 1.5, 1.5, 0);
			break;
		case 2:
			//draw_text(objTimeHolder.x, objTimeHolder.y, "Player 2, Prepare!");
			
			msg = string("Player 2, Prepare!");
			
			draw_text_transformed(objTimeHolder.x-string_width(msg)/2, objTimeHolder.y-string_height(msg)/2, msg, 1.5, 1.5, 0);
			break;
	
	}
	time = string(floor(alarm_get(0)/room_speed));
	draw_text_transformed(objTimeHolder.x-string_width(time)/2, (objTimeHolder.y+50)-string_height(time)/2, time, 1.5, 1.5, 0);
	//draw_text(objTimeHolder.x, objTimeHolder.y,"Vuoro alkaa " + string(floor(alarm_get(0)/room_speed)));
} else {
	time = string(floor(alarm_get(1)/room_speed));
	//time.depth =-2;
	draw_text_transformed(objTimeHolder.x-string_width(time)/2, objTimeHolder.y-string_height(time)/2, time, 1.5, 1.5, 0);

//draw_text(objTimeHolder.x, objTimeHolder.y, string(floor(alarmi1/room_speed)));
}
/*
if (objPerSave.AI){
	draw_text(415,25,"Vaikeus " + string(objArenaController.aiDifficulty) + ". Erä " + string(objArenaController.aiRoundLimitNow +1) + "/" + string(objArenaController.aiRoundLimit));
}*/

//healths = string(objPerSave.p1Health);

draw_text(objPL1HP.x, objPL1HP.y, string(objPerSave.p1Health));

//healths = string(objPerSave.p2Health);
draw_text(objPL2HP.x, objPL2HP.y, string(objPerSave.p2Health));


/*
draw_text(415,45, "Player " + string(isTurn));

draw_text(30,600, "Player1 Score:" + string(p1ScoreInt));
draw_text(30,610, "Player1 Coins:" + string(objPerSave.p1Coin));
draw_text(objPL1HP.x, objPL1HP.y, objPerSave.p1Health);

draw_text(865,600, "Player2 Score:" + string(p2ScoreInt));
draw_text(865,610, "Player2 Coins:" + string(objPerSave.p2Coin));
draw_text(objPL2HP.x, objPL2HP.y, objPerSave.p2Health);*/