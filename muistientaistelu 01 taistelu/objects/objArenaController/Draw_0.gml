/// @description Battle text
alarmi1 = alarm_get(1);

if (floor(alarm_get(0)/room_speed)> -1) { //
	time = string("Turn starts in " + string(floor(alarm_get(0)/room_speed)));
	objTurnChangeHolder.visible = true;
	draw_text_transformed((objTurnChangeHolder.x+50), objTurnChangeHolder.y+150, time, 1.5, 1.5, 0);
} else { // Turn has started.
	objTurnChangeHolder.visible = false;
	time = string(floor(alarm_get(1)/room_speed));
	draw_text_transformed(objTimeHolder.x-string_width(time)/2, objTimeHolder.y-string_height(time)/2, time, 1.5, 1.5, 0);
}


// Scale healthbar to show how much health each player has
p1 = objPerSave.p1Health/objPerSave.p1StartHealth;
p2 = objPerSave.p2Health/objPerSave.p2StartHealth;

objPL1Healthbar.image_xscale = p1*pl1Hbar;
objPL2Healthbar.image_xscale = p2*pl2Hbar;

// Change icon according to how much health each player has.
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
// Write health amount for both players
draw_text(objPL1HP.x, objPL1HP.y, string(objPerSave.p1Health));
draw_text(objPL2HP.x, objPL2HP.y, string(objPerSave.p2Health));

