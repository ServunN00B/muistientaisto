/// @description Battle text

if (floor(alarm_get(0)/room_speed)> 0) {
draw_text(415,35,"Vuoro alkaa " + string(floor(alarm_get(0)/room_speed)));
} else {
draw_text(415,35,"Aikaa jäljellä " + string(floor(alarm_get(1)/room_speed)));
}
draw_text(415,45, "Player " + string(isTurn));

draw_text(30,600, "Player1 Score:" + string(p1Score));
draw_text(30,610, "Player1 Gold:" + string(objPerSave.p1Gold));

draw_text(865,600, "Player2 Score:" + string(p2Score));
draw_text(865,610, "Player2 Gold:" + string(objPerSave.p2Gold));