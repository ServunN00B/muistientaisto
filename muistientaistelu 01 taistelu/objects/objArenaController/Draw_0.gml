/// @description Battle text
alarmi1 = alarm_get(1);
if (floor(alarm_get(0)/room_speed)> 0) {
draw_text(objTime.x, objTime.y,"Vuoro alkaa " + string(floor(alarm_get(0)/room_speed)));
} else {
draw_text(objTime.x, objTime.y,"Aikaa jäljellä " + string(floor(alarmi1/room_speed)));
}

if (objPerSave.AI){
draw_text(415,25,"Vaikeus " + string(objArenaController.aiDifficulty) + ". Erä " + string(objArenaController.aiRoundLimitNow +1) + "/" + string(objArenaController.aiRoundLimit));
}

draw_text(415,45, "Player " + string(isTurn));

draw_text(30,600, "Player1 Score:" + string(p1ScoreInt));
draw_text(30,610, "Player1 Coins:" + string(objPerSave.p1Coin));
draw_text(objPlayerHP.x, objPlayerHP.y, objPerSave.p1Health);

draw_text(865,600, "Player2 Score:" + string(p2ScoreInt));
draw_text(865,610, "Player2 Coins:" + string(objPerSave.p2Coin));
draw_text(objEnemyHp.x, objEnemyHp.y, objPerSave.p2Health);